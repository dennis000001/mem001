# UXPilot One-page Prompt (EN) — SuperMom AI App (Full UI, incl. Community)

Paste this entire document (or in sections) into uxpilot.ai to generate high-fidelity mobile UI. Optimized for aesthetics and usability, centered on the 4 core values: Save Time, Save Money, Feel Safer, Feel Cared-for. Includes "Find/Connect with other moms" community features.

---

## 0) Project Brief + Aesthetic Baseline
Goal: A mobile-first AI assistant app that helps 1,000,000 moms in Southeast Asia save time, save money, feel safer, and feel cared for.  
Audience: Preconception / Pregnancy / Newborn / Infant & Toddler (languages: EN/ID/TH/VI/MY/PH).  
Bottom tabs: Home | Search | Assistant | Benefits/Events | Me  
Aesthetics:
- Atmosphere: Warm and airy (ample whitespace), clean cards (soft shadows), gentle radii, consistent line icons.
- Hierarchy: One main focus per screen (Stage → Key Takeaways → Alerts → Benefits). Clear sections; avoid clutter.
- Touch feel: Primary CTA near thumb zone; critical flows in BottomSheets; skeletons + smooth transitions (80–160ms).
- Trust: Source badges and disclaimer always visible; unified medical guardrails and "see-a-doctor" guidance.

---

## 1) Design Tokens (Light + Dark)
Light:
- Primary #6F52ED (Hover #5C3FE3) | Accent #FF8A65  
- Success #22C55E | Warning #F59E0B | Danger #EF4444 | Info #2563EB  
- Text #111 | Subtext #666 | Divider #EAEAEA | BG #FFFFFF | BG-Soft #F7F7FB  
- Radius: Card/Button 12px; Input 10px  
- Shadow: Card 0 4 12 rgba(0,0,0,0.06)  
- Typeface: Inter + Noto Sans (400/600)  
- Grid: 8px; container 16px; section gaps 24px  
- Icons: Tabler / Material Symbols (line style)

Dark (fallback):
- Primary #8B7BFF (Hover #7867F7) | Accent #FF9E80  
- Text #F5F5F5 | Subtext #A8A8A8 | Divider #2E2E2E | BG #0F1115 | BG-Soft #16181D  
- Shadow: 0 6 18 rgba(0,0,0,0.35)

Accessibility: Contrast ≥ 4.5:1; body text ≥ 14pt; targets ≥ 44×44; voice/ARIA labels.

---

## 2) Shared Component Library (generate first, then reuse)
- Header: title/subtitle/search entry/language switch (top-right)
- StageChip: preconception/pregnancy/baby-age badges (semantic colors)
- KeyTakeaways: 3-bullet card (with RAG source badges + "View sources") + fixed medical disclaimer
- AnswerCard (RAG): title/bullets/source badges/disclaimer/feedback (helpful/not enough)
- TrustLabel: hospital/gov/association badges
- PriceTag: now/original/tiny sparkline/lowest estimated net price
- DealPath: visualized stacking (coupon/cashback/threshold) → display "Estimated net"
- ProductCard: image/name/price/rating/halal & ingredient tags/price trend sparkline
- BenefitCard: documents checklist/online link/stage badge
- EventCard: time/place/register CTA/crowd hint
- TimelineItem: task (vaccine/checkup/subsidy/refill) time/place/docs/status/actions
- ConsentBlock: toggles (personalization/price/events/research) + privacy link
- Community:
  - MomAvatar (avatar + stage badge) / MomCard (nickname/stage/city/interest chips/helpfulness score)
  - GroupCard (group/topic circle) / PostCard (author/time/text/images 3×3/translation toggle)
  - MatchChip (similar-experience tags) / ActionBar (like/save/comment/share/report)
- System: EmptyState/Toast/Snackbar/BottomSheet/Loading (list/card/paragraph skeletons)

---

## 3) Global Layout Rules
- Mobile canvas baseline: 390×844; 8px grid; container padding 16px; section gaps 24px
- Section anchors: data-section (e.g., data-section="home.keytakeaways")
- Four states: default / loading (skeletons) / empty (illustration + guidance CTA) / error (retry)
- BottomSheet: 60–80% height; pull-down to close; 30% scrim

---

## 4) Screen Generation (paste in order)

