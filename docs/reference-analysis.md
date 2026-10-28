# Reference Analysis

_All three URLs were opened in a browser on 2026-10-16. Typography, colours and layout metrics were read from the live pages' computed styles; page text and structure were read from the DOM. Visual screenshots rendered only partially (heavy preloaders, WebGL canvases and video), so a few observations about imagery are lower-confidence and are marked **(partial view)**. If you have full-page screenshots you particularly like, send them and I'll refine this._

The references are **inspiration for principles, not templates.** Their content, layouts, brand assets and copy belong to them and must not be reproduced.

---

## 1. Creandum — creandum.com

European venture capital firm.

| Aspect | Observation |
|---|---|
| **Identity & mood** | Confident, bold, slightly rebellious. Dark, immersive, "we're early and certain". |
| **Typography** | Three families with distinct jobs: **Monument Grotesk Bold** (display, uppercase, tight leading ≈ 0.86), **Tobias** (a sharp serif for philosophical statements, ≈ 48px), **TT Hoves** (body/UI at 400–600). Nav is 12px uppercase, tracked +0.08em. Big jumps in scale: H1 58px, section H2 up to 85px, body 12–16px. |
| **Colour** | Near-monochrome: deep forest green `#081C15` as both the dark background and the text colour on light; white; a pale blush `#EAE1E1` as the alternate surface; a single saturated green `#05572B` used sparingly. Translucent overlays (`#081C15` at 30%/90%). |
| **Grid & layout** | Full-bleed sections, large left-aligned headlines, long vertical scroll (≈ 8,000px at 1024px wide). |
| **Navigation & structure** | Minimal uppercase text nav: Team · Commitments · Stories · Talent · Contact. Homepage: manifesto hero → founder quotes → philosophy statement → portfolio carousel (numbered 01/07) → "We commit as one team" → offices → perspectives → footer. |
| **Imagery** | Portfolio and team photography; WebGL canvas in the hero **(partial view)**. |
| **CTAs** | Understated text links ("View all", "Discover", "Meet us") — no heavy buttons. |
| **Whitespace & contrast** | Very high contrast; whitespace used to isolate single statements. |
| **Motion** | GSAP + Lenis smooth scroll, canvas/WebGL hero, preloader, carousel. |
| **What makes it work** | A clear *point of view* expressed in copy and type. The serif/grotesk contrast gives "voice" vs "statement". A tiny palette used with total discipline. |

