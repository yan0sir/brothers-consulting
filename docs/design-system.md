# Design System — Foundations

_Direction A, **revised to v2 (reference-led) on 2026-10-19: see `creative-direction.md` §6. Superseded in part by v3 (§7 of creative-direction.md). Where this file and `src/assets/css/tokens.css` differ, tokens.css wins.** Bilingual EN/AR (RTL), type- and graphics-led, pill buttons. Colour values derived from the supplied logo are **estimates** until confirmed with a vector file. The typeface pairing still needs testing with real Arabic copy. Everything is expressed as tokens so it can be tuned in one place._

## 1. Colour tokens

```css
:root {
  /* Brand */
  --plum-900: #2A1E2C;  /* dark sections, footer */
  --plum-700: #49354B;  /* brand (from logo) — primary actions, links */
  --plum-500: #6E5670;  /* hover on dark, graphics */
  --plum-200: #D9CED8;  /* tints, tags, selection */
  --plum-50:  #F4EFF3;  /* subtle highlight */

  /* Neutrals */
  --ivory: #F7F4EF;     /* page background */
  --stone: #ECE6DE;     /* alternate sections */
  --white: #FFFFFF;     /* cards, inputs */
  --ink:       #231A24; /* headings */
  --ink-soft:  #3E3540; /* body */
  --ink-muted: #6B6070; /* meta, captions */
  --line:        #DDD4D2;
  --line-strong: #B9AEB3;

  /* Accent (optional — decorative on light) */
  --brass:       #B88A4E;
  --brass-light: #D6B07A;

  /* States */
  --focus:   #7C4D86;
  --error:   #A3363A;
  --success: #3F6B4E;

  /* Semantic aliases */
  --bg: var(--ivory);
  --bg-alt: var(--stone);
  --bg-inverse: var(--plum-900);
  --text: var(--ink-soft);
  --text-heading: var(--ink);
  --text-inverse: var(--ivory);
  --action: var(--plum-700);
  --action-hover: var(--plum-900);
}
```

**Contrast (calculated, WCAG 2.2 AA requires 4.5:1 body / 3:1 large & UI):**

| Pair | Ratio | Use |
|---|---|---|
| ink on ivory | 15.4 | ✅ headings |
| ink-soft on ivory | 10.7 | ✅ body |
| plum-700 on ivory | 10.1 | ✅ links, buttons |
| ink-muted on ivory / stone | 5.4 / 4.8 | ✅ small meta |
| ivory on plum-900 | 14.5 | ✅ dark sections |
| brass-light on plum-900 | 7.8 | ✅ eyebrows on dark |
| focus on ivory | 5.9 | ✅ focus ring |
| brass on ivory | 2.8 | ⚠️ decorative only (rules, shapes) |
| line-strong on ivory | 2.0 | ⚠️ inputs need ink-muted border instead (see §9) |

## 2. Typography

Bilingual EN/AR is confirmed, so every role is defined as a **Latin + Arabic pair** with matching tone and weight. All faces are free (Google Fonts / OFL) and are self-hosted.

| Role | Latin | Arabic | Notes |
|---|---|---|---|
| Display / statements | **Instrument Serif** 400 (+ italic) | **Noto Naskh Arabic** 500–600 | Naskh is the calligraphic counterpart to a refined serif: elegant but highly legible. Arabic has no italic, so emphasis uses colour (plum) instead. |
| UI / body | **Readex Pro** 300–600 | **Readex Pro** 300–600 | A single family designed for Latin *and* Arabic together, so weights and colour match across languages. Its geometric Latin echoes the logo wordmark. |
| Numerals / labels | Readex Pro (tabular) | Readex Pro | No separate mono face: one less font to load, and it handles both scripts. |

Alternatives, if the pairing doesn't test well: Latin body **Figtree** + Arabic **IBM Plex Sans Arabic**; Arabic display **Amiri**.

Loading: WOFF2, `font-display: swap`, subset per script (`unicode-range`) so English pages don't download Arabic glyphs and vice versa. Preload only the display weight used in the hero. Maximum about 5 font files per locale.

Arabic tuning (applied via `:lang(ar)`):
- Body size +1 step (≈ 18px) and line-height 1.8. Arabic glyphs sit smaller on the x-height and need more vertical room.
- `letter-spacing: 0` always. Tracking breaks Arabic letter joining, so eyebrows lose their tracked uppercase style in AR and use weight + plum colour instead.
- Display line-height 1.3–1.4 rather than 1.0–1.1, to clear ascenders and descenders.

### Responsive type scale (fluid, 360px → 1440px)

