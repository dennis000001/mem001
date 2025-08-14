# SuperMom · AI for 1M Moms — UXPilot Prompts (CN + EN, Single Page)

本文件整合：中英文两套完整 Prompt、亮/暗两套 Design Tokens、组件库与交付建议。可整段复制到 uxpilot 作为项目依据；或分段粘贴（推荐）。

---

## 使用方式（How to Use）
- 先粘贴 Design Tokens（Light 或 Dark）与 Global Brief 至项目设置
- 再逐屏粘贴 Key Screen Prompts 生成移动端界面
- 最后粘贴 Shared Component Library Prompt 统一风格
- 多语言：中文/英文分别复制一遍（或先中文后复制为英文页面）

---

## Design Tokens · Light（亮色主题）
颜色（Colors）：
- Primary #6F52ED（Hover #5C3FE3）
- Accent #FF8A65
- Success #22C55E  Warning #F59E0B  Danger #EF4444  Info #2563EB
- Text #111111  Subtext #666666  Divider #EAEAEA
- BG #FFFFFF  BG-Soft #F7F7FB
圆角（Radius）：Button/Card 12px；Input 10px
阴影（Shadow）：Card 0 4 12 rgba(0,0,0,0.06)
字体（Typography）：Inter + Noto Sans（权重 400/600）
间距（Spacing）：8px grid；容器 16px；区块 24px
图标（Icons）：Tabler 或 Material Symbols（线性）
组件态（States）：default/hover/disabled/loading/error；预留深浅色主题

---

## Design Tokens · Dark（暗色主题）
颜色（Colors）：
- Primary #8B7BFF（Hover #7867F7）
- Accent #FF9E80
- Success #34D399  Warning #F59E0B  Danger #F87171  Info #60A5FA
- Text #F5F5F5  Subtext #A8A8A8  Divider #2E2E2E
- BG #0F1115  BG-Soft #16181D
圆角（Radius）：Button/Card 12px；Input 10px
阴影（Shadow）：Card 0 6 18 rgba(0,0,0,0.35)
字体（Typography）：Inter + Noto Sans（权重 400/600）
间距（Spacing）：8px grid；容器 16px；区块 24px
图标（Icons）：Tabler 或 Material Symbols（线性，浅色描边）
提示：在 uxpilot 中切换到 Dark 时，替换为本 Token 区块

---

# CN · 全局设计简述（Global Brief, CN）
目标：为东南亚一百万位妈妈提供“省时、省钱、安心、贴心”的一体化 AI 助手 App  
人群：备孕/孕期/新生儿/婴幼儿家庭（多语：EN/ID/TH/VI/MY/PH）  
风格：温暖、可信、简洁、可一眼读懂；移动端优先  
易用性：单手可达，主要行动按钮靠底部；信息密度适中；显著“可信标签/来源”  
可访问性：对比度≥4.5:1；文字≥14pt；小字模式/色弱模式；语言切换  
底部导航：首页｜搜索｜助手｜福利/活动｜我的  
核心价值一屏可见：阶段卡、要点摘要、价格提醒、福利卡、安心提示

---

## CN · 关键界面 Prompts（逐屏生成）

### 屏幕1｜新手引导与同意（Onboarding + Consent + 语言）
目标：快速选择语言、同意数据用途、引导阶段选择  
布局：顶 LOGO；分段语言卡；同意开关（用途+隐私政策链接）；CTA“开启我的旅程”  
要素：English / Bahasa Indonesia / ไทย / Tiếng Việt / Melayu / Filipino（可搜索）；
同意用途：个性化、价格提醒、活动推荐、调研邀请（可单独开关）；可随时撤回  
状态：未选语言禁用 CTA；全关同意提示“部分功能将受限”

### 屏幕2｜阶段选择/识别（Stage Setup）
目标：建立“备孕/孕期/宝宝月龄”标签  
布局：步骤条；三卡切换：备孕/孕期/宝宝；底部 CTA“完成”  
要素：备孕仅意向/话题；孕期预产期选择→自动孕周；宝宝 DOB 或月龄段（0–3/4–6/7–12/13–24…）  
文案：标题“我们一起走多久？”；说明“帮助我们更贴心地推荐内容与福利”

### 屏幕3｜首页（阶段化 Feed）
目标：一眼看到“要点摘要、阶段卡、价格提醒、福利与活动”  
布局：顶部搜索+消息；阶段横卡；要点摘要卡（RAG 来源徽标）；价格提醒；福利/活动卡；精选内容；底部 Tab  
要素：阶段卡显示孕周/月龄与3条当周要点；价格提醒跟踪 SKU（奶粉/尿裤）；福利卡按定位与阶段推荐  
空状态：引导添加价格提醒/开启定位

