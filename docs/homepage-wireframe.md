# Sitemap & Homepage Wireframe

_Direction A (approved). Bilingual EN/AR, type- and graphics-led. Primary conversion: **WhatsApp**, secondary: **Call** (updated 2026-10-19; this replaces online booking). Sections marked **CONDITIONAL** are built only if the client supplies real content for them._

## 1. Sitemap

| Page (EN / AR) | Purpose | Status |
|---|---|---|
| `/` · `/ar/` Home | Orient, build trust, lead to WhatsApp or a call | Core |
| `/about` · `/ar/about` About | Who the company is and how it works | Core |
| `/services` · `/ar/services` Services | All areas of focus on one page with anchors; can split into detail pages later | Core |
| `/contact` · `/ar/contact` Contact | WhatsApp, call, email, address and hours | Core |
| Privacy · Terms (both languages) | Legal | Core. Text supplied later; templated with placeholders. |
| Service detail template | One page per area, once specialisms settle | Deferred, design ready |
| Insights · Case studies · Careers | — | Deferred, only with real content |

**Navigation:** `About · Services · Contact` + pill **WhatsApp us** + language switch `EN | عربي`.
In Arabic the header mirrors: logo on the right, CTA on the left.

**Language switch rules:** it links to the *same page* in the other language, it is labelled in the target language ("عربي" / "English"), it sets `lang` and `dir` on `<html>`, and it never uses flag icons. While the Arabic copy isn't ready, the switch can be hidden behind a build flag (see `project-brief.md` §7).

## 2. Contact model

| Channel | Role | Link | Behaviour |
|---|---|---|---|
| **WhatsApp** | Primary CTA | `https://wa.me/973XXXXXXXX?text=…` | Opens the WhatsApp app on mobile, or WhatsApp Web/Desktop on a computer. The message is pre-filled in the page's language, e.g. _"Hello Brothers Consulting, I'd like to discuss…"_ (draft). |
| **Call** | Secondary CTA | `tel:+973XXXXXXXX` | Tap-to-call on mobile. On desktop the number is always **shown in full as text**, because `tel:` links often do nothing on computers. |
| Email | Tertiary | `mailto:` | Shown on the Contact page and in the footer only. |

- **Labels (EN, draft):** "WhatsApp us" · "Call us". Arabic labels come with the Arabic copy.
- **Icons:** the WhatsApp glyph in monochrome (ink, or ivory on dark), following WhatsApp's brand guidelines. No green blobs, because the plum identity stays in charge. A simple phone glyph for Call.
- **Mobile:** a slim sticky bar at the bottom of the screen with two equal pills, `WhatsApp | Call`. It appears after the hero scrolls out of view and hides while the footer is visible, so it never covers the footer's contact details. It respects safe-area insets.
- **Hours:** shown next to both channels (`[HOURS]`, Bahrain time), so people know when to expect a reply.
- **No form and no scheduler** means no third-party embeds and no stored personal data on the site. That keeps privacy obligations and page weight minimal.
- **Tracking (optional):** count clicks on `wa.me` and `tel:` links with privacy-friendly analytics.

## 3. Homepage journey

```
Orient ─► Understand ─► Believe ─► Talk
Hero       Intro / Areas of focus   Why us / How we work   WhatsApp/Call band
```

## 4. Homepage sections

### 4.1 Header & navigation
- **Purpose:** Recognition, wayfinding and a constant route to WhatsApp.
- **Information:** Logo (`brand/logo/brothers-consulting-logo-no-tagline.svg`), 3 nav links, WhatsApp pill, language switch.
- **Composition:** Ivory, sticky, compact with a hairline border on scroll. Below `lg`, the header keeps only the logo, language switch and menu, and the sticky bottom bar takes over the CTAs.
- **Copy:** see `copy-deck.md` §1. Optional: ask whether an Arabic name/logo lockup exists.

### 4.2 Hero
- **Purpose:** Say clearly who the firm is and invite a conversation.
- **Information:** `[HERO HEADLINE]` (6–12 words), `[SUPPORTING BRAND MESSAGE]` (15–30 words), **WhatsApp us** (primary pill), **Call us** (secondary pill), with the phone number visible beneath on desktop.
- **Composition:** Type-led. Headline spans cols 1–8, with the supporting text and two pills beneath (cols 1–6). A large cropped "pair" graphic sits at the opposite edge and mirrors in RTL.
- **General-consulting guidance:** the headline describes the outcome or relationship, not a discipline.
- _Draft copy, tone only, requires confirmation:_ "Clear thinking for the decisions that shape your business." / "A Bahrain-based consultancy. Tell us what you're working on."

### 4.3 Brand introduction
- **Information:** `[INTRODUCTION TO THE BUSINESS]` (60–120 words), `[EYEBROW LABEL]`.
- **Composition:** Stone band, eyebrow + statement (cols 1–4), paragraph (cols 6–11).
- **Still needed:** Positioning. No history or "Brothers" narrative until confirmed.

### 4.4 Areas of focus (services)
- **Information:** 3–6 × `[SERVICE TITLE]` + `[SERVICE DESCRIPTION]` (20–40 words). These can be broad and renamed later.
- **Composition:** Ruled, numbered list: numeral · title · description · arrow to `/services#anchor`. Handles 3–9 items.

