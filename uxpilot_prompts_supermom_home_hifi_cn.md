# UXPilot 单页 Prompt（CN）—— SuperMom 阶段化首页高保真

将本段整体粘贴到 uxpilot.ai 以生成 5 种阶段首页（移动端高保真），并复用项目 Tokens 与组件库。

---

项目与样式（先读取本项目 Tokens 与组件库）
- 画布：Mobile 390×844，8px 栅格，容器内边距 16px，区块间距 24px
- Tokens：Primary #6F52ED / Accent #FF8A65；Text #111 / Subtext #666 / Divider #EAEAEA；BG #FFF / BG-Soft #F7F7FB；圆角 12/10；阴影 0 4 12 rgba(0,0,0,0.06)
- 字体：Inter + Noto Sans（400/600）；最小可点击 44×44；对比度≥4.5:1；字号≥14pt
- 组件：Header / StageChip / KeyTakeaways / AnswerCard(RAG) / TrustLabel / PriceTag / DealPath / ProductCard / BenefitCard / EventCard / TimelineItem / ConsentBlock / Empty / Toast / BottomSheet / Loading

通用规则
- 顶部：Header（左 Logo/标题，中搜索入口，右消息入口）
- 模块锚点：为每个模块容器添加 data-section（如 data-section="home.keytakeaways"）
- 四态：默认/加载（骨架）/空（插画+引导 CTA）/错误（重试）
- RAG 要点：3 条；显示来源徽标；“查看来源”按钮；底部固定医疗免责声明
- 价格提醒：展示到手价路径 Pill（点击展开券/返利/满减）；2 步内可设置提醒（BottomSheet）
- 时间轴：至少 1 条待办，支持“完成/改期/同步日历”中 ≥2 个操作

生成以下 5 个屏幕（使用 Variation 功能），每个屏的模块与顺序如下：

Variation A｜Home（T1 备孕/孕早）
1) 阶段卡（Stage Hero）：StageChip + 标题（示例“备孕 · 规划期”或“孕 10周+2”）+ 快捷按钮（本周要点/清单/价格提醒）
2) 当周要点（KeyTakeaways / RAG）：3 条要点；右上“查看来源” → BottomSheet 来源列表（医院/政府/协会），底部免责声明
3) 备产清单：3–5 条预览 + 查看全部；勾选状态本地缓存
4) 医院/产检工具：医院选择 / 产检时间小组件（下一次产检时间/地点）
5) 热门问答：3 条问题卡，点击进入 Answer Detail（RAG）
6) 价格提醒（叶酸/维D）：SKU 列表（图 48，名 2 行，现价/原价/趋势，Pill 显示到手≈$X）
7) 本地福利：2 张福利卡（材料清单/在线入口）

Variation B｜Home（T2/T3 孕中/晚）
1) 阶段卡（Stage Hero）：显示孕周/预产期；快捷按钮（待产包/路线/价格提醒）
2) 分娩/待产要点（RAG）：3 条 + 来源 + 免责声明
3) 医院/路线/待产包清单：路线按钮（地图 App 深链），待产包 3–5 条预览
4) 价格提醒（大件：婴儿床/提篮/吸奶器 等）：SKU 列表 + 到手价路径 Pill
5) 课程/福利卡：孕妇课堂/线上讲座 + 福利
6) 安心提示：敏感主题提醒 + 就医导航

Variation C｜Home（0–6 月）
1) 阶段卡：显示宝宝月龄；快捷按钮（喂养/睡眠/价格提醒）
2) 喂养/睡眠要点（RAG）：3 条 + 来源 + 免责声明
3) “1 分钟选品单”（奶粉/尿裤）：BottomSheet 选择预算/偏好 → 3 款对比（价格/口碑/成分/可得性/历史最低价距离）→ DealPath 展开
4) 价格提醒：跟踪 SKU 列表（奶粉/尿裤），Pill 显示到手价
5) 疫苗时间轴预览：最近 1–2 条；操作：完成/改期/同步日历
6) 安心提示：敏感主题引导 + 免责声明
7) 同阶段暖链：2–3 条经验帖摘要 + 翻译开关

Variation D｜Home（7–24 月）
1) 阶段卡：宝宝月龄；快捷按钮（辅食/里程碑/价格提醒）
2) 辅食/里程碑要点（RAG）：3 条 + 来源 + 免责声明
3) 疫苗时间轴预览：1–2 条；操作同上
4) 补货预测：即将用尽的 SKU 提醒（预测依据：最近购买/使用频次）
5) 亲子活动/福利：EventCard/BenefitCard 2–3 张
6) 价格提醒：SKU 列表 + 到手价路径

Variation E｜Home（24–36 月+）
1) 阶段卡：宝宝月龄；快捷按钮（早教/托育/价格提醒）
2) 早教/托育推荐：机构卡 + 可信标签（资质/评分）
3) 活动/展会：EventCard；提供“逛展助理”入口（按钮）
4) 逛展助理入口：说明+CTA，进入后可生成路线/避峰/摊位清单
5) 本地福利：BenefitCard 2 张（材料清单/在线入口）
6) 价格提醒：SKU 列表 + 到手价路径

态与无障碍（对所有 Variation 生效）
- 加载：卡片骨架（图片灰块 + 3 行灰条）；空：引导“添加价格提醒/开启定位”；错：重试按钮
- 可访问：控件≥44×44、文本≥14pt、aria-label/role 完整、对比≥4.5:1
- 低带宽：优先渲染框架+骨架，图片延迟加载；RAG 要点先 1 条流式，其后补全

交互与 BottomSheet（统一）
- “查看来源”→ BottomSheet：来源名称/类型徽标/外链按钮（在新页打开）
- “设置价格提醒”→ BottomSheet：目标价（数值输入）/渠道（多选）/通知方式（推送/站内）→ 成功 Toast
- “1 分钟选品单”→ BottomSheet：预算/品牌偏好/成分敏感 → 3 款对比 → 可加入提醒/加入清单
- 时间轴待办：完成/改期/同步日历（BottomSheet 日期选择）

度量与埋点（在组件属性中标注 data-analytics-id）
- home_view、section_view（含 data-section）、keytake_source_click、answer_helpful
- price_alert_set/trigger/redeem、dealpath_expand
- benefit_view/apply、event_register/attend
- timeline_complete/reschedule/calendar_sync

验收（按屏检查）
- 首屏 1000ms 内出现阶段卡与要点骨架；2000ms 内至少 1 条要点文本
- 价格提醒 2 步内可设置；到手价路径 1 次点击可见
- 当周要点含来源徽标与“查看来源”；固定医疗免责声明
- 时间轴至少展示 1 条待办且可操作 ≥2 项（完成/改期/同步日历）