### 屏幕4｜语义搜索（Search）
目标：更快找到可信答案与相关好物  
布局：自然语言搜索；结果分区：答案卡（RAG）/ 商品 / 经验帖 / 福利；筛选（阶段/语言/可信来源）  
要素：答案卡标题+三要点+来源徽标（医院/政府/协会）；商品卡含价格趋势火花线；经验帖支持翻译开关  
状态：加载骨架；无结果→“提问给 AI 助手”

### 屏幕5｜答案详情（RAG Answer）
目标：安心与可追溯  
布局：标题；要点列表；“查看完整来源”；相关问题；“不确定/就医时机”提示；有用性反馈  
要素：免责声明“非诊疗建议”；来源链接可点击；反馈含文本补充

### 屏幕6｜价格提醒与省钱路径（Deals）
目标：设置提醒、查看降价与返利路径  
布局：顶部“我的提醒”；商品列表（名/价/趋势/最低到手）；“设置提醒”抽屉（目标价/渠道/通知）  
要素：跨商家优惠叠加（券/返利/满减）→ 显示“预计到手价”；商家可信徽标与风险提示（低库存/临期）

### 屏幕7｜福利与活动（Benefits & Events）
目标：本地福利/补贴/父母课堂/展会报名  
布局：筛选：城市/时间/阶段；卡片：标题/主办/时间地点/报名 CTA；“我的报名”  
要素：展会支持“逛展助理”；福利提供材料清单与小贴士

### 屏幕8｜逛展助理（Expo Assistant）
目标：个性化路线与摊位清单、避峰建议、回收“带回清单”  
布局：展会信息；路线建议（时间段）；摊位清单（品牌/优惠/地图标）；扫码加入“带回清单”  
要素：按预算/兴趣/人流一键生成路线；会后“带回清单+未兑提醒”

### 屏幕9｜时间轴与提醒（Timeline）
目标：疫苗/产检/补贴办理/补货的统一提醒  
布局：时间轴；事项卡（任务/时间/地点或在线入口/材料/状态）；筛选（类型）  
要素：一键完成/记录；与日历同步；错过提醒

### 屏幕10｜助手与对话（AI Assistant）
目标：自然语言问答、生成清单、规划行程  
布局：意图 chips（“备产清单”“本周要点”“逛展路线”）；对话气泡；答案卡支持“插入清单/加入提醒/设置价格提醒”  
要素：多语输入与即时翻译；医疗话题优先权威来源+就医提示

---

## CN · 通用组件库（Shared Component Library）
- Header：标题/副标题/搜索入口/语言切换  
- StageChip：备孕/孕期/月龄徽章与配色  
- TrustLabel：可信来源（医院/政府/协会）徽标  
- PriceTag：现价/原价/趋势火花线/最低到手  
- DealPath：优惠叠加可视化（券/返利/满减）  
- BenefitCard：材料清单/在线入口/阶段徽章  
- EventCard：时间/地点/报名/人流提示  
- TimelineItem：类型图标/时间/操作  
- AnswerCard：RAG 答案（标题/要点/来源/反馈）  
- EmptyState：空状态插画与引导按钮  
- ConsentBlock：同意开关与政策链接  
- Toast/Snackbar：成功/失败/提醒  
- BottomSheet：提醒设置/选择器  
- Loading：骨架屏（列表/卡片/段落）

---

## CN · 交付建议（Delivery）
- 移动端竖屏优先；再做响应式平板/桌面  
- 每屏包含：默认/加载/空/错误 四态  
- 列表预填样本数据（3–6项）便于评审  
- 医疗相关上下文加入“可信来源徽标+免责声明”

---

# EN · Global Project Brief (EN)
Goal: A mobile-first AI assistant app to help 1,000,000 moms in Southeast Asia save time, save money, feel safer, and feel cared for.  
Audience: Preconception / Pregnancy / Newborn / Infant & Toddler (EN/ID/TH/VI/MY/PH)  
Style: Warm, trustworthy, simple, scannable; mobile-first  
Usability: One-hand reach; primary actions near bottom; visible trust labels/sources  
Accessibility: Contrast ≥ 4.5:1; body ≥ 14pt; small text mode / color-weak mode; language switch  
Bottom nav: Home | Search | Assistant | Benefits/Events | Me  
One-screen value: Stage card, key takeaways, price alerts, benefits, safety cues

---

## EN · Key Screen Prompts

