# UXPilot 单页 Prompt（CN）—— SuperMom AI 妈妈App（完整UI，含社区）

将本文件整体粘贴到 uxpilot.ai（或分段）生成高保真移动端UI。强调“美观+易用”，围绕省时/省钱/安心/贴心四大价值，并包含“找到/连接其他妈妈”的社区能力。

---

## 0) 项目Brief + 美学基调
目标：为东南亚一百万位妈妈提供省时、省钱、更安心、更贴心的一体化AI助手App（移动端优先）。  
人群：备孕/孕期/新生儿/婴幼儿（多语：EN/ID/TH/VI/MY/PH）。  
导航（底部5栏）：Home｜Search｜Assistant｜Benefits/Events｜Me  
美学：
- 氛围：温暖净透（高留白）、清爽卡片（轻阴影）、柔和圆角、统一线性图标。
- 层次：一屏一重点（Stage→要点→提醒→福利），内容分区清晰，避免堆叠。
- 触感：主CTA置底拇指区；BottomSheet完成关键操作；骨架屏与细腻过渡（80–160ms）。
- 可信：来源徽标与免责声明固定位置；医疗敏感话题统一护栏与就医引导。

---

## 1) Design Tokens（Light + Dark）
Light：
- Primary #6F52ED（Hover #5C3FE3） | Accent #FF8A65  
- Success #22C55E | Warning #F59E0B | Danger #EF4444 | Info #2563EB  
- Text #111 | Subtext #666 | Divider #EAEAEA | BG #FFFFFF | BG-Soft #F7F7FB  
- Radius：Card/Button 12px；Input 10px  
- Shadow：Card 0 4 12 rgba(0,0,0,0.06)  
- Font：Inter + Noto Sans（400/600）  
- Grid：8px；容器 16px；区块 24px  
- Icons：Tabler / Material Symbols（线性）

Dark（备用）：
- Primary #8B7BFF（Hover #7867F7） | Accent #FF9E80  
- Text #F5F5F5 | Subtext #A8A8A8 | Divider #2E2E2E | BG #0F1115 | BG-Soft #16181D  
- Shadow：0 6 18 rgba(0,0,0,0.35)

可访问：对比度≥4.5:1；正文≥14pt；触控≥44×44；语音/读屏标签。

---

## 2) 通用组件库（先生成并复用）
- Header：标题/副标题/搜索入口/语言切换（右上）
- StageChip：备孕/孕期/宝宝月龄徽章（语义配色）
- KeyTakeaways：3要点卡（RAG来源徽标+“查看来源”）+ 固定医疗免责声明
- AnswerCard(RAG)：标题/要点/来源徽标/免责声明/反馈（有用/不够用）
- TrustLabel：医院/政府/协会徽标
- PriceTag：现价/原价/迷你Sparkline/最低到手价
- DealPath：优惠叠加可视化（券/返利/满减）→ 显示“预计到手价”
- ProductCard：图/名/价/口碑/清真与成分标签/趋势火花线
- BenefitCard：福利清单/在线入口/阶段徽章
- EventCard：时间/地点/报名/人流提示
- TimelineItem：事项（疫苗/产检/补贴/补货）时间/地点/材料/状态/操作
- ConsentBlock：用途开关（个性化/价格/活动/调研）+隐私政策链接
- Community：
  - MomAvatar（头像+阶段徽章）/ MomCard（昵称/阶段/城市/兴趣Chips/互助分）
  - GroupCard（群聊/话题圈）/ PostCard（作者/时间/内容/图片九宫格/翻译开关）
  - MatchChip（相似经历标签）/ ActionBar（点赞/收藏/评论/分享/举报）
- System：EmptyState/Toast/Snackbar/BottomSheet/Loading（列表/卡片/段落骨架）

---

## 3) 布局规则（全局）
- Mobile基线：390×844；8px栅格；容器16px；区块24px
- 模块锚点：data-section（如 data-section="home.keytakeaways"）
- 四态：默认/加载（骨架）/空（插画+引导）/错误（重试）
- BottomSheet：60–80%屏高，下拉关闭，蒙层30%

---

## 4) 屏幕生成（按序粘贴）

