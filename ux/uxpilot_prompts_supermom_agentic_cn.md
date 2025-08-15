# UXPilot 单页 Prompt（CN）—— SuperMom Agentic AI 平台（C 端 + 社区 + 代币）

将本文件整体粘贴到 uxpilot.ai（或分段）生成高保真移动端 UI。与“AI 作为助手”不同，本稿强调：具备自主能力（Agentic）、以 AI 为核心（AI‑First）、由社区驱动（Community‑Driven）。

---

## 0) 项目 Brief + 设计基调（Agentic）
目标：打造能“主动规划、触发与协作”的妈妈平台。AI 不仅回答，还能发起任务/挑战、分配步骤、追踪进度并闭环奖励。
人群：备孕/孕期/新生儿/婴幼儿；多语 EN/ID/TH/VI/MY/PH；低带宽友好。
导航（底部 5 栏）：Home｜Search｜Agent｜Benefits/Events｜Me（Agent 取代单纯 Assistant）。
美学：
- 氛围：温暖可信、留白充足、分区清晰；
- 触感：主 CTA 置底拇指区，BottomSheet 完成关键确认；
- 可信：来源徽标、免责声明与“自主行动护栏”固定入口。

---

## 1) Design Tokens（Light + Dark）
Light：
- Primary #6F52ED（Hover #5C3FE3） | Accent #FF8A65
- Success #22C55E | Warning #F59E0B | Danger #EF4444 | Info #2563EB
- Text #111 | Subtext #666 | Divider #EAEAEA | BG #FFFFFF | BG‑Soft #F7F7FB
- Radius：Card/Button 12px；Input 10px
- Shadow：Card 0 4 12 rgba(0,0,0,0.06)
- Font：Inter + Noto Sans（400/600）
- Grid：8px；容器 16px；区块 24px

Dark（备用）：
- Primary #8B7BFF（Hover #7867F7） | Accent #FF9E80
- Text #F5F5F5 | Subtext #A8A8A8 | Divider #2E2E2E | BG #0F1115 | BG‑Soft #16181D
- Shadow：0 6 18 rgba(0,0,0,0.35)

可访问：对比度≥4.5:1；正文≥14pt；触控≥44×44；读屏标签完整。

---

## 2) 组件库（Agentic 扩展）
- Header：标题/副标题/搜索入口/语言切换。
- StageChip：备孕/孕期/宝宝月龄徽章（语义配色）。
- TrustLabel：医院/政府/协会徽标；点击打开来源列表。
- AnswerCard（RAG）：标题/三要点/来源徽标/免责声明/反馈。
- PriceTag：现价/原价/趋势火花线/“预计到手价”。
- DealPath：券/返利/满减叠加 → 显示“预计到手价”。
- BenefitCard / EventCard：资格/截止/步骤/CTA。
- TimelineItem：疫苗/产检/补贴/补货 → 一键完成/改期/同步日历。
- ConsentBlock：用途开关（个性化/价格/活动/调研/Agent 自主行动）。
- BottomSheet：确认/表单；用于“自主行动”二次确认。
- Toast/Snackbar/Loading/EmptyState：四态必备。
- TokenBalance：积分余额与本周新增；入口至“兑换”。
- QuestCard（新）：任务/挑战卡（目标/步骤/预计奖励/剩余时间/参与人数）。
- MissionBar（新）：Agent 推荐的“今日使命”（最多 3 条，可收起）。
- PlannerSuggestion（新）：AI 规划建议卡（含原因与预估收益/节省）。
- SafetyRail（新）：自主行动护栏（强/弱），可一键锁定需要明示同意的操作。

---

## 3) 布局规则（全局）
- Mobile 基线：390×844；8px 栅格；容器 16px；区块 24px。
- 一屏一重点：优先展示“今日使命/关键要点/可领取福利”。
- 四态：默认/骨架/空/错误；所有列表与卡片均提供骨架变体。
- BottomSheet：60–80% 屏高，下拉关闭，蒙层 30%。

---

## 4) 屏幕生成（Agentic 版本）

屏幕 A｜Agentic Onboarding + Consent（首次启动）
目标：语言→地区→阶段→用途同意→“自主能力”开关与粒度（仅建议/建议+自动草拟/建议+自动执行需确认）。
布局：Logo；语言卡（EN/ID/TH/VI/MY/PH）→ Region → Stage → ConsentBlock（RAG 个性化/通知/分析/Agent 行动权限）→ 说明卡（示例：自动订阅目标价、自动生成逛展路线并提醒）→ 底部 CTA“开启我的智能助理”。
状态：全关可进入但提示“功能将受限”；“自动执行”级别需二次确认。

屏幕 B｜Home（Agentic 首页）
模块：Header→StageChip→MissionBar（今日使命）→ PlannerSuggestion（你可能关心）→ KeyTakeaways（RAG 要点）→ PriceAlerts（订阅/新增）→ Benefits/Events → Timeline Peek → TokenBalance（本周新增）。
要求：
- MissionBar 显示 1–3 个“系统策划”的任务（如“设置奶粉目标价”“本周疫苗提醒”“报名本地福利”）；
- 每个 Mission/Planner 卡均带“为何建议”的透明度文案与“调整偏好”入口；
- 价格提醒两步设置；来源徽标与免责声明固定；空态引导开启定位与阶段。

