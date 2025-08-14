# SuperMom: AI for 1M Moms (EN) - UXPilot Prompts

This file can be copied directly into uxpilot.ai as the project brief and UI generation prompts.

---

## Global Project Brief
Goal: Build a mobile-first AI assistant app that helps 1,000,000 moms in Southeast Asia save time, save money, feel safer, and feel cared for.  
Audience: Preconception / Pregnancy / Newborn / Infant & Toddler families (languages: EN/ID/TH/VI/MY/PH)  
Style: Warm, trustworthy, simple, scannable; mobile-first  
Usability: One-hand reach; primary actions near bottom; moderate info density; visible "Trust labels" and sources  
Accessibility: Contrast ≥ 4.5:1; body text ≥ 14pt; small text mode / color-weak mode; language switch  
Primary nav (bottom tabs): Home | Search | Assistant | Benefits/Events | Me  
Core value on one screen: Stage card, key takeaways, price alerts, benefit cards, safety cues

---

## Design Tokens
Colors:
- Primary #6F52ED (warm purple) / Hover #5C3FE3
- Accent #FF8A65 (peach)
- Success #22C55E  Warning #F59E0B  Danger #EF4444  Info #2563EB
- Text #111  Subtext #666  Divider #EAEAEA  BG #FFFFFF  BG-Soft #F7F7FB
Radius: Buttons/Cards 12px; Inputs 10px  
Shadow: Card soft shadow 0 4 12 rgba(0,0,0,0.06)  
Typography: Inter + Noto Sans (auto local language), weights 400/600  
Spacing: 8px grid; container padding 16px; section gaps 24px  
Icons: Tabler Icons or Material Symbols (line style)  
States: default/hover/disabled/loading/error; prepare both light/dark

---

## Key Screen Prompts (generate per screen)

### Screen 1 | Onboarding + Consent + Language
Goal: Quickly select language, consent to data use, and guide stage setup  
Layout: Top logo; segmented language cards; consent toggles (use cases + link to privacy policy); CTA "Start my journey"  
Elements:
- Language cards: English / Bahasa Indonesia / ไทย / Tiếng Việt / Melayu / Filipino (with search)
- Consent purposes: Personalization, price alerts, event recommendations, research invites (each toggleable)
- Tip: Consent can be withdrawn anytime in Privacy Settings  
States: Disable CTA until language is chosen; if all consent off, show a gentle "Some features will be limited" notice

### Screen 2 | Stage Setup
Goal: Establish tags for Preconception / Pregnancy / Baby age band  
Layout: Stepper; three cards: Preconception / Pregnancy / Baby; bottom CTA "Done"  
Elements:
- Preconception: intentions and interested topics only  
- Pregnancy: due date picker → auto gestational week  
- Baby: date of birth or pick age band (0–3 / 4–6 / 7–12 / 13–24 months…)  
Copy: Title "How far are we on this journey?"; helper "This helps tailor content and benefits for you"

### Screen 3 | Home (Stage-aware Feed)
Goal: See key takeaways, stage card, price alerts, and benefits at a glance  
Layout: Top search + inbox; horizontal stage cards; Key Takeaways card (RAG source badges); Price Alerts widget; Benefit/Event cards; curated content list; bottom tabs  
Elements:
- Stage card: week/month and 3 short takeaways for this week  
- Key takeaways: a templated question (e.g., "What should I note this week?") + 3 bullets + "View sources"  
- Price alerts: tracked SKUs (formula, diapers); drop badges; "Add alert"  
- Benefits: geo + stage-based; "View details / One-tap apply"  
Empty state: Coach to add price alerts / enable location

### Screen 4 | Semantic Search
Goal: Find trustworthy answers and relevant products faster  
Layout: Natural language search; result sections: Answer card (RAG) / Product cards / Experience posts / Benefits; filters (stage, language, trusted sources)  
Elements:
- Answer card: title + 3 bullets + source badges (hospital / gov / association)  
- Product card: image, name, price, rating, halal/ingredient tags, tiny price trend sparkline  
- Experience posts: author, summary, translation toggle  
States: skeleton loading; empty → suggest "Ask AI Assistant"