| Token | Size | Line-height | Font / weight |
|---|---|---|---|
| `--fs-display` | `clamp(2.75rem, 1.6rem + 5vw, 6rem)` | 1.0 | Serif 400 |
| `--fs-h1` | `clamp(2.25rem, 1.5rem + 3.2vw, 4.5rem)` | 1.05 | Serif 400 |
| `--fs-h2` | `clamp(1.875rem, 1.4rem + 2vw, 3rem)` | 1.1 | Serif 400 |
| `--fs-h3` | `clamp(1.375rem, 1.2rem + 0.8vw, 1.75rem)` | 1.25 | Sans 600 |
| `--fs-h4` | `1.25rem` | 1.3 | Sans 600 |
| `--fs-lead` | `clamp(1.125rem, 1.05rem + 0.35vw, 1.3125rem)` | 1.55 | Sans 400 |
| `--fs-body` | `1.0625rem` (17px) | 1.65 | Sans 400 |
| `--fs-small` | `0.875rem` | 1.5 | Sans 400/500 |
| `--fs-eyebrow` | `0.75rem`, uppercase, `letter-spacing: 0.1em` | 1.4 | Sans 600 or Mono 400 |

Headings: sentence case, `letter-spacing: -0.01em` at display sizes, `text-wrap: balance`. Body measure: max `65ch`.

## 3. Spacing scale (4px base)

`--space-1: 4px · 2: 8px · 3: 12px · 4: 16px · 5: 24px · 6: 32px · 7: 48px · 8: 64px · 9: 96px · 10: 128px · 11: 160px`

- Section padding (block): `clamp(4rem, 2.5rem + 6vw, 9rem)`
- Heading → body: `--space-5`; paragraph gap: `--space-4`; component gap in grids: `--space-6`–`--space-7`

## 4. Grid & containers

| Token | Value |
|---|---|
| `--container-max` | 1440px (outer, for full-bleed bands) |
| `--content-max` | 1280px (default content) |
| `--prose-max` | 720px (long text) |
| `--gutter-inline` | `clamp(20px, 4vw, 64px)` (page side padding) |
| Columns | 12 desktop · 8 tablet · 4 mobile |
| Column gap | `clamp(16px, 2vw, 32px)` |

Common splits: 5/7, 4/8, 6/6. Use logical properties (`margin-inline`, `padding-inline-start`) everywhere for RTL.

## 5. Breakpoints

| Name | Min width |
|---|---|
| `sm` | 480px |
| `md` | 768px |
| `lg` | 1024px |
| `xl` | 1280px |
| `2xl` | 1536px |

Mobile-first. Navigation collapses below `lg`.

## 6. Graphics & imagery

**Confirmed: type- and graphics-led.** The primary visual system is described in `creative-direction.md` §5.

- **Pair forms:** inline SVG, filled with tokens (`--plum-50`, `--stone`, `--ivory` on dark, `--plum-700` at most for a single focal shape). Always cropped by the section edge. One per section, maximum. Mirrored in RTL via `transform: scaleX(-1)` under `[dir="rtl"]`, or by positioning with `inset-inline-end`.
- **Hairlines:** 1px `--line` on light, 1px `rgb(247 244 239 / 0.2)` on dark, and `--brass` for process connectors.
- **Numerals:** display serif in Latin; in Arabic, display Naskh with the agreed numeral system.
- `aria-hidden="true"` on all decorative graphics.

_Contingency, only if photography is added later:_

| Context | Ratio | Rule |
|---|---|---|
| Hero (side) | 4:5 | Subject centred-third; safe area for headline overlap avoided |
| Hero (band) | 21:9 desktop → 4:5 mobile | Art-directed crops via `<picture>` |
| Service / case cards | 3:2 | Consistent focal point |
| Portraits | 4:5 | Same background, light and crop for every person |
| Editorial inline | 16:9 | — |

- Warm, natural grade; avoid saturated blues/greens fighting the plum.
- **Fallback treatment:** plum duotone (`--plum-900` → `--ivory`) to unify mixed or stock imagery.
- Always `alt` text, `width`/`height` set, lazy-load below the fold, AVIF/WebP.
- No generic handshake/skyline/stock-team clichés.

## 7. Radius, borders, shadows

- Radius: `--radius-0: 0` (images, sections, cards) · `--radius-sm: 4px` (inputs, tags) · `--radius-pill: 999px` (all buttons, plus the language switch. **Confirmed.** It echoes the rounded logo mark. Only actions are rounded, so they stand out against square cards and sections.)
- Borders: 1px `--line` for dividers; 1px `--ink-muted` for inputs
- Shadows: essentially none. One token for overlays/menus: `--shadow-pop: 0 12px 32px -12px rgb(42 30 44 / 0.25)`

## 8. Buttons & links