Screen A | Onboarding + Consent + Language  
Purpose: Language selection + data-use consent (revocable) + stage setup guide  
Layout: Logo; language cards (EN/ID/TH/VI/MY/PH, searchable); ConsentBlock (personalization/price/events/research); bottom CTA "Start my journey"  
States: CTA disabled until language chosen; all consent off → gentle notice "Some features will be limited"

Screen B | Stage Setup  
Purpose: Establish preconception/pregnancy/baby age band  
Layout: Stepper; 3 cards; pregnancy due date → auto gestational week; baby DOB or age band; bottom CTA "Done"

Screens C1–C5 | Home (Stage-aware, 5 variants via Variations)  
Common: Header → StageChip → KeyTakeaways (RAG) → PriceAlerts → Benefits/Events → Timeline Peek → Safety Cue → Community warm links (by stage)  
- C1 T1 Preconception/Early Pregnancy: Stage → KeyTakeaways → Hospital bag checklist → Hospital/checkup tools → Popular Q&A → Price alerts (folic/Vit D) → Local benefits
- C2 T2/T3 Mid/Late Pregnancy: Stage → Labor/birth KeyTakeaways → Hospital/route/bag checklist → Price alerts (big items) → Classes/benefits → Safety cue
- C3 0–6 mo: Stage → Feeding/sleep KeyTakeaways → "1-minute shortlist" (formula/diapers) → Price alerts → Vaccine timeline → Safety cue → Warm links to similar-stage posts
- C4 7–24 mo: Stage → Weaning/milestones KeyTakeaways → Vaccine timeline → Refill prediction → Activities/benefits → Price alerts
- C5 24–36 mo+: Stage → Early education/childcare recs → Activities/Expo → Expo Assistant entry → Local benefits → Price alerts
Requirements:
- Above-the-fold shows Stage/KeyTakeaways/PriceAlerts  
- Price alert set in 2 steps (choose SKU → target price/notify); one-tap to expand DealPath to see estimated net  
- RAG source badges + fixed disclaimer; medical topics trigger "see-a-doctor" BottomSheet  
- Timeline tasks can be one-tap added/completed/rescheduled/synced to calendar  
- Benefits targeted by location & stage; empty state coaches to enable location

Screen D | Search (Semantic)  
Sections: Answer (RAG) / Products / Experience posts / Benefits; filters (stage/language/trusted sources). AnswerCard: title + 3 bullets + source badges + "View sources"; product card shows Estimated net + sparkline; posts support translation toggle. Empty → "Ask AI Assistant".

Screen E | Answer Detail (RAG)  
Title, bullets, sources BottomSheet, related questions, non-medical-advice disclaimer, see-a-doctor guidance, helpfulness feedback (comments optional).

Screen F | Deals (Price Alerts & Savings Path)  
Modules: My alerts; BottomSheet to set alert (target price/channels/notification); DealPath stacking (coupon/cashback/threshold) → Estimated net; risk cues (low stock/near expiry).

Screen G | Benefits & Events  
Filters: city/time/stage; BenefitCard & EventCard; My registrations; benefits include checklist/online link; registration → status badge "Registered".

Screen H | Expo Assistant  
Expo info; personalized route (budget/interests/crowd); booth list (brand/deal/map index); QR to add to "Take-home" list; post-expo summary with unredeemed reminders.

Screen I | Timeline (Tasks & Reminders)  
Unified: vaccines/checkups/subsidies/refills; item card supports one-tap complete/reschedule/calendar sync; filter by type; "Today" group; empty state guides adding from Answer/Benefit/Chat.

Screen J | Assistant (Chat)  
Intent chips: Hospital bag / This week’s key points / Expo route; natural-language Q&A (RAG answer supports "Insert to list / Add reminder / Set price alert"); multilingual input & instant translation; medical topics prioritize trusted sources + doctor guidance.

Screen K | Community Discover (Find other moms)  
Purpose: Discover and connect with moms/groups by stage/city/interests/language.  
Layout:
- Top filters: stage (T1/T2/T3/0–6/7–24/24–36+), city, interest chips, language  
- Recommendations: MomCard (avatar/nickname/stage/city/interests/helpfulness score) + MatchChip (similar experience: e.g., "C-section prep", "combo feeding")  
- GroupCard: topic circles/local groups (size/activity/pinned topics)  
- CTAs: Follow / DM / Join group (BottomSheet confirm)  
- Safety: show Trust and Report entry; newcomer tips "Be kind and supportive"

