# Logo files (traced)

These SVGs were **auto-traced** on 2026-10-19 from the only available source, a 287 × 71 px PNG (`docs/assets/logo-supplied.png`). The original vector master isn't available.

| File | Use |
|---|---|
| `brothers-consulting-logo.svg` | Full lockup, plum `#49354B`. Footer, documents, large placements |
| `brothers-consulting-logo-reversed.svg` | Full lockup, ivory `#F7F4EF`, for dark backgrounds |
| `brothers-consulting-logo-no-tagline.svg` | Symbol + wordmark. Website header and small sizes, where "COMPANY W.L.L" would be unreadable |
| `brothers-consulting-logo-no-tagline-reversed.svg` | As above, ivory |
| `brothers-consulting-symbol.svg` | Symbol only, square. Favicon, app icon, social avatar |
| `brothers-consulting-symbol-reversed.svg` | Symbol only, ivory |

## Quality limits
- **Symbol:** clean. Its large, simple shapes traced well.
- **Wordmark:** faithful in shape, but the letters were only ~17 px tall in the source, so the edges carry slight irregularities. These are invisible at website sizes (up to roughly 2–3× the original, about 200 px tall) but visible on large print or signage.
- **Tagline "COMPANY W.L.L":** only ~6 px tall in the source, so it's the roughest part. Use the no-tagline version below about 60 px logo height.
- Accuracy against the source: mean coverage difference 1.3% per pixel.

**For print, signage or anything large:** get the original vector from the logo's designer, or have the wordmark redrawn professionally. If the wordmark typeface is identified, it can be rebuilt exactly.

## Regenerate
`powershell -File tools\logo-trace\export.ps1` (Windows; uses only .NET, no installs).