### 4.5 Why us (differentiators)
- **Information:** 3–4 × `[KEY DIFFERENTIATOR]`.
- **Composition:** Heading at cols 1–4, a 2×2 grid at cols 6–12 with hairlines. No icons.
- **Still needed:** Real differentiators. Possible angles to *ask* about: local knowledge, bilingual service, direct access to senior people. Nothing is published unconfirmed.

### 4.6 How we work (process)
- **Information:** 3–5 × `[STEP TITLE]` + `[STEP DESCRIPTION]`. Step 1 is **"Start a conversation"**, by WhatsApp or phone, which ties the process to the CTAs.
- **Composition:** Deep-plum anchor section. Ivory serif heading, brass numerals on a connecting hairline, a cropped ivory "pair" form, and an on-dark WhatsApp pill at the end.

### 4.7 Proof — CONDITIONAL
Only real, permitted material. Expected to be absent at launch. The page reads complete without it.

### 4.8 Contact band
- **Information:** `[CTA HEADLINE]`, `[CTA SUPPORTING LINE]` (e.g. reply times), WhatsApp pill, Call pill, the phone number displayed large, `[HOURS]`.
- **Composition:** Stone band. Oversized serif headline left. On the right, the phone number in display serif (so it works as a visual and a usable link) with the two pills below.

### 4.9 Footer
- **Information:** Reversed logo, nav, WhatsApp, `[PHONE +973]`, `[EMAIL]`, `[OFFICE ADDRESS, BAHRAIN]`, `[CR NUMBER]`, legal links, language switch, ©.
- **Composition:** `plum-900`, 4 columns → stacked.
- **Still needed:** Legal details. These are supplied later and the placeholders stay visible until then.

## 5. Contact page (`/contact`)

```
┌──────────────────────────────────────────────────────────────┐
│ Let's talk (H1, draft)                                       │
│ [CONTACT INTRO — 1–2 lines: what to send, when we reply]      │
├──────────────────────────────┬───────────────────────────────┤
│  ┌────────────────────────┐  │  ┌─────────────────────────┐  │
│  │ WhatsApp               │  │  │ Call                    │  │
│  │ [Short line]           │  │  │ +973 XXXX XXXX (large)  │  │
│  │ (WhatsApp us)          │  │  │ (Call us)               │  │
│  └────────────────────────┘  │  └─────────────────────────┘  │
├──────────────────────────────┴───────────────────────────────┤
│ Email [EMAIL]   ·   Hours [HOURS]   ·   Office [ADDRESS] → map │
└──────────────────────────────────────────────────────────────┘
```

Two equal, square-edged cards with pill buttons. WhatsApp sits first in the reading order (it is mirrored in RTL). The map is a plain link to Google/Apple Maps rather than an embed, so there are no third-party cookies.

## 6. Low-fidelity wireframe (desktop, EN; AR is mirrored)

```
┌──────────────────────────────────────────────────────────────┐
│ [LOGO]           About  Services  Contact  عربي  (WhatsApp us)│
├──────────────────────────────────────────────────────────────┤
│ [HERO HEADLINE — serif, 2–3 lines]                     ◖◗    │
│ [SUPPORTING MESSAGE]                                 (pair    │
│ (WhatsApp us) (Call us)   +973 XXXX XXXX             graphic) │
├──────────────────────── stone ───────────────────────────────┤
│ EYEBROW          │  [INTRODUCTION TO THE BUSINESS ...]        │
├──────────────────────────────────────────────────────────────┤
│ Areas of focus                                               │
│ 01  [SERVICE TITLE]     [SERVICE DESCRIPTION]             →  │
│ 02  [SERVICE TITLE]     [SERVICE DESCRIPTION]             →  │
├──────────────────────────────────────────────────────────────┤
│ Why us           │ [DIFF 1]        │ [DIFF 2]                 │
│                  │ [DIFF 3]        │ [DIFF 4]                 │
├══════════════════════ plum-900 ══════════════════════════════┤
│ How we work                                             ◖◗   │
│  01 ───── 02 ───── 03 ───── 04              (WhatsApp us)    │
├──────────────────────── stone ───────────────────────────────┤
│ [CTA HEADLINE]                    +973 XXXX XXXX             │
│                                   (WhatsApp us) (Call us)    │
├══════════════════════ plum-900 ══════════════════════════════┤
│ LOGO   Nav   Contact   Address · CR   Legal   EN|عربي   ©     │
└──────────────────────────────────────────────────────────────┘
Mobile: sticky bottom bar  [ WhatsApp ][ Call ]
```

## 7. Resilience and RTL rules
- Headings are fluid and allowed to wrap. No fixed heights. Arabic is never designed to English line breaks.
- Lists work from 3 to 9 items. CONDITIONAL sections can be removed without gaps.
- Only logical CSS properties.
- Arrows flip in RTL. The logo, phone numbers, emails and the WhatsApp glyph do not.
- Phone numbers are always wrapped in `dir="ltr"` (`<bdi>`), so "+973" doesn't jump to the wrong end in Arabic.
- The single source for the phone and WhatsApp number is one config value, used by every link, the displayed text and the pre-filled message.
