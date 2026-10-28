# Creative Direction

## 1. Logo analysis

![Supplied logo](assets/logo-supplied.png)

| Attribute | Finding |
|---|---|
| **Colour** | One colour. Pixel sampling of the supplied PNG gives a dominant value of **`#49354B`** (deep plum / aubergine), with anti-aliasing variants `#48344A`–`#4F3951`. **Estimate** — confirm against the vector file or brand guidelines. |
| **Secondary colour** | None in the logo. |
| **Symbol** | Two soft, rounded, stacked forms that together read as a lowercase **"b"**. The forms are paired, leaning into each other — a natural metaphor for *partnership / two parts working as one*. Generous corner radii; no sharp angles. |
| **Wordmark** | Geometric sans-serif, medium–bold weight, sentence case ("Brothers Consulting"), compact spacing, round bowls. Similar in character to faces like Gilroy, Sofia Pro or Outfit — **actual typeface unknown; please ask the client or their designer.** |
| **Descriptor** | "COMPANY W.L.L" in light, widely tracked capitals — a quiet, formal counterpoint to the wordmark. |
| **Personality** | Grounded, trustworthy, approachable, mature. Plum signals discretion and seniority without the coldness of navy or black. |
| **File quality** | Only a 287 × 71 px raster exists. **Traced SVG set created 2026-10-19** in `brand/logo/` (full, no-tagline, symbol, plus reversed versions). Good for web use. For print or signage, a professional redraw is recommended (see `brand/logo/README.md`). |

The logo is fixed. The website should give it room, not compete with it.

## 2. Digital colour system (proposed)

Plum is used **with restraint**: primarily for text, the logo, primary buttons and a few deep "anchor" sections. Most of the canvas is warm neutral.

| Role | Token | HEX | Use |
|---|---|---|---|
| Primary brand | `plum-700` | `#49354B` | Logo, primary button, links, key headings |
| Deep brand | `plum-900` | `#2A1E2C` | Dark anchor sections, footer, heading text |
| Plum mid | `plum-500` | `#6E5670` | Hover on dark, secondary graphics |
| Plum soft | `plum-200` | `#D9CED8` | Tints, tags, selection |
| Plum mist | `plum-50` | `#F4EFF3` | Subtle highlight surfaces |
| Main background | `ivory` | `#F7F4EF` | Default page background |
| Alternate background | `stone` | `#ECE6DE` | Alternating sections, cards |
| Pure surface | `white` | `#FFFFFF` | Forms, cards on stone |
| Heading text | `ink` | `#231A24` | Headings on light |
| Body text | `ink-soft` | `#3E3540` | Paragraphs on light |
| Muted text | `ink-muted` | `#6B6070` | Captions, meta (≥ 4.5:1 on ivory) |
| Accent (secondary) | `brass` | `#B88A4E` | Small details only: rules, numerals, icons on dark. **Not** for text on light (fails contrast). |
| Accent on dark | `brass-light` | `#D6B07A` | Eyebrows/links on `plum-900` |
| Border | `line` | `#DDD4D2` | Dividers, input borders |
| Border strong | `line-strong` | `#B9AEB3` | Hover/active borders |
| Focus ring | `focus` | `#7C4D86` | 2px outline + 2px offset on light; `brass-light` on dark |
| Error / Success | `error` / `success` | `#A3363A` / `#3F6B4E` | Form states only |

**Accent rationale:** the brass is a warm, quiet secondary that pairs with plum without introducing a second "brand" colour. It is optional — Direction A works in plum + neutrals alone. Treat it as a proposal for approval.

**Distribution (target):** ~70% ivory/stone/white · ~20% ink text · ~8% plum (type, buttons, one or two dark sections) · ~2% brass.

