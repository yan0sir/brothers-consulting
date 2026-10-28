# Project Brief — Brothers Consulting Company W.L.L

_Status: Discovery complete, direction approved, pre-implementation. Last updated: 2026-10-19._

## 1. Objective

Design and build a bespoke, bilingual (English/Arabic) business website for **Brothers Consulting Company W.L.L**, a consulting company based in **Bahrain**. The site should feel professional, visually distinctive and intentionally designed for this brand. Its main job is to get qualified visitors to **start a conversation on WhatsApp or by phone**.

## 2. Approved decisions (2026-10-19)

| # | Decision | Outcome |
|---|---|---|
| 1 | Creative direction | **Direction A — "Considered Counsel"** (recommended and adopted) |
| 2 | Languages | **English + Arabic**, with full RTL support |
| 3 | Business definition | **General consulting**, Bahrain-based. The client has not fixed its specialisms, so the site must stay discipline-neutral and make it easy to add or change services later. |
| 4 | Primary conversion | **WhatsApp** (primary) and **Call** (secondary). This replaces online booking: no scheduler and no form. |
| 5 | Imagery | **Type- and graphics-led.** No photography dependency. |
| 6 | Editing after launch | **The developer (you) maintains the site**, so no client-facing CMS is needed. |
| 7 | Button shape | **Pill-shaped buttons** |
| 8 | Legal details & Arabic copy | **Supplied later.** The build goes ahead with labelled placeholders in both locales. |

## 3. What we have

| Input | Status | Notes |
|---|---|---|
| Logo | PNG, 287 × 71 px + **traced SVG set** | Single colour, deep plum `#49354B` (estimate). No original vector exists. SVGs traced from the PNG are in `brand/logo/`: good for web, redraw recommended for print. |
| Reference sites | 3, analysed | See `reference-analysis.md`. |
| Copy (EN) | **Draft v1 written** | `copy-deck.md`. Needs client approval, especially the claims checklist in §0. |
| Contact details | Placeholders | Phone/WhatsApp, email and hours are `[[PLACEHOLDER]]`s for now. |
| Copy (AR), legal | Later | Placeholders. |

## 4. Implications of the decisions

- **General consulting:** the copy must describe how the firm works and the value it gives, not a specific discipline. Services are shown as a flexible list of **areas of focus**. It launches on one Services page and can grow into detail pages without a redesign.
- **Bilingual:** every layout uses logical CSS properties. The typefaces are chosen as Latin/Arabic pairs. Arabic copy must be written or properly translated by a professional, not machine-translated.
- **Bahrain:** the footer shows the CR number and Bahrain address. Phone numbers use the +973 format, and opening hours are shown in Bahrain time. With no form or scheduler, the site collects no personal data itself. A privacy policy is still needed for analytics and to explain WhatsApp/phone contact (Bahrain PDPL).
- **Type and graphics:** a graphic language built from the logo's two paired forms replaces photography (see `creative-direction.md` §5).
- **WhatsApp + Call:** a WhatsApp pill is the primary CTA everywhere, with Call as the secondary. On mobile, a sticky bottom bar holds both. On desktop, the phone number is always shown as text. One config value drives every link (see `homepage-wireframe.md` §2).
- **Content arriving later:** Arabic routes, RTL layouts and legal page templates are built from the start with visible placeholders. Real text is dropped into the locale/content files when it arrives, with no layout work needed.

## 5. Sitemap

```
/            Home (EN)          /ar/            الرئيسية (AR)
/about       About              /ar/about       من نحن
/services    Services (areas of focus; detail pages added later as needed)
/contact     Contact (WhatsApp · Call · Email · Address)
/privacy · /terms               (+ /ar/ equivalents)
```

Deferred until real content exists: Insights, Case studies, Careers, service detail pages.

## 6. Technical approach (built 2026-10-19)

Astro was the recommendation, but Node.js isn't installed on the development machine. The site was therefore built with no dependencies:
- **Static HTML/CSS/JS** in `site/`, assembled from `src/` by `tools/build.ps1` (Windows PowerShell). Shared layouts per language, one `src/site.json` for contact details and the `showArabic`/`showLegal` switches.
- Plain CSS using the design tokens. Vanilla JS for the header, mobile menu, sticky contact bar and reveals. Every page works without JS.
- Contact through plain `wa.me` and `tel:` links. No third-party embeds, no backend.
- Local preview through `tools/serve.ps1`. Deploy `site/` to any static host.
- The structure maps one-to-one onto Astro if Node is installed later. See `README.md`.

## 7. Still open

1. **Contact values:** phone/WhatsApp number, email and hours (placeholders until supplied).
2. **Default language:** English at `/` with Arabic at `/ar/` (assumed), or the reverse.
3. **Brass accent:** keep the optional secondary accent or stay strictly plum and neutrals. The recommendation is to keep it, for small details only.
4. **Logo for print:** the traced SVGs suit the web. Large print or signage needs a professional redraw or the original file.
5. **Approve the draft English copy** (`copy-deck.md`), especially the six claims in §0. Arabic copy and legal details are scheduled for later.
6. **Arabic pages:** the Home scaffold exists. About, Services and Contact are still to be created when the Arabic copy arrives. The language switch stays hidden until `showArabic` is set to true.
7. **Hosting and domain:** where `site/` will be deployed.

## 8. Assumptions in force

- English is the default locale; Arabic mirrors it 1:1.
- B2B audience: companies and institutions in Bahrain and the wider GCC.
- The logo stays exactly as it is. It is not redesigned, and no Arabic version of it is invented.
- No testimonials, client logos, statistics or history will appear until the client supplies them.

## 9. Document index

| File | Purpose |
|---|---|
| `project-brief.md` | This summary |
| `reference-analysis.md` | Analysis of the three reference sites |
| `creative-direction.md` | Logo analysis, colour system, directions, approved direction and graphic language |
| `homepage-wireframe.md` | Sitemap and section-by-section homepage plan |
| `content-requirements.md` | Content checklist and remaining client questions |
| `design-system.md` | Tokens, bilingual type, grid, components, motion, accessibility |
| `copy-deck.md` | Draft English copy for every page, with a claims checklist |