Screen L | Mom Profile  
Avatar + stage badge/city/language; About me (bio, preferences); recent posts & saves; helpfulness and thank-you count; CTAs follow/DM/invite to group; Safety: mute/block/report.

Screen M | DM Chat  
Threads and chat; translation toggle (original/translated); images & stickers; quick suggestions (share bag checklist, help with price alerts); safety tips & report; pin/mute.

Screen N | Groups (Topic Circles)  
Group list; in-group feed (pinned/new); create post (text/images/poll) with translation; featured tags (help/request/benefit/marketplace); event registration entry; group rules & admin badges.

Screen O | Compose (Post)  
Editor: text, image 3×3 grid, poll; categories & tags; optional anonymous; cross-language auto-translate ("Machine translation — please verify").

Screen P | Report & Safety  
Report flow: reason (abuse/misinformation/medical risk/ads/etc.), evidence (image/text); success feedback; link to guidelines/resources.

Screen Q | Me  
Profile: avatar/nickname/stage/city/language; Privacy & Consent (manage/revoke/export); Notification center (prefs & quiet hours); Savings Ledger (how much I saved this week/month); Weekly Brief (key points/savings/benefits); Language switch; Sign out.

---

## 5) Key Interactions (map to Save Time/Save Money/Safer/Cared-for)
- Save Time: Above-the-fold Stage/KeyTakeaways/PriceAlerts on Home; Search → AnswerCard within ≤ 20s; BottomSheet "1-minute shortlist" generates 3 candidates.
- Save Money: PriceAlert in 2 steps; one-tap DealPath to show Estimated net; Savings ledger aggregates verifiable savings.
- Safer: Source badges fixed on Answer; medical disclaimer always visible; sensitive topics → "See a doctor" BottomSheet.
- Cared-for: Timeline items one-tap add/complete/reschedule/sync; benefits targeted by geo & stage; Weekly Brief (key points/savings/benefits) as recurring touchpoint.
- Connect: Community Discover by stage/city/interests/language; prominent CTAs on MomCard/GroupCard; DM with instant translation.

---

## 6) States / A11y / Low-bandwidth (global constraints)
- Four states: default/skeleton/empty/error — provide skeleton variants for lists and cards.
- Accessibility: text ≥ 14pt, contrast ≥ 4.5:1, ARIA labels on icons/chips/buttons; visible focus for keyboard (for desktop extension).
- Low-bandwidth: render frame first then images; RAG bullets stream (1 first, then complete); lazy-load large images; degrade gracefully with minimal viable answer.

---

## 7) Analytics & KPIs (use data-analytics-id on components)
- Save Time: ask_ai, first_answer_time, decision_steps
- Save Money: price_alert_set/trigger/redeem, dealpath_expand, savings_verified
- Safer: rag_trust_hit, misinfo_report, medical_risk_prompt_click
- Cared-for: timeline_task_add/complete/reschedule/calendar_sync, benefit_view/apply, event_register/attend
- Community: discover_filter_apply, momcard_follow/dm, group_join/post/engage, dm_translate_toggle, report_submit

---

## 8) Acceptance Criteria (critical)
- Home fold: Stage/KeyTakeaways skeletons within 1000ms; at least 1 takeaway line within 2000ms; PriceAlerts visible.
- Deals: alert set in ≤2 steps; DealPath visible with one tap.
- Answer: source badges clear; disclaimer always on; sensitive → doctor guidance.
- Timeline: at least 1 task; supports ≥2 of complete/reschedule/calendar sync.
- Community: can filter by stage/city/interests/language; MomCard/GroupCard CTAs for follow/DM/join; DM translation toggle works.
- A11y: random 10 items pass contrast, target size, and screen-reader checks.

---

## 9) Visual Polish Tips (rendering hints)
- Whitespace first: ≥16px vertical paddings on cards; body line-height ≥ 1.4  
- Color restraint: use Primary for main CTAs and key signals; rely on neutrals and soft backgrounds  
- Icon unity: line icons with consistent stroke; prefer badges over heavy color blocks for emphasis  
- Micro-interactions: card hover/press 80ms; BottomSheet 120–160ms; sparkline fade-in  
- Text rhythm: 3 concise bullets per takeaway; long content behind "Show more"

---

Note: Generate in order — Component Library → A/B → C1–C5 → D–Q — and ensure multilingual coverage, 4 states, and accessibility compliance.