### Screen 1 | Onboarding + Consent + Language
Goal: Select language, consent to data use, guide stage setup  
Layout: Logo; language cards; consent toggles (use cases + policy link); CTA "Start my journey"  
Elements: English / Bahasa Indonesia / ไทย / Tiếng Việt / Melayu / Filipino (searchable);
Purposes: personalization, price alerts, event recs, research invites (each toggleable); withdraw anytime  
States: Disable CTA until language chosen; if all off, show gentle limitation notice

### Screen 2 | Stage Setup
Goal: Tag preconception/pregnancy/baby age band  
Layout: Stepper; three cards; bottom CTA "Done"  
Elements: Preconception topics; Pregnancy due date → gestational week; Baby DOB or age band (0–3/4–6/7–12/13–24…)  
Copy: "How far are we on this journey?" + helper for tailored content/benefits

### Screen 3 | Home (Stage-aware Feed)
Goal: See key takeaways, stage card, price alerts, benefits at a glance  
Layout: Search + inbox; horizontal stage cards; Key Takeaways (RAG badges); Price Alerts; Benefits/Events; curated list; bottom tabs  
Elements: 3 short bullets for this week; tracked SKUs (formula/diapers); location + stage-based benefits  
Empty: Coach to add alerts / enable location

### Screen 4 | Semantic Search
Goal: Trustworthy answers + relevant products faster  
Layout: Natural language search; sections: Answer (RAG) / Products / Posts / Benefits; filters (stage/language/trusted)  
Elements: Answer title + 3 bullets + badges (hospital/gov/association); product sparkline; translation toggle for posts  
States: skeleton loading; empty → Ask AI Assistant

### Screen 5 | Answer Detail (RAG)
Goal: Reassurance & traceability  
Layout: Title; bullets; expandable sources; related questions; not-sure/see-a-doctor guide; helpfulness feedback  
Elements: Not medical advice; clickable source links; free-text feedback

### Screen 6 | Deals (Price Alerts & Savings Path)
Goal: Set alerts; view drops & best savings path  
Layout: My alerts; product list (name/price/trend/lowest net); bottom sheet for alert settings  
Elements: Cross-merchant stacking (coupon/cashback/threshold) → Estimated net price; merchant credibility & risk cues

### Screen 7 | Benefits & Events
Goal: Local benefits/subsidies/parent classes/expo  
Layout: Filters (city/time/stage); cards with title/organizer/time/place/CTA; My registrations  
Elements: Expo entry to Assistant; benefits with document checklist & tips

### Screen 8 | Expo Assistant
Goal: Personalized route, booth list, crowd-avoid tips, take-home recap  
Layout: Expo info; time-slot routes; booths (brand/deal/map index); QR to add take-home list  
Elements: One-tap route (budget/interests/crowd); post-expo summary & unredeemed reminders

### Screen 9 | Timeline & Reminders
Goal: Unified reminders for vaccines/checkups/subsidies/refills  
Layout: Timeline; item cards (task/time/location or link/docs/status); filter by type  
Elements: One-tap complete/log; calendar sync; missed reminder handling

### Screen 10 | AI Assistant (Chat)
Goal: NL Q&A, lists, route planning  
Layout: Intent chips (Hospital bag / This week’s key points / Expo route); chat bubbles; Answer cards support Insert/Add/Set alert  
Elements: Multilingual input + instant translation; medical topics prioritize trusted sources + doctor guidance

---

## EN · Shared Component Library
- Header: title/subtitle/search/language  
- StageChip: preconception/pregnancy/month badges + colors  
- TrustLabel: hospital/gov/association badges  
- PriceTag: now/original/sparkline/lowest net  
- DealPath: stacking viz (coupon/cashback/threshold)  
- BenefitCard: checklist/link/stage badge  
- EventCard: time/place/register/crowd hint  
- TimelineItem: type icon/time/actions  
- AnswerCard: RAG title/bullets/sources/feedback  
- EmptyState: illustration + CTA  
- ConsentBlock: toggles + policy links  
- Toast/Snackbar: success/failure/alert  
- BottomSheet: alert settings/pickers  
- Loading: skeletons (list/cards/paragraph)

---

## EN · Delivery Tips
- Mobile portrait first; then responsive tablet/desktop  
- Four states per screen: default/loading/empty/error  
- Pre-fill lists (3–6 items) for review  
- Use trust labels + disclaimers for medical-adjacent content

---

## 可选｜一体化 One-shot Prompt（用于 UX 生成器）
请依据以下内容生成“移动端 10 个屏幕 + 通用组件库”，并使用 Design Tokens（Light 或 Dark）：
- Global Brief（CN 或 EN 其一）；
- Screens 1–10（按描述分区）；
- Shared Component Library；
- 保证可访问性（对比度≥4.5:1/字体≥14pt），并输出默认/加载/空/错误四态。