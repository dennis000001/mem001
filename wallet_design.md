# 钱包系统设计文档

## 1. 表结构设计

### 1.1 钱包余额表 (wallet_balance)

```sql
CREATE TABLE wallet_balance (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    wallet_id VARCHAR(64) NOT NULL COMMENT '钱包ID',
    center_balance DECIMAL(20,8) NOT NULL DEFAULT 0 COMMENT '中心钱包余额',
    venue_balance DECIMAL(20,8) NOT NULL DEFAULT 0 COMMENT '场馆钱包余额',
    total_balance DECIMAL(20,8) GENERATED ALWAYS AS (center_balance + venue_balance) COMMENT '总余额',
    version BIGINT NOT NULL DEFAULT 0 COMMENT '版本号，用于乐观锁',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uk_wallet_id (wallet_id),
    INDEX idx_updated_at (updated_at)
) ENGINE=InnoDB COMMENT='钱包余额表';
```

### 1.2 钱包交易记录表 (wallet_transaction)

```sql
CREATE TABLE wallet_transaction (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    transaction_id VARCHAR(64) NOT NULL COMMENT '交易ID',
    wallet_id VARCHAR(64) NOT NULL COMMENT '钱包ID',
    transaction_type ENUM('DEPOSIT', 'WITHDRAW', 'TRANSFER_IN', 'TRANSFER_OUT') NOT NULL COMMENT '交易类型',
    wallet_type ENUM('CENTER', 'VENUE') NOT NULL COMMENT '钱包类型',
    amount DECIMAL(20,8) NOT NULL COMMENT '交易金额',
    before_balance DECIMAL(20,8) NOT NULL COMMENT '交易前余额',
    after_balance DECIMAL(20,8) NOT NULL COMMENT '交易后余额',
    status ENUM('PENDING', 'SUCCESS', 'FAILED') NOT NULL DEFAULT 'PENDING' COMMENT '交易状态',
    remark VARCHAR(255) COMMENT '备注',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uk_transaction_id (transaction_id),
    INDEX idx_wallet_id_created_at (wallet_id, created_at),
    INDEX idx_status (status)
) ENGINE=InnoDB COMMENT='钱包交易记录表';
```

## 2. 分布式并发场景下的死锁问题分析

### 2.1 死锁产生的原因

在分布式并发场景下，确实存在死锁的风险，主要原因：

1. **资源竞争顺序不一致**：
   - 事务A：先锁定中心钱包余额，再锁定场馆钱包余额
   - 事务B：先锁定场馆钱包余额，再锁定中心钱包余额

2. **多个字段同时更新**：
   - 转账操作需要同时更新两个余额字段
   - 不同事务可能以不同顺序获取锁

3. **长事务持锁时间过长**：
   - 复杂业务逻辑导致事务执行时间长
   - 增加死锁概率

### 2.2 典型死锁场景

#### 场景1：中心钱包转场馆钱包 vs 场馆钱包转中心钱包
```
时间点1: 事务A锁定center_balance (减少)
时间点2: 事务B锁定venue_balance (减少)  
时间点3: 事务A尝试锁定venue_balance (增加) - 等待事务B
时间点4: 事务B尝试锁定center_balance (增加) - 等待事务A
结果: 死锁
```

#### 场景2：并发充值到不同钱包类型
```
事务A: 充值到中心钱包，需要更新center_balance
事务B: 从场馆转到中心，需要更新venue_balance和center_balance
可能产生锁等待和死锁
```

## 3. 解决方案

### 3.1 方案一：统一锁顺序
```sql
-- 始终按照固定顺序获取锁，避免循环等待
-- 例如：总是先锁center_balance，再锁venue_balance
UPDATE wallet_balance 
SET center_balance = center_balance + ?, 
    venue_balance = venue_balance + ?,
    version = version + 1
WHERE wallet_id = ? AND version = ?;
```

### 3.2 方案二：乐观锁 + 重试机制
```sql
-- 使用version字段实现乐观锁
UPDATE wallet_balance 
SET center_balance = ?, 
    venue_balance = ?, 
    version = version + 1
WHERE wallet_id = ? AND version = ?;

-- 如果affected_rows = 0，说明版本冲突，需要重试
```

### 3.3 方案三：分离存储
```sql
-- 将中心钱包和场馆钱包分别存储，减少锁竞争
CREATE TABLE center_wallet_balance (
    wallet_id VARCHAR(64) PRIMARY KEY,
    balance DECIMAL(20,8) NOT NULL DEFAULT 0,
    version BIGINT NOT NULL DEFAULT 0
);

CREATE TABLE venue_wallet_balance (
    wallet_id VARCHAR(64) PRIMARY KEY,
    balance DECIMAL(20,8) NOT NULL DEFAULT 0,
    version BIGINT NOT NULL DEFAULT 0
);
```

### 3.4 方案四：分布式锁
```java
// 使用Redis分布式锁确保操作原子性
String lockKey = "wallet_lock:" + walletId;
if (redisLock.tryLock(lockKey, 30, TimeUnit.SECONDS)) {
    try {
        // 执行钱包操作
        updateWalletBalance(walletId, centerAmount, venueAmount);
    } finally {
        redisLock.unlock(lockKey);
    }
}
```

## 4. 推荐解决方案

综合考虑性能和一致性，推荐使用 **乐观锁 + 重试机制 + 分离存储** 的组合方案：

1. 使用乐观锁避免悲观锁的性能问题
2. 分离存储减少锁竞争范围
3. 重试机制处理并发冲突
4. 配合分布式锁处理跨表操作

这样既能保证数据一致性，又能提供较好的并发性能。