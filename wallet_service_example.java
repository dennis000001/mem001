package com.example.wallet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.retry.annotation.Retryable;
import org.springframework.retry.annotation.Backoff;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;

import java.math.BigDecimal;
import java.util.concurrent.TimeUnit;

/**
 * 钱包服务实现类
 * 演示如何避免分布式并发场景下的死锁问题
 */
@Service
public class WalletService {

    @Autowired
    private WalletBalanceMapper walletBalanceMapper;
    
    @Autowired
    private WalletTransactionMapper walletTransactionMapper;
    
    @Autowired
    private RedissonClient redissonClient;

    /**
     * 方案一：使用乐观锁进行钱包余额更新
     * 通过version字段避免死锁，失败时重试
     */
    @Retryable(value = {OptimisticLockException.class}, maxAttempts = 3, backoff = @Backoff(delay = 100))
    @Transactional
    public void updateBalanceWithOptimisticLock(String walletId, BigDecimal centerAmount, BigDecimal venueAmount) {
        // 1. 查询当前余额和版本号
        WalletBalance currentBalance = walletBalanceMapper.selectByWalletId(walletId);
        if (currentBalance == null) {
            throw new RuntimeException("钱包不存在: " + walletId);
        }

        // 2. 计算新余额
        BigDecimal newCenterBalance = currentBalance.getCenterBalance().add(centerAmount);
        BigDecimal newVenueBalance = currentBalance.getVenueBalance().add(venueAmount);

        // 3. 余额校验
        if (newCenterBalance.compareTo(BigDecimal.ZERO) < 0 || newVenueBalance.compareTo(BigDecimal.ZERO) < 0) {
            throw new RuntimeException("余额不足");
        }

        // 4. 使用乐观锁更新
        int updateCount = walletBalanceMapper.updateBalanceWithVersion(
                walletId, 
                newCenterBalance, 
                newVenueBalance, 
                currentBalance.getVersion()
        );

        if (updateCount == 0) {
            throw new OptimisticLockException("乐观锁冲突，重试中...");
        }

        // 5. 记录交易流水
        recordTransaction(walletId, centerAmount, venueAmount, currentBalance);
    }

    /**
     * 方案二：使用分布式锁确保操作原子性
     * 适用于复杂的跨表操作场景
     */
    @Transactional
    public void updateBalanceWithDistributedLock(String walletId, BigDecimal centerAmount, BigDecimal venueAmount) {
        String lockKey = "wallet_lock:" + walletId;
        RLock lock = redissonClient.getLock(lockKey);

        try {
            // 尝试获取分布式锁，最多等待10秒，锁持有时间30秒
            if (lock.tryLock(10, 30, TimeUnit.SECONDS)) {
                try {
                    // 1. 查询当前余额
                    WalletBalance currentBalance = walletBalanceMapper.selectByWalletId(walletId);
                    if (currentBalance == null) {
                        throw new RuntimeException("钱包不存在: " + walletId);
                    }

                    // 2. 计算新余额
                    BigDecimal newCenterBalance = currentBalance.getCenterBalance().add(centerAmount);
                    BigDecimal newVenueBalance = currentBalance.getVenueBalance().add(venueAmount);

                    // 3. 余额校验
                    if (newCenterBalance.compareTo(BigDecimal.ZERO) < 0 || newVenueBalance.compareTo(BigDecimal.ZERO) < 0) {
                        throw new RuntimeException("余额不足");
                    }

                    // 4. 更新余额（无需版本控制，因为已有分布式锁保护）
                    walletBalanceMapper.updateBalance(walletId, newCenterBalance, newVenueBalance);

                    // 5. 记录交易流水
                    recordTransaction(walletId, centerAmount, venueAmount, currentBalance);

                } finally {
                    lock.unlock();
                }
            } else {
                throw new RuntimeException("获取分布式锁失败，请稍后重试");
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new RuntimeException("分布式锁等待被中断", e);
        }
    }

    /**
     * 方案三：分离存储 + 乐观锁
     * 将中心钱包和场馆钱包分别存储，减少锁竞争
     */
    @Transactional
    public void updateBalanceWithSeparateStorage(String walletId, BigDecimal centerAmount, BigDecimal venueAmount) {
        boolean success = false;
        int retryCount = 0;
        int maxRetries = 3;

        while (!success && retryCount < maxRetries) {
            try {
                // 1. 分别更新中心钱包和场馆钱包
                if (centerAmount.compareTo(BigDecimal.ZERO) != 0) {
                    updateCenterWallet(walletId, centerAmount);
                }
                
                if (venueAmount.compareTo(BigDecimal.ZERO) != 0) {
                    updateVenueWallet(walletId, venueAmount);
                }

                success = true;
            } catch (OptimisticLockException e) {
                retryCount++;
                if (retryCount >= maxRetries) {
                    throw new RuntimeException("更新失败，超过最大重试次数", e);
                }
                // 短暂等待后重试
                try {
                    Thread.sleep(100 + (retryCount * 50)); // 递增等待时间
                } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                    throw new RuntimeException("重试等待被中断", ie);
                }
            }
        }
    }