**Useful principles:** a two-voice type system (statement serif + structural sans); a near-monochrome palette built from one brand hue; text-link CTAs; big confident statements.
**Leave behind:** forest-green palette, all-caps manifesto styling, WebGL hero, the founder-quote wall (depends on famous clients we don't have), heavy preloader.

---

## 2. Motive Partners — motivepartners.com

Private equity / fintech investor.

| Aspect | Observation |
|---|---|
| **Identity & mood** | Corporate, assured, institutional. Calm and data-forward. |
| **Typography** | A single family — **Avenir Next LT Pro** at 400/500 — sentence case throughout. Stats at 47px with slight negative tracking; section headings 30px; card headings 23px; body 15px; labels 12px uppercase. Modest scale contrast. |
| **Colour** | Black, `#222` charcoal and white, with light grey surfaces (`#F1F1F1`, 6% grey cards). Small **sector-coded accents** (blue `#6F88DB`, green `#699A6F`, amber `#ECB85A`) used only as category markers. |
| **Grid & layout** | Very wide container (max 1792px), ≈ 39px side padding, thin top borders dividing sections. Card grids for insights and sectors. |
| **Navigation & structure** | Black header: About · Portfolio · Team · Insights · News · Login · **Get in touch** (CTA separated right). Homepage: video hero → stat bar (Founded / Investments / Raised / People) → insights carousel → Approach (Invest / Operate / Innovate) → Portfolio & industries → news. |
| **Imagery** | Hero video ("Play full video"); abstract gradient art and editorial thumbnails on cards **(partial view)**. |
| **CTAs** | Text links and "Explore our approach / Go to page" patterns; one persistent "Get in touch" in the header. |
| **Whitespace & contrast** | Even and orderly; contrast mostly black/white. |
| **Motion** | Webflow + GSAP ScrollTrigger + Swiper carousels; restrained reveals. |
| **What makes it work** | Clarity. A simple three-pillar "approach" explains the business in seconds. Credibility through structure and (real) figures. |

**Useful principles:** a three-step "approach" model that explains *how* the firm works; persistent "Get in touch" CTA; thin rules dividing sections; restrained category accents.
**Leave behind:** the stat bar (we have no verified figures — never invent them), black header, very wide 1792px container (too sparse for a smaller content set), video-first hero (requires footage).

---

## 3. Outsource Consultants (OCI) — oci.madebybuzzworthy.com

NYC building-code and permits consultancy. _Note: this is the design agency's staging domain, so it may differ from the live site._

| Aspect | Observation |
|---|---|
| **Identity & mood** | Swiss/architectural, technical, contemporary. Precise rather than warm. |
| **Typography** | **PP Neue Montreal** 400/500 (sans) paired with **GT America Mono** for labels, descriptions and nav. Extreme scale contrast: display ≈ 114px vs mono descriptions ≈ 8.5–10px uppercase. |
| **Colour** | A single electric blue `#1925AA` (and a darker navy `#0D1355`) on warm off-white `#E8E6E0` and white. Blue is used as a duotone over architectural photography in the hero. |
| **Grid & layout** | Visible modular grid; information arranged in columns at the top of the hero; giant company name set bottom-left over the image. Square corners everywhere (radius 0). |
| **Navigation & structure** | Small mono nav columns; square icon button for menu. Homepage: duotone hero + intro → Services (6 items, each with a one-line description and "[ LEARN MORE ]") → "Here at every step" with a numbered 01–04 process → recent projects → testimonials → footer. |
| **Imagery** | Architectural photography with a blue duotone treatment — a strong, ownable look **(partial view)**. |
| **CTAs** | Bracketed text links "[ LEARN MORE ]", "VIEW ALL SERVICES"; circular outline icon buttons. |
| **Whitespace & contrast** | Generous; contrast carried by scale more than by colour. |
| **Motion** | GSAP + Lenis + Three.js; preloader; letter-by-letter text animation. |
| **What makes it work** | It is the closest analogue to a services consultancy: services → process → proof → testimonials is a clean, persuasive journey. The duotone image treatment unifies mixed photography. |

**Useful principles:** services-first homepage journey; numbered process; a single-colour duotone treatment to unify disparate photos; mono "label" voice for metadata.
**Leave behind:** blue palette, bracket-link styling, tiny 8–10px uppercase body text (fails readability), letter-split text (OCI inserts invisible joiner characters between words, which hurts copy/paste, search and screen readers), Three.js effects.

---

## 4. Where the references conflict

| Tension | Creandum | Motive | OCI | Resolution for Brothers Consulting |
|---|---|---|---|---|
| Light vs dark | Dark-led | Black/white mix | Light-led | **Light-led**, with one or two deep-plum sections for rhythm. Plum on ivory is warmer and more approachable than an all-dark site. |
| Type voice | Loud uppercase grotesk + serif | Single quiet sans | Swiss sans + mono | **Sentence-case** geometric sans (echoes the logo) + a refined serif for statements; mono optional for small labels only. |
| Motion | Immersive WebGL | Restrained reveals | Heavy/split-text | **Restrained**: purposeful reveals, no scroll-jacking or WebGL. |
| Proof | Famous founders' quotes | Hard numbers | Named projects + quotes | Use **only what the client can verify**; design sections to be removable. |
| Corners | Square | Square | Square | Mostly square/very small radius; pill buttons as a subtle nod to the logo's rounded mark (**confirmed 2026-10-19**). |

## 5. Shared principles worth adopting

1. **Discipline over decoration** — one brand hue, neutrals, and almost nothing else.
2. **Typographic hierarchy does the heavy lifting** — large, confident headings; calm body text.
3. **Clear explanation of how the firm works** (approach / process) before asking for contact.
4. **Text-led CTAs** with one persistent primary action.
5. **A consistent image treatment** that makes the photography feel owned.