屏幕A｜Onboarding + Consent + Language  
目标：语言选择 + 用途同意（可撤回）+ 阶段引导  
布局：Logo；语言卡（EN/ID/TH/VI/MY/PH，可搜索）；ConsentBlock（个性化/价格/活动/调研）；底部CTA“开启我的旅程”  
状态：未选语言禁用；同意全关→温和提示“部分功能受限”

屏幕B｜Stage Setup  
目标：建立“备孕/孕期/宝宝月龄”  
布局：步骤条；三卡切换；孕期预产期→自动孕周；宝宝DOB或月龄段；底部CTA“完成”

屏幕C1–C5｜Home（阶段化首页，5个变体，使用 Variation）  
通用：Header→StageChip→KeyTakeaways(RAG)→PriceAlerts→Benefits/Events→Timeline Peek→Safety Cue→社区暖链（视阶段）  
- C1 T1 备孕/孕早：Stage→要点→备产清单→医院/产检工具→热门问答→价格提醒（叶酸/维D）→本地福利
- C2 T2/T3 孕中/晚：Stage→分娩/待产要点→医院/路线/待产包→价格提醒（大件）→课程/福利→安心提示
- C3 0–6月：Stage→喂养/睡眠要点→“1分钟选品单（奶粉/尿裤）”→价格提醒→疫苗时间轴→安心提示→同阶段暖链
- C4 7–24月：Stage→辅食/里程碑→疫苗时间轴→补货预测→亲子活动/福利→价格提醒
- C5 24–36月+：Stage→早教/托育→活动/展会→逛展助理入口→本地福利→价格提醒
要求：
- 一屏即可见“阶段卡/要点/提醒”  
- 价格提醒两步可设置（选择SKU→目标价/通知），到手价路径一键展开  
- RAG来源徽标与免责声明固定区域，医疗敏感弹“就医引导”  
- 时间轴项可一键加入/完成/改期/同步日历  
- 福利按定位与阶段命中，空态引导开启定位

屏幕D｜Search（语义搜索）  
分区：Answer(RAG)/Product/Experience/Benefit；筛选（阶段/语言/可信来源）。AnswerCard标题+三要点+来源徽标+“查看来源”；商品卡展示“预计到手价”与趋势；经验帖支持翻译开关。无结果→“问AI助手”。

屏幕E｜Answer Detail（RAG）  
标题、要点、来源列表BottomSheet、相关问题、非诊疗免责声明、就医引导、是否有用反馈（评论可选）。

屏幕F｜Deals（价格提醒与省钱路径）  
模块：我的提醒列表；BottomSheet设置提醒（目标价/渠道/通知）；DealPath叠加路径（券/返利/满减）→“预计到手价”；风险提示（低库存/临期）。

屏幕G｜Benefits & Events（福利与活动）  
筛选：城市/时间/阶段；BenefitCard与EventCard；“我的报名”；福利卡含材料清单/在线入口；报名成功→状态徽标“已报名”。

屏幕H｜Expo Assistant（逛展助理）  
展会信息；个性化路线（预算/兴趣/人流）；摊位清单（品牌/优惠/地图标）；扫码加入“带回清单”；行后总结“未兑权益提醒”。

屏幕I｜Timeline（时间轴与提醒）  
统一管理：疫苗/产检/补贴/补货；事项卡可一键完成/改期/同步日历；按类型筛选；“今日待办”分组；空态引导来自答案卡/福利卡/对话添加。

屏幕J｜Assistant（对话）  
意图chips：备产清单/本周要点/逛展路线；自然语言问答（RAG答案支持“插入清单/加入提醒/设价格提醒”）；多语输入/即时翻译；医疗话题优先权威来源与就医提示。

屏幕K｜Community Discover（找到其他妈妈）  
目标：发现并连接合适的妈妈/群组（按阶段/城市/兴趣/语言）。  
布局：
- 顶部筛选：阶段（T1/T2/T3/0–6/7–24/24–36+）、城市、兴趣Chips、语言  
- 推荐区：MomCard（头像/昵称/阶段/城市/兴趣Chips/互助分）+ MatchChip（相似经历：如“剖宫产准备”“混喂”）  
- GroupCard：话题圈/本地社群（人数/活跃度/置顶话题）  
- CTA：关注/私信/加入群组（BottomSheet二次确认）  
- 安全：展示Trust与举报入口；新手提示“友好发言守则”

屏幕L｜Mom Profile（妈妈主页）  
模块：头像与阶段徽章/城市/语言；“关于我”（短简介与偏好）；近期发帖与收藏；互助分与被感谢次数；CTA：关注/私信/邀请加入群；安全：屏蔽/举报。