屏幕 C｜Agent Center（AI 中枢）
目标：让用户查看/管理 AI 的“使命、任务与自动化”。
模块：
- 使命列表（进行中/待确认/已完成）；
- 自动化开关与粒度（按场景：价格/福利/时间轴/逛展/社区）；
- 日志（最近 30 天：AI 做了什么、何时、基于何数据、结果如何）；
- 安全与隐私（护栏强度、数据来源、可撤回）。

屏幕 D｜Search（语义搜索）
分区：Answer（RAG）/Product/Experience/Benefit；筛选（阶段/语言/可信来源）。
结果：AnswerCard（标题+三要点+来源）；商品卡含“预计到手价”和趋势；经验帖支持翻译开关。
空态：建议改写或“让 Agent 为你规划”。

屏幕 E｜Answer Detail（RAG）
结构：标题、要点、来源列表 BottomSheet、相关问题、免责声明、就医引导、是否有用反馈。
Agentic：底部“由 Agent 代办”按钮（如：设提醒/订阅价格/报名福利/生成清单），进入 BottomSheet 确认。

屏幕 F｜Deals（价格提醒与省钱路径）
模块：我的提醒；新增提醒 BottomSheet（目标价/渠道/通知）；DealPath（券/返利/满减）→“预计到手价”。
Agentic：开关“由 Agent 自动订阅相似 SKU”“价格变化自动生成建议”。

屏幕 G｜Benefits & Events（福利与活动）
筛选：城市/时间/阶段；BenefitCard/EventCard；“我的报名”。
Agentic：
- QuestCard（例如“亲子活动打卡 3 次，得 50 分”）；
- Expo Assistant：自动生成路线与清单，逛展后自动提醒未兑权益。

屏幕 H｜Community Quests（社区任务/挑战）
目标：由品牌/平台/社区共同发起的挑战，驱动创作与互助。
布局：
- 顶部筛选：挑战类型（UGC/省钱/公益/学习）、阶段、城市；
- QuestCard：目标、步骤、奖励（积分/徽章/权益）、参与人数、截止时间；
- 进度条与“提交/复查状态”；
- 安全：规则简述、举报入口。

屏幕 I｜Wallet & Rewards（积分/代币）
模块：TokenBalance（当月+累计）、明细（任务来源/挑战/省钱/福利）、兑换（品牌券/样品/会员权益）。
Agentic：建议“下一步可快速完成的任务”以达标兑换。

屏幕 J｜Timeline（时间轴与提醒）
统一管理：疫苗/产检/补贴/补货；可完成/改期/同步日历；
Agentic：基于阶段/城市自动生成待办；缺口提醒（如材料未齐）；异常中断保护（连续未完成→温和提醒）。

屏幕 K｜Me（我的/隐私）
资料与阶段；Consent 与“Agent 自主行动”粒度；通知偏好；钱包入口；导出/删除（DSR）。

---

## 5) 关键交互（Agentic 价值对齐）
- 省时：MissionBar 一键执行；搜索结果页底部“由 Agent 代办”。
- 省钱：自动订阅相似 SKU；价格变化→自动生成“省钱路径”建议卡。
- 安心：RAG 来源徽标固定；医疗免责声明常驻；敏感话题就医引导；Agent 所有自动化均可回溯与撤回。
- 贴心：时间轴自动编排；逛展自动生成路线与“未兑权益提醒”；
- 社区：Quest → 任务清单 → 提交 → 质检 → 奖励/兑换；生成可分享战报/徽章。

---

## 6) 多态/无障碍/低带宽
- 四态：默认/骨架/空/错误；骨架优先于空白加载。
- 可访问：≥14pt，≥4.5:1，对图标/Chip/按钮加 aria‑label；屏读顺序符合语义。
- 低带宽：先文本后图片；RAG 要点流式；大图懒加载；失败给最小可用答案；弱网提示离线清单。

---

## 7) 埋点与 KPI（data‑analytics‑id）
Agentic 专属：
- agent_mission_shown/accepted/auto_executed/aborted
- agent_suggestion_viewed/dismissed/applied
- quest_viewed/joined/progressed/completed/reward_claimed
- token_earned/redeemed/balance_viewed
常规：
- search_performed, answer_viewed, citation_opened, followup_clicked
- price_subscribed, price_notification_opened, price_claim_clicked
- benefit_viewed, benefit_registered, ticket_viewed
- timeline_item_completed, reminder_set
- consent_updated, dsr_requested

---

## 8) 验收标准（关键）
- Onboarding：90s 内完成；“Agent 自主行动”级别解释清晰且可改；同意与日志可查可撤。
- Home：MissionBar ≤ 1000ms 出现骨架，≤ 2000ms 出 1 条可执行任务；Planner 卡可见“为何建议”。
- Deals/Benefits：2 步订阅/报名；1 次点击可见“到手价路径/报名状态”。
- Community Quests：挑战可加入/进度可视化/奖励可领取；举报渠道清晰。
- Wallet：兑换路径 ≤ 3 步；余额/明细清晰。
- 性能：TTI ≤ 2.5s（P75）；Crash‑free ≥ 99.5%。

---

## 9) 视觉与动效建议
- 留白优先，层级清晰；主色仅用于主 CTA 与关键信息；一致线性图标。
- 微动效：卡片 80ms，BottomSheet 120–160ms；Mission 进度条细腻。
- 战报/徽章可生成分享卡（城市/阶段/任务类型矩阵）。

---

说明：请优先生成“组件库 → A/B → B（Home）→ C（Agent Center）→ D–K”。确保多语、四态、Agent 护栏。