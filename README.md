# Brothers Consulting — website

Static, bilingual-ready website for Brothers Consulting Company W.L.L (Bahrain).
No framework and no dependencies. A short PowerShell script assembles the pages.

## Quick start (Windows)

```powershell
# Build src/ into site/
powershell -ExecutionPolicy Bypass -File tools\build.ps1

# Preview at http://localhost:4321
powershell -ExecutionPolicy Bypass -File tools\serve.ps1
```

`site/` is the finished website. Upload its contents to any static host (Netlify, Cloudflare Pages, Vercel, or ordinary shared hosting).

## Where things live

| Path | What |
|---|---|
| `src/site.json` | **Settings:** office address (EN/AR), CR number, maps link, `showArabic`, `showLanguageMenu`, `showLegal`. Email/WhatsApp/phone were removed from the site at the client's request. |
| `src/pages/*.html` | English pages (content only, with a `<!--meta ... -->` block at the top) |
| `src/pages/ar/*.html` | Arabic pages (full translation of the English draft) |
| `src/layouts/en.html`, `ar.html` | Shared header (with globe language menu), mobile menu and footer |
| `src/icons/*.svg` | Icons, the "pair" graphic, the Why-us icons and `markline.svg` (the animated logo outline); use any of them as `{{icon:NAME}}` |
| `src/assets/css/tokens.css` | Design tokens (colours, type scale, spacing, motion) |
| `src/assets/css/styles.css` | All component styles |
| `src/assets/js/main.js` | Header state, mobile menu, language menu, scroll-driven services panel, reveals (optional; the site works without it) |
| `brand/logo/` | Traced SVG logo set (see its README for limits) |
| `docs/` | Brief, creative direction, design system, wireframes, copy deck |
| `tools/` | `build.ps1`, `serve.ps1`, `logo-trace/` |

## Filling in placeholders

Anything written `[[LIKE THIS]]` shows on the page with a dashed outline, so it can't go live unnoticed.

1. **Office details:** edit `src/site.json`: `address.en` / `address.ar`, `cr`, `mapsUrl`. (Email, WhatsApp and phone were removed from the site at the client's request; add a contact method to `src/pages/contact.html` and `ar/contact.html` once one is chosen.)
2. Run `tools\build.ps1`. Every page, button and link updates.
3. Search `site/` for `[[` to confirm nothing is left:
   `Select-String -Path site\*.html -Pattern '\[\['`

## Arabic

- Every page has an Arabic version in `src/pages/ar/`, translated from the English draft. Review by a native Arabic copywriter is recommended before launch.
- `"showArabic": true` makes the Arabic pages indexable and adds `hreflang` alternates. The globe menu (`showLanguageMenu`) switches to the same page in the other language.
- Brand and legal names stay in Latin script, and the logo outline is never mirrored in right-to-left layouts.

## Legal

`privacy.html` and `terms.html` exist with placeholders and `noindex`. Footer links appear once `"showLegal": true` is set.

## Adding or changing a service

Edit the list on `src/pages/index.html` (short version) and the matching `<article>` on `src/pages/services.html` (full version). The layout handles 3–9 items.

## Notes

- Fonts load from Google Fonts: Instrument Serif and Readex Pro (English), Noto Naskh Arabic and Readex Pro (Arabic). Self-hosting them is a later performance step.
- The build was written for Windows PowerShell 5.1. Keep `tools\build.ps1` saved as UTF-8 **with BOM**, or its Arabic strings break.
- If Node.js is installed later, the structure maps directly onto Astro: layouts become layouts, `src/pages` stay pages, and `site.json` becomes a data file.