屏幕M｜DM Chat（私信对话）  
消息列表与对话；即时翻译开关（显示原文/译文）；图片与贴纸；快速建议（如“备产清单分享”“价格提醒设置帮助”）；安全提示与举报；对话置顶/静音。

屏幕N｜Groups（群组/话题圈）  
群列表；群内Feed（置顶帖/最新帖）；发帖（文本/图片/投票）与翻译；精选标签（求助/经验/福利/闲置）；活动报名入口；群规则与管理员徽标。

屏幕O｜Compose（发帖）  
编辑器：文本/图片九宫格/投票；分类与标签；是否允许匿名（可选）；跨语自动翻译（提示“机器翻译，谨慎核对”）。

屏幕P｜Report & Safety（举报与安全）  
举报流程：类型（辱骂/虚假/医疗风险/广告等）；证据图片/文本；提交成功反馈；提示“守则与资源”。

屏幕Q｜Me（我的）  
资料：头像/昵称/阶段/城市/语言；隐私与同意（用途管理/撤回/导出）；提醒中心（通知偏好与静默时段）；Savings账本（本周/本月省了多少）；周报（要点/省钱/福利）；语言切换；登出。

---

## 5) 关键交互（对齐“省时/省钱/安心/贴心”）
- 省时：Home首屏显示 Stage/KeyTakeaways/PriceAlerts；Search→AnswerCard≤20s；“1分钟选品单”BottomSheet生成3款对比。
- 省钱：PriceAlert 两步设置；DealPath一键展开“预计到手价”；账本自动汇总可验证节省。
- 安心：AnswerCard中的来源徽标固定；医疗免责声明常驻；触发敏感→就医引导BottomSheet。
- 贴心：Timeline事项一键加入/完成/改期/同步；福利按定位与阶段命中；周报（要点/省钱/福利）固定触点。
- 社区连接：Community Discover按阶段/城市/兴趣/语言筛选；MomCard/GroupCard显著CTA；DM即时翻译。

---

## 6) 多态/无障碍/低带宽（统一约束）
- 四态：默认/骨架/空/错误；所有列表与卡片均提供骨架变体。
- 可访问：≥14pt，≥4.5:1，对图标/Chip/按钮加 aria-label；键盘焦点清晰（可用于桌面端扩展）。
- 低带宽：先框架后图片；RAG要点流式（先1条再补全）；大型图片懒加载；错误降级给最小可用答案。

---

## 7) 埋点与KPI（数据属性 data-analytics-id）
- 省时：ask_ai、first_answer_time、decision_steps
- 省钱：price_alert_set/trigger/redeem、dealpath_expand、savings_verified
- 安心：rag_trust_hit、misinfo_report、medical_risk_prompt_click
- 贴心：timeline_task_add/complete/reschedule/calendar_sync、benefit_view/apply、event_register/attend
- 社区：discover_filter_apply、momcard_follow/dm、group_join/post/engage、dm_translate_toggle、report_submit

---

## 8) 验收标准（关键）
- Home首屏：1000ms内出现“阶段卡/要点骨架”，2000ms内至少1条要点文本；价格提醒组件可见。
- Deals：2步内完成提醒设置；1次点击可见到手价路径。
- Answer：来源徽标清晰、免责声明常驻、敏感→就医引导。
- Timeline：至少1条待办，可完成/改期/同步≥2项操作。
- Community：可按阶段/城市/兴趣/语言筛选；MomCard/GroupCard可直达关注/私信/加群；DM翻译可切换。
- 可访问：随机抽10处对比度、触达与读屏通过检查。

---

## 9) 视觉优化建议（供渲染参考）
- 留白优先：卡片上下留白≥16px；段落行距≥1.4  
- 色彩节制：Primary用于主CTA与关键信息；多用中性色与浅底  
- 图标统一：线性图标+一致笔画；重要信息加徽标而非重色块  
- 微动效：卡片hover/按下80ms；BottomSheet弹出120–160ms；Sparkline淡入  
- 图文节奏：要点为短句（三条足矣），长文“展开更多”  

---

说明：以上为完整App UI生成规范。请优先生成“组件库→A/B→C1–C5→D–Q”，并确保多语、四态与无障碍符合约束。