**Key contrast checks (WCAG 2.2, calculated):** plum-700 on ivory 10.1:1 · ink on ivory 15.4:1 · ink-muted on ivory 5.4:1 (4.8:1 on stone) · ivory on plum-900 14.5:1 · brass-light on plum-900 7.8:1 · focus on ivory 5.9:1 · brass on ivory 2.8:1 (decorative only).

## 3. Three creative directions

### Direction A — "Considered Counsel" ✅ Approved

1. **Concept:** The calm of a well-run advisory room. Clarity, space and careful language; the two-part logo mark becomes a quiet motif of partnership.
2. **Emotional impression:** Trustworthy, senior, warm, unhurried. "These people will think before they speak."
3. **Typography:** Refined serif for headline statements (e.g. *Instrument Serif* or *Newsreader*, free; *Tobias*/*GT Sectra* as licensed upgrades) + geometric sans echoing the wordmark for UI and body (e.g. *Figtree* or *Outfit*). Sentence case. Large headings, generous line-height in body.
4. **Colour:** Ivory/stone canvas; plum for type and primary actions; one deep-plum anchor section (e.g. approach or final CTA); brass hairlines.
5. **Layout:** 12-column grid, asymmetric splits (5/7, 4/8), left-aligned headings with offset body text; content kept to a readable 1280px.
6. **Imagery:** _Confirmed: type- and graphics-led._ Graphic compositions derived from the logo's paired forms, plus hairlines and serif numerals (see §5). If photography is added later: natural light, documentary style, muted warm grade.
7. **Spacing & rhythm:** Large vertical section padding; alternating ivory/stone bands; thin rules separating items.
8. **Navigation & CTA:** Light sticky header, 4–5 links + one pill "Get in touch" button. Body CTAs as underlined text links with arrow.
9. **Motion:** Soft fade/rise reveals (≤ 600ms), image clip reveals, underline draws on hover. Respects reduced-motion.
10. **Avoid:** Stock handshake clichés, gradients, glassmorphism, all-caps shouting, decorative icons for every bullet, invented statistics.

### Direction B — "Deep Plum Gravitas"

1. **Concept:** An immersive, dark-led site — plum as an environment, not an accent (Creandum spirit).
2. **Impression:** Exclusive, bold, high-end, confident.
3. **Typography:** Heavy geometric/grotesk display (large, tight), serif for pull statements, sans body.
4. **Colour:** `plum-900` dominant, ivory text, brass accents; light sections are the exception.
5. **Layout:** Full-bleed sections, oversized headlines, horizontal carousels.
6. **Imagery:** Moody, high-contrast photography; plum-toned overlays.
7. **Rhythm:** Fewer, larger moments; dramatic scale shifts.
8. **Nav & CTA:** Transparent header over dark; outline buttons in ivory/brass.
9. **Motion:** More expressive — scroll-linked parallax, large text reveals.
10. **Avoid:** Low-contrast grey-on-plum text, overlong dark pages (fatiguing), effects that slow mobile.

_Risk:_ Requires excellent photography and confident copy to carry it; dark-heavy sites can feel less approachable for a services business.

### Direction C — "Structured Clarity"

1. **Concept:** A precise, modular, Swiss-influenced system (OCI spirit) — the firm as a methodical problem-solver.
2. **Impression:** Rigorous, modern, efficient.
3. **Typography:** Neo-grotesk sans for everything + a mono for labels, numbers and metadata.
4. **Colour:** White/ivory with plum as the single colour; **plum duotone** on all photography.
5. **Layout:** Visible grid, ruled tables, numbered lists, information in columns.
6. **Imagery:** Architectural/abstract photography with a consistent plum duotone — unifies any stock or client photos.
7. **Rhythm:** Tight, regular, modular spacing.
8. **Nav & CTA:** Compact nav with mono labels; square buttons.
9. **Motion:** Minimal; line draws and counters.
10. **Avoid:** Microscopic uppercase mono body text, coldness, over-engineering a small content set.

_Risk:_ Can feel technical or impersonal; best if the business is engineering-, data- or compliance-led.

## 4. Approved direction — A, "Considered Counsel" (approved 2026-10-19)

**Direction A, with two devices borrowed from B and C:**

- From **C**: the plum duotone treatment as a *fallback* for any photography that doesn't match, and numbered steps for the process section.
- From **B**: a single deep-plum anchor section and footer to give the page weight and a confident close.

Why: the confirmed brief is general consulting, bilingual and type- and graphics-led, and A fits all three. It doesn't commit to a single discipline. Its typography and graphics carry the page without photography. Its calm, asymmetric layouts mirror cleanly in Arabic (RTL).

**Adjustments for the confirmed brief:**
- **No photography:** the plum duotone device from C becomes a contingency only, used if photography is added later. The graphic language in §5 replaces imagery.
- **Bilingual:** each typographic role has a Latin/Arabic pair (see `design-system.md` §2). Headlines are written for each language, not forced to the same line breaks.
- **Pill buttons:** confirmed. The pill echoes the rounded logo mark. Cards, sections and graphics stay square-edged so the pill reads as "the action".

## 5. Graphic language (replaces photography)

Everything is built from the logo's DNA. The logo itself is not redesigned, altered or reused as decoration.

1. **The pair.** Two soft, rounded forms taken from the geometry of the mark (large radii, one form nested against the other). They are used large and cropped at section edges, as quiet backgrounds in `plum-50`/`stone`, or as ivory-on-plum in dark sections. One pair per section at most.
2. **Lines.** Hairline rules (1px `line` or `brass`) organise content: they divide services, connect process steps and frame statements. This is the "structural" counterpart to the soft forms.
3. **Numerals.** Large serif numerals (01, 02, 03…) for services and steps. In Arabic, the same layout uses Arabic-Indic numerals (٠١، ٠٢) or Western digits, to be decided with the Arabic copywriter.
4. **Typography as image.** The hero and CTA sections rely on one oversized serif statement. A single word may be set in italic or plum for emphasis, and never more than one per headline.
5. **Texture (optional).** A very subtle paper grain on ivory surfaces, ≤ 3% opacity. Remove it if it hurts performance.

**Hero composition:** the headline spans roughly 8 columns, and a large cropped "pair" form sits in the opposite corner, mirrored automatically in RTL. There is no image to source or crop.

**Rules:** no stock photography, no icon sets used as decoration, no 3D renders or AI imagery, no gradients. Graphics are inline SVG in the brand tokens, so colour and direction are controlled in CSS.

## 6. Revision v2: reference-led (2026-10-19)

The first build read as too gentle; the references were barely visible. The client chose to **blend all three references**, so Direction A was pushed as follows:

| From | What the site now uses |
|---|---|
| Creandum | Dark, full-bleed plum heroes on every page; oversized uppercase grotesk headlines with tight leading; a serif "second voice" for statements (*Good advice starts with listening.*); a dark full-screen mobile menu; a one-time line-by-line headline reveal |
| OCI | A mono-labelled info strip in the home hero (Based in · Focus · Languages · Talk to us); mono labels and links; service rows with circular arrow buttons that invert to plum on hover; a giant company name set across the footer |
| Motive | Ruled, orderly sections: 1px rules above columns, four-column "Why us", calm inner-page structure; the header CTA kept separate on the right |

Also changed:
- **Neutrals:** warm cream replaced with a cool, plum-tinted paper (`#F5F3F4` / `#E9E5E8`), which moves the site away from the generic cream-and-serif look.
- **Type:** Schibsted Grotesk (display, UI and body), Instrument Serif (statements only), DM Mono (labels). Arabic uses Readex Pro, with Noto Naskh Arabic for statements.
- **Header:** dark over the hero, switching to light once the hero scrolls past.
- **Unchanged:** pill buttons, plum `#49354B` as the brand colour, the brass accent (now the bold shape in the hero graphic), no photography.

## 7. Revision v3 (2026-10-19)

Client feedback on v2: keep the hero, drop the info strip, two fonts maximum, languages in the navigation with a globe icon, and no separator lines.

- **Hero:** v2 composition kept (dark plum, giant uppercase headline, brass pair graphic). Info strip removed.
- **Type:** two families only. **Schibsted Grotesk** for headlines, **Readex Pro** for paragraphs and UI (Readex also covers Arabic). Serif and mono removed. Labels are small uppercase Readex.
- **Navigation:** pill-shaped nav links; a globe language menu (EN / العربية) built on `<details>`, so it works without JavaScript; the same choice appears as pills in the mobile menu.
- **No lines:** all separators removed. Structure now comes from spacing, tonal surfaces (paper, stone, plum) and rounded cards (12/20/28px radius, echoing the logo's curves), with soft shadows only on white cards.
- **Home sections:** a two-tone statement intro; a 3×2 card grid of services plus a "Not sure?" WhatsApp card; a "Why us" panel with four cards using the pair mark; process steps as tonal cards on dark; a contact CTA as one large rounded plum panel.
- **Mobile:** the contact bar is now a floating dark pill dock.
- **21st-ui skill:** enabled on the account but not loadable in the session that built v3. A follow-up pass with it is pending.

## 8. Revision v4 (2026-10-19)

- **Accent:** gold replaced by **sage**, the complement of the brand plum on the colour wheel (plum ≈ 297°, sage ≈ 117°). `--sage #9DB89A` on dark (7.4:1 on plum-900), `--sage-deep #4E6B4B` for details on light (5.5:1), plus `--sage-light #B8CDB5` and `--sage-50 #EEF3ED`. Chosen by the client over split-complementary teal, analogous rose and analogous lavender.
- **Services (Home), after OCI:** a giant split title "Our | Services" across both halves, then a sticky dark panel (left) beside an interactive list (right). Hovering or focusing a service updates the panel's number, name and graphic composition. On phones the panel is hidden and the list items become cards.
- **Latest insights (Home), after OCI's "Most Recent Projects":** a centred giant title over three cards, each with an index and category row, title, 340:240 graphic tile and date row; the middle card is staggered lower. **All card content is placeholder**: no articles exist, and this section must be filled with real pieces or removed before launch.
- **Arabic scaffold:** still uses the v3 services grid; update it to the split layout when the Arabic copy is written.
- **21st-ui skill:** still not loadable in this session (enabled on the account after the session started).

## 9. Revision v6 (2026-10-19)

- **Hero graphic (after Creandum):** the brand pair shapes in all dark heroes are replaced by the **traced outline of the logo mark** (`src/icons/markline.svg`, from `brand/logo/`). A faint hairline draws the mark, and a short sage light with a soft glow travels along each of its two shapes, out of step with each other (pure CSS `stroke-dashoffset` animation; it stops for reduced-motion users). The mark is never mirrored in Arabic, only repositioned.
- **Contact methods removed site-wide** at the client's request: no email, WhatsApp, phone, hours or mobile contact bar. Every call to action is now **"Get in touch" → Contact page**. The Contact page shows the office address, CR number and "what to expect". **Open decision:** the site currently has no direct way to reach the company. Choose a method (e.g. a contact form, email or booking) before launch.
- **Arabic:** all pages translated from the English draft (Home, About, Services, Contact, plus legal stubs). Arabic is now indexable (`showArabic: true`). Brand and legal names stay in Latin script. Review by a native Arabic copywriter is still recommended before launch.

## 10. Revision v7 (2026-10-19)

- **Palette: purple only.** Sage removed. The **logo colour #49354B is now the main colour**: all dark surfaces (heroes, header over the hero, services panel, process, contact panel, dark cards) use it. Accents are tints of the same hue: `--lilac #CDB8D1` (6.0:1 on #49354B) for numbers, tags and the light trail; `--lilac-soft #E3D7E5` (8.0:1); `--accent-ink #6E5670` (6.0:1 on paper) for accent text on light. Deeper `--plum-800/900/950` are kept for the footer and hover states.
- **Shapes:** every decorative shape (process, contact panels, services panel, insight tiles) is now **the logo mark itself, in a single colour** (`src/icons/logomark.svg` / `pair.svg`). It moves and scales but never rotates or mirrors. The Why-us icons are unchanged.
- **Services panel:** the number is moved to the right and is 20% smaller.
- **Heroes (all pages, EN and AR):** header plus hero fill exactly one screen (`100vh`). The content is spread with space-between: title at the top; intro (and service links) bottom-left; the animated logo outline sits on the button pair bottom-right and is **exactly as wide as the buttons** (SVG frame cropped to the mark's bounds). On phones the outline is scaled down so the buttons stay on the first screen. Inner pages gained a relevant button pair.
- **Light trail:** the blur filter was removed (it caused dark box artefacts in some browsers). The glow is now a wider, translucent lilac stroke.

## 11. Revision v8 (2026-10-19)

- Logo shape removed from the contact panels (it stays in "How we work" only).
- Hero light trail: segments are about twice as long (170 of 1000 units). On desktop, hovering the outline moves the light on the nearest shape to the pointer; it resumes its loop when the pointer leaves. Touch devices and reduced-motion users keep the plain loop or a static light.
- **One heading size:** hero titles, "Our Services", "Why us", "How we work", "Latest insights" and the contact panels all use `--fs-display`.
- Header: equal spacing between About, Services, the language menu and the button.
- Arabic: hero headline lines no longer clip (overflow visible, no mask animation in Arabic). The services panel and news tiles no longer mirror the logo mark.
- Why-us icons animate gently in a loop (split, rise, fit together, lines drawing), faster on hover, and are off for reduced-motion users.

## 12. Revision v9 (2026-10-19)

- **Light trail:** each light is four stacked strokes centred on one point (long and faint to short and bright), so it fades out at both ends. On hover, the light on the nearest shape glides slowly (1.1s ease) to the pointer while the other light keeps running. On leave, it resumes its loop from where it stopped, with no jump.
- **Heroes fit one screen:** the outline is capped to the height left after the title, intro and buttons, so every hero item is visible on arrival at any window height.
- **Section separation without lines:** the Home intro sits on the stone tone and "Our Services" on paper, with normal section padding between them.
- **Footer:** the giant "Brothers Consulting" wordmark text is removed.
- **Why us:** fills exactly one screen (`.section--viewport`), with tighter cards and the intro text grouped under the heading.

## 13. Revision v10 (2026-10-19)

- **Smoother outline:** the hero outline is re-traced with heavy smoothing (`tools/logo-trace/markline.ps1`), with about 55 curve segments instead of about 96 and rounded corners kept. Used only for the decorative outline; the logo files are unchanged.
- **Hairline light (as on Creandum):** the outline and the light share one thin stroke. The light is six stacked layers of the same width fading by opacity, so it has no thickness change and soft ends. Hover-follow behaviour is unchanged.
- **Hero layout:** the buttons now sit under the intro text on the left. The outline is larger on the right, close to the full hero height (capped at 40% of the window width), and still fits on the first screen. On phones the outline sits between the title and the intro.

## 14. Revision v12: layout after quinngtl.com (2026-10-21)

Structure follows quinngtl.com; colours (purple palette), the two typefaces and the animated logo outline are unchanged. No new copy was written: every text block is reused from the existing pages.

- **Nav:** a floating, inset light bar with small chip links, the globe menu and the "Get in touch" button.
- **Hero (all pages, EN and AR):** a plum band carrying the animated outline, then a paper "folder" with a bevelled tab (dot label). The title sits on the left; the intro, buttons (and service links on Services) on the right.
- **Section break:** a staggered mosaic of purple blocks where the hero meets the dark section.
- **What we do:** a dark plum section with a large statement whose words light up as it scrolls through, then the five services as a numbered list with right-aligned titles and short descriptions, and an "All services" button.
- **Who we are:** a deep plum band with a large logo mark and a sticky paper card (label, heading, indented paragraph, button).
- **Advice you can act on:** heading left, paragraph right, then four staggered cards (descending heights, coloured left edge, animated icon). These replace the earlier "Why us" grid.
- **Contact:** a split panel, with text and a button on the left and a plum panel with the outline on the right.
- **Footer:** a large statement ("Consulting, based in Bahrain.") with a stacked link card, and office, CR and copyright below.
- Labels are now sentence-case dot tags (no all-caps eyebrows). "How we work" and "Latest insights" are kept as they were.

## 15. Revision v13 (2026-10-21)

- **Hero:** one primary button per hero ("Contact us" where it leads to Contact). The Home title is set on two lines and aligned with the intro (a stray top padding was removed). The purple band gained two faint echo outlines around the mark and a soft radial glow; the mark sits fully inside the band.
- **What we do:** the statement runs the full width in a lighter weight, with tighter spacing.
- **Spacing:** every section uses 80px top and bottom padding (56px on phones).
- **Latest insights** is removed from Home (EN and AR).
- **Headlines:** Schibsted Grotesk 500 instead of 700 across the hero, section headings, CTA and footer statement.
- Note: `tools/logo-trace/markline.ps1` regenerates the outline without the echo groups; re-add them if you re-run it.

## 16. Revision v14: skyline photo and a ruled grid

- **Hero photo:** the plum band in every hero now shows the Bahrain skyline photo supplied by the client (`src/assets/img/hero-skyline.webp`, decorative, no alt text). The animated outline now appears only in the home page's contact panel.
- **One grid, drawn with lines (after quinngtl.com):** columns touch and are separated by 1px hairlines (`--line` on light, `--line-dark` on dark). Cells share one inner padding (`--cell-pad`).
- **Side column:** the last third of the container. The hero intro, the service descriptions on Home, the mosaic blocks, the About card (framed by lines running the band's height) and the footer links all sit in it, so their edges line up down the page.
- **Quarters and halves:** the "Advice you can act on" cards and the "How we work" steps use quarters, with the intro over the last quarter. The contact panel, the About principles and the Contact page use halves.
- **Inner pages:** the Services rows are ruled, with questions in the side column. The About principles are a ruled 2×2 grid, and "Who we work with" uses a two-thirds / one-third split.

## 17. Revision v15

- **Hero:** the split is now 7/12 for the headline and 5/12 for the intro, so the intro has more room. The Home intro is shorter, and the space under the title is tighter. The photo is framed to show the whole of both towers and their reflection.
- **Side column:** now 5/12. The coloured blocks, footer links, Services questions and About split follow the same edge.
- **About band:** an open split on plum: the heading on the left, the text and button on the right. The floating card and its lines are gone.
- **What we do:** each description now sits directly under its title. There are no lines between the rows.
- **Thin white lines:** removed from the dark sections. The "How we work" steps are tonal cards again.
- **Outline:** the outline is a single line; the two echo outlines were removed.
- **Headlines:** the mega, display, h1 and hero title sizes are 5px smaller.

## 18. Revision v16

- **Who we are:** the sticky paper card is back, framed by lines and now in the 5/12 side column. The heading is smaller and set in sentence case with balanced wrapping. The paragraph has no indent.
- **What we do:** the services are now a bento grid, following the UI/UX Pro Max "Bento Box Grid" pattern.
  - Desktop: one large lilac lead tile (Strategy & Growth), one tall tile beside it, and three tiles below. One of the three is a lighter plum.
  - Each tile has a large number with an arrow at the top, and the title and description at the bottom. The whole tile is the link.
  - Tablet shows two columns; phone shows one.