| Variant | Default | Hover | Active | Disabled |
|---|---|---|---|---|
| **Primary** | bg `--plum-700`, text `--ivory`, pill, `14px 28px`, Sans 600 | bg `--plum-900` | translateY(1px) | 40% opacity, no pointer |
| **Secondary** | 1px `--plum-700` border, text `--plum-700` | bg `--plum-50` | bg `--plum-200` | as above |
| **On dark** | bg `--ivory`, text `--plum-900` | bg `--brass-light` | — | — |
| **Text link (CTA)** | `--plum-700`, underline 1px offset 4px, trailing → | underline thickens / arrow nudges 4px | — | — |
| **Inline link** | `--plum-700`, underlined | `--plum-900` | — | — |

Minimum target size 44 × 44px. Arrows in text links flip in RTL.

**Contact CTAs (fixed site-wide):**
- **WhatsApp us**: primary pill, with a monochrome WhatsApp glyph before the label (`currentColor`, 20px). Links to `wa.me` with a pre-filled message per locale. It does **not** use WhatsApp green; the plum identity leads.
- **Call us**: secondary pill, with a phone glyph. Links to `tel:`. The number is always visible as text next to it on desktop.
- **Mobile sticky bar:** fixed bottom, `--ivory` background, 1px top `--line`, two equal-width pills (WhatsApp primary, Call secondary), `padding-bottom: env(safe-area-inset-bottom)`. Shown after the hero, hidden over the footer. Page content gets a matching bottom padding so nothing is covered.
- Arabic labels arrive with the Arabic copy. Glyphs never flip.

## 8a. Bilingual / RTL rules

- `<html lang="en" dir="ltr">` / `<html lang="ar" dir="rtl">` per page. Never mix directions at page level.
- Logical properties only: `margin-inline-start`, `padding-inline`, `inset-inline-end`, `text-align: start`. No `left`/`right` in component CSS.
- Grid column placement uses line numbers, which flip automatically in RTL. Asymmetric splits (5/7) therefore mirror without extra CSS.
- Things that do **not** mirror: the logo, phone numbers, emails, URLs and Latin brand names. Wrap them in `<bdi>` or `dir="ltr"`.
- Things that **do** mirror: arrows, chevrons, "pair" graphic placement, process timelines and carousels (if any).
- `hreflang` alternates and a per-page language switch. The chosen language is remembered (cookie or `localStorage` convenience only). The URL stays the source of truth.
- Test every component in both directions before sign-off.

## 9. Forms (not used at launch)

_Contact is WhatsApp + Call only. These specs are kept so a form can be added later without redesign._

- Label above field (Sans 500, `--fs-small`, `--ink`); never placeholder-as-label.
- Input: bg `--white`, 1px `--ink-muted` border, `--radius-sm`, 48px min height, 16px text (prevents iOS zoom).
- Focus: border `--plum-700` + focus ring.
- Error: `--error` border + message below with icon and text (never colour alone).
- Required fields marked in text; form announces success/failure via `aria-live`.
- Spam protection without CAPTCHA puzzles where possible (honeypot / server-side checks).

## 10. Focus & hover

- Focus visible: `outline: 2px solid var(--focus); outline-offset: 3px;` — on dark sections use `--brass-light`.
- Never remove outlines without a replacement. Hover effects never carry the only signal.

## 11. Motion

| Token | Value | Use |
|---|---|---|
| `--dur-fast` | 150ms | Colour/opacity hovers |
| `--dur-base` | 250ms | Buttons, menus |
| `--dur-slow` | 600ms | Section reveals, image clips |
| `--ease-out` | `cubic-bezier(0.22, 1, 0.36, 1)` | Default |

Principles: motion clarifies, never decorates; reveal once (no repeat on scroll-up); stagger ≤ 80ms; no scroll-jacking, smooth-scroll libraries, WebGL or preloaders unless a later need justifies them; never split text into characters in the DOM. `@media (prefers-reduced-motion: reduce)` disables transforms and keeps only opacity fades.

## 12. Accessibility requirements (target: WCAG 2.2 AA)

- Contrast as per §1; text over images only with a solid or scrim backing.
- Semantic landmarks, one `h1` per page, logical heading order.
- Full keyboard operability; skip link; visible focus.
- `lang` and `dir` set per page (EN/AR); mirrored layouts tested in RTL.
- Resizable to 200% and reflow at 320px without horizontal scroll.
- Images with meaningful `alt`; decorative graphics `aria-hidden`.
- Performance budget: LCP < 2.5s on mid-range mobile, CLS < 0.1.

## 13. Component inventory (initial)

Header · Mobile menu · Language switch · Button (pill: primary / secondary / on-dark) · Text link · Eyebrow · Section heading block · Hero (type-led + pair graphic) · Pair graphic (SVG, mirrored) · Intro split · Numbered areas-of-focus list · Differentiator grid · Process steps (dark) · Contact band (WhatsApp + Call) · Contact cards · Mobile sticky contact bar · Contact details block · Footer · Case card (deferred) · Quote (deferred) · Placeholder marker (dev only)