### Screen 5 | Answer Detail (RAG Answer)
Goal: Reassurance and traceability  
Layout: Title; bullet list; expandable "View full sources"; related questions; "Not sure / See a doctor" guide; usefulness feedback  
Elements:
- Disclaimer: Not medical advice  
- Sources: clickable institution links  
- Feedback: Helpful / Not enough + free-text comment

### Screen 6 | Deals (Price Alerts & Savings Path)
Goal: Set alerts and view price drops and best savings path  
Layout: Top "My alerts"; product list (image/name/current price/price trend/lowest net); bottom sheet "Set alert" (target price/channels/notification)  
Elements:
- Savings path: cross-merchant stacking (coupon/cashback/threshold) → show "Estimated net price"  
- Trust: merchant credibility badge; risk cues (low stock, near expiry)  
States: empty guidance; success toast after setup

### Screen 7 | Benefits & Events
Goal: Local benefits/subsidies/parent classes/expo registration  
Layout: Filters: city/time/stage; cards with title, organizer, time/place, CTA; "My registrations"  
Elements:
- Expo: entry point to "Expo Assistant"  
- Benefits: required documents checklist + tips

### Screen 8 | Expo Assistant
Goal: Personalized route, booth list, crowd-avoid tips, "Take-home" recap  
Layout: Top expo info; route suggestion by time slots; booth list (brand/deal/map index); QR scan to add to "Take-home"  
Elements:
- One-tap route (by budget/interests/crowd)  
- Post-expo summary: what I got; unredeemed reminders

### Screen 9 | Timeline & Reminders
Goal: Unified reminders for vaccines/checkups/subsidies/refills  
Layout: Timeline; item cards (task/time/location or online link/documents/status); filter by type  
Elements:
- One-tap complete/log  
- Calendar sync; missed reminder handling

### Screen 10 | AI Assistant (Chat)
Goal: Natural language Q&A, list generation, route planning  
Layout: Intent chips ("Hospital bag checklist", "This week’s key points", "Expo route"); chat bubbles; answer cards support "Insert to list / Add reminder / Set price alert"  
Elements:
- Multilingual input and instant translation  
- Medical topics: prioritize trusted sources + see-a-doctor guidance

---

## Shared Component Library Prompt
Please generate and reuse a shared component library across screens:  
- Header: title/subtitle/search entry/language switch  
- StageChip: preconception/pregnancy/month badges + colors  
- TrustLabel: badges for trusted sources (hospital/gov/association)  
- PriceTag: now/original/tiny sparkline/lowest net  
- DealPath: visualized stacking (coupon/cashback/threshold)  
- BenefitCard: documents checklist/online link/stage badge  
- EventCard: time/place/register/crowd hint  
- TimelineItem: type icon/time/actions  
- AnswerCard: RAG answer (title/bullets/sources/feedback)  
- EmptyState: illustration + guidance CTA  
- ConsentBlock: toggles with policy links  
- Toast/Snackbar: success/failure/alert  
- BottomSheet: alert settings/pickers  
- Loading: skeletons (list/cards/paragraph)

---

## Copy & Multilingual Examples
- CTA: Start / Mulai / เริ่มต้น / Bắt đầu / Mulakan / Simulan  
- Tip: You can withdraw consent anytime in Privacy Settings  
- Disclaimer: This information does not replace medical diagnosis. Seek care for urgent symptoms.

---

## Delivery Tips
- Start with mobile portrait; then adapt responsively to tablet/desktop  
- Provide four states per screen: default/loading/empty/error  
- Pre-fill lists with sample data (3–6 items) for review  
- Use trust labels and source badges in medical-adjacent contexts

---

## How to Use in uxpilot.ai
1) Paste the Global Project Brief and Design Tokens first  
2) Paste each Key Screen Prompt to generate screens (mobile-first)  
3) Paste the Shared Component Library Prompt to unify styles  
4) Follow Delivery Tips to add states and multilingual variants