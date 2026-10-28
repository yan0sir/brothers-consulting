# Content Requirements

_Updated 2026-10-19. **Draft English copy now exists in `copy-deck.md`**, written at the developer's request. It makes no factual claims (no years, numbers, clients, credentials or testimonials), and the approach-based promises it does make are listed for client confirmation. Contact details, Arabic copy and legal text remain `[[PLACEHOLDER]]`s._

## 1. Confirmed
- General consulting, based in Bahrain. Specialisms are not yet fixed, so copy stays discipline-neutral.
- English + Arabic.
- Contact: **WhatsApp** (primary) and **Call** (secondary). No booking tool and no form.
- Type- and graphics-led, so no photography is required.
- The developer maintains the site, so no CMS is needed.
- Pill buttons.
- **Arabic copy and legal details will be supplied later.** The build proceeds with placeholders.

## 2. Status of the English site content

| Item | Status |
|---|---|
| Positioning, page copy, areas of focus, process, CTAs, meta | **Drafted.** See `copy-deck.md`, awaiting approval |
| Claims in the copy (senior access, fees agreed upfront, no-obligation first call, bilingual service, the five areas, client types) | **Client to confirm** (`copy-deck.md` §0) |
| Phone / WhatsApp number | `[[PHONE +973]]`, `[[WHATSAPP NUMBER +973]]` |
| Email | `[[EMAIL]]` |
| Hours | `[[HOURS]]` |
| Logo | **Traced SVGs** in `brand/logo/` (web-ready; redraw advised for print) |
| Wordmark typeface, Arabic name lockup | Unknown, optional |

## 3. Supplied later (placeholders until then)

| Item | Placeholder(s) | Where it appears |
|---|---|---|
| All Arabic copy | Every EN key mirrored in the AR locale file | `/ar/` pages |
| Arabic CTA labels and WhatsApp message | `[AR WHATSAPP CTA]`, `[AR CALL CTA]`, `[AR WHATSAPP MESSAGE]` | Buttons, sticky bar, wa.me link |
| CR number | `[CR NUMBER]` | Footer |
| Registered company name/address | `[LEGAL ENTITY NAME]`, `[OFFICE ADDRESS]` | Footer, Contact, legal pages |
| Privacy policy (EN + AR) | `[PRIVACY POLICY]` | `/privacy` |
| Terms of use (EN + AR) | `[TERMS OF USE]` | `/terms` |

**Before going live:** the English site can launch once the draft copy is approved and the contact placeholders are filled. Two items need attention first:
- Legal pages should not go public as placeholders. Either wait for the text, or hide the footer links to those pages until it arrives.
- Keep `/ar/` unpublished until the Arabic copy is in (recommended; see `project-brief.md` §7).

## 4. Content checklist

### Brand & identity
- [x] Logo SVG, full colour (traced, `brand/logo/`; confirm `#49354B`)
- [x] Logo, reversed version (traced)
- [x] Logo, symbol-only (traced)
- [ ] Arabic name/logo lockup (if one exists)
- [ ] Wordmark typeface name

### Company (EN now, AR later)
- [ ] `[COMPANY POSITIONING STATEMENT]` (1–2 sentences)
- [ ] `[INTRODUCTION TO THE BUSINESS]` (60–120 words)
- [ ] About page body (150–300 words)
- [ ] Leadership names/roles/bios (optional)

### Areas of focus (EN now, AR later)
- [ ] 3–6 areas: `[SERVICE TITLE]` + `[SERVICE DESCRIPTION]` (20–40 words)
- [ ] Services page: 60–120 words per area
- [ ] Sectors served, only if confirmed

### Differentiation & process (EN now, AR later)
- [ ] 3–4 `[KEY DIFFERENTIATOR]`s
- [ ] 3–5 engagement steps (step 1 = "Start a conversation" by WhatsApp or phone)

### Contact
- [ ] `[PHONE +973]`
- [ ] `[WHATSAPP NUMBER]` (if different)
- [ ] `[HOURS]` (Bahrain time)
- [ ] `[WHATSAPP MESSAGE]` (EN)
- [ ] `[EMAIL]`
- [ ] `[CONTACT INTRO]` and `[CTA HEADLINE]` (EN)
- [ ] Social links (if any)

### Insights (Home section, placeholders now)
- [ ] Three real published articles or updates: title, category, date, link. Otherwise remove the section before launch.

### Proof (optional, never invented, expected to be absent at launch)
- [ ] Case studies, testimonials or client logos, each with written permission
- [ ] Licences, memberships or accreditations, with evidence

### Legal (later)
- [ ] CR number, legal entity name, registered address
- [ ] Privacy policy and terms (EN + AR), aligned with Bahrain PDPL; legal review recommended

### Technical
- [ ] Domain, DNS and hosting access
- [ ] Analytics preference (privacy-friendly, to count WhatsApp/Call clicks)

## 5. Placeholder conventions

| Placeholder | Approx. length (EN) |
|---|---|
| `[HERO HEADLINE]` | 6–12 words |
| `[SUPPORTING BRAND MESSAGE]` | 15–30 words |
| `[INTRODUCTION TO THE BUSINESS]` | 60–120 words |
| `[SERVICE TITLE]` / `[SERVICE DESCRIPTION]` | 2–5 / 20–40 words |
| `[KEY DIFFERENTIATOR]` | title 2–5 words + 15–30 words |
| `[STEP TITLE]` / `[STEP DESCRIPTION]` | 1–3 / 15–30 words |
| WhatsApp / Call CTA | "WhatsApp us" / "Call us" (fixed, draft) |
| `[CTA HEADLINE]` | 4–10 words |

- Placeholders render visibly in development (dashed outline) so they can't reach production unnoticed.
- Every key exists in both locale files from day one, so a missing Arabic string is obvious.
- Phone and WhatsApp numbers live in **one config value**, so changing the number updates every link and label.