    /**
     * 钱包转账操作
     * 演示如何处理复杂的转账场景，避免死锁
     */
    @Transactional
    public void transfer(String fromWalletId, String toWalletId, 
                        WalletType fromWalletType, WalletType toWalletType, 
                        BigDecimal amount) {
        
        // 使用钱包ID排序确保锁顺序一致，避免死锁
        String firstWalletId = fromWalletId.compareTo(toWalletId) < 0 ? fromWalletId : toWalletId;
        String secondWalletId = fromWalletId.compareTo(toWalletId) < 0 ? toWalletId : fromWalletId;

        String firstLockKey = "wallet_lock:" + firstWalletId;
        String secondLockKey = "wallet_lock:" + secondWalletId;

        RLock firstLock = redissonClient.getLock(firstLockKey);
        RLock secondLock = redissonClient.getLock(secondLockKey);

        try {
            // 按顺序获取锁，避免死锁
            if (firstLock.tryLock(10, 30, TimeUnit.SECONDS)) {
                try {
                    if (secondLock.tryLock(10, 30, TimeUnit.SECONDS)) {
                        try {
                            // 执行转账操作
                            performTransfer(fromWalletId, toWalletId, fromWalletType, toWalletType, amount);
                        } finally {
                            secondLock.unlock();
                        }
                    } else {
                        throw new RuntimeException("获取目标钱包锁失败");
                    }
                } finally {
                    firstLock.unlock();
                }
            } else {
                throw new RuntimeException("获取源钱包锁失败");
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new RuntimeException("转账操作被中断", e);
        }
    }

    /**
     * 执行实际的转账操作
     */
    private void performTransfer(String fromWalletId, String toWalletId,
                               WalletType fromWalletType, WalletType toWalletType,
                               BigDecimal amount) {
        
        // 1. 从源钱包扣款
        BigDecimal fromCenterAmount = fromWalletType == WalletType.CENTER ? amount.negate() : BigDecimal.ZERO;
        BigDecimal fromVenueAmount = fromWalletType == WalletType.VENUE ? amount.negate() : BigDecimal.ZERO;
        
        // 2. 向目标钱包加款
        BigDecimal toCenterAmount = toWalletType == WalletType.CENTER ? amount : BigDecimal.ZERO;
        BigDecimal toVenueAmount = toWalletType == WalletType.VENUE ? amount : BigDecimal.ZERO;

        // 3. 执行余额更新
        walletBalanceMapper.updateBalance(fromWalletId, 
            walletBalanceMapper.selectByWalletId(fromWalletId).getCenterBalance().add(fromCenterAmount),
            walletBalanceMapper.selectByWalletId(fromWalletId).getVenueBalance().add(fromVenueAmount)
        );

        walletBalanceMapper.updateBalance(toWalletId,
            walletBalanceMapper.selectByWalletId(toWalletId).getCenterBalance().add(toCenterAmount),
            walletBalanceMapper.selectByWalletId(toWalletId).getVenueBalance().add(toVenueAmount)
        );

        // 4. 记录转账流水
        recordTransferTransaction(fromWalletId, toWalletId, fromWalletType, toWalletType, amount);
    }

    /**
     * 更新中心钱包余额
     */
    private void updateCenterWallet(String walletId, BigDecimal amount) {
        CenterWalletBalance centerWallet = centerWalletMapper.selectByWalletId(walletId);
        if (centerWallet == null) {
            throw new RuntimeException("中心钱包不存在: " + walletId);
        }

        BigDecimal newBalance = centerWallet.getBalance().add(amount);
        if (newBalance.compareTo(BigDecimal.ZERO) < 0) {
            throw new RuntimeException("中心钱包余额不足");
        }

        int updateCount = centerWalletMapper.updateBalanceWithVersion(
            walletId, newBalance, centerWallet.getVersion()
        );

        if (updateCount == 0) {
            throw new OptimisticLockException("中心钱包乐观锁冲突");
        }
    }

    /**
     * 更新场馆钱包余额
     */
    private void updateVenueWallet(String walletId, BigDecimal amount) {
        VenueWalletBalance venueWallet = venueWalletMapper.selectByWalletId(walletId);
        if (venueWallet == null) {
            throw new RuntimeException("场馆钱包不存在: " + walletId);
        }

        BigDecimal newBalance = venueWallet.getBalance().add(amount);
        if (newBalance.compareTo(BigDecimal.ZERO) < 0) {
            throw new RuntimeException("场馆钱包余额不足");
        }

        int updateCount = venueWalletMapper.updateBalanceWithVersion(
            walletId, newBalance, venueWallet.getVersion()
        );

        if (updateCount == 0) {
            throw new OptimisticLockException("场馆钱包乐观锁冲突");
        }
    }

    /**
     * 记录交易流水
     */
    private void recordTransaction(String walletId, BigDecimal centerAmount, BigDecimal venueAmount, 
                                 WalletBalance beforeBalance) {
        if (centerAmount.compareTo(BigDecimal.ZERO) != 0) {
            WalletTransaction centerTransaction = new WalletTransaction();
            centerTransaction.setTransactionId(generateTransactionId());
            centerTransaction.setWalletId(walletId);
            centerTransaction.setWalletType(WalletType.CENTER);
            centerTransaction.setAmount(centerAmount);
            centerTransaction.setBeforeBalance(beforeBalance.getCenterBalance());
            centerTransaction.setAfterBalance(beforeBalance.getCenterBalance().add(centerAmount));
            centerTransaction.setStatus(TransactionStatus.SUCCESS);
            
            walletTransactionMapper.insert(centerTransaction);
        }

        if (venueAmount.compareTo(BigDecimal.ZERO) != 0) {
            WalletTransaction venueTransaction = new WalletTransaction();
            venueTransaction.setTransactionId(generateTransactionId());
            venueTransaction.setWalletId(walletId);
            venueTransaction.setWalletType(WalletType.VENUE);
            venueTransaction.setAmount(venueAmount);
            venueTransaction.setBeforeBalance(beforeBalance.getVenueBalance());
            venueTransaction.setAfterBalance(beforeBalance.getVenueBalance().add(venueAmount));
            venueTransaction.setStatus(TransactionStatus.SUCCESS);
            
            walletTransactionMapper.insert(venueTransaction);
        }
    }

    /**
     * 记录转账交易流水
     */
    private void recordTransferTransaction(String fromWalletId, String toWalletId,
                                         WalletType fromWalletType, WalletType toWalletType,
                                         BigDecimal amount) {
        String transactionId = generateTransactionId();
        
        // 记录转出流水
        WalletTransaction outTransaction = new WalletTransaction();
        outTransaction.setTransactionId(transactionId + "_OUT");
        outTransaction.setWalletId(fromWalletId);
        outTransaction.setWalletType(fromWalletType);
        outTransaction.setTransactionType(TransactionType.TRANSFER_OUT);
        outTransaction.setAmount(amount.negate());
        outTransaction.setStatus(TransactionStatus.SUCCESS);
        walletTransactionMapper.insert(outTransaction);

        // 记录转入流水
        WalletTransaction inTransaction = new WalletTransaction();
        inTransaction.setTransactionId(transactionId + "_IN");
        inTransaction.setWalletId(toWalletId);
        inTransaction.setWalletType(toWalletType);
        inTransaction.setTransactionType(TransactionType.TRANSFER_IN);
        inTransaction.setAmount(amount);
        inTransaction.setStatus(TransactionStatus.SUCCESS);
        walletTransactionMapper.insert(inTransaction);
    }

    /**
     * 生成交易ID
     */
    private String generateTransactionId() {
        return "TXN" + System.currentTimeMillis() + Math.random();
    }

    /**
     * 乐观锁异常
     */
    public static class OptimisticLockException extends RuntimeException {
        public OptimisticLockException(String message) {
            super(message);
        }
    }

    /**
     * 钱包类型枚举
     */
    public enum WalletType {
        CENTER, VENUE
    }

    /**
     * 交易状态枚举
     */
    public enum TransactionStatus {
        PENDING, SUCCESS, FAILED
    }

    /**
     * 交易类型枚举
     */
    public enum TransactionType {
        DEPOSIT, WITHDRAW, TRANSFER_IN, TRANSFER_OUT
    }
}