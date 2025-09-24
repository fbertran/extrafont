# Test suite for `extrafont`

The tests focus on:
- Basic API integrity (exports exist and are callable)
- Deterministic behavior of `choose_font()` fallback
- Coherence of `fonts()` with `fonttable()`
- A light check that `loadfonts()` returns structured output for the PDF device
- Device-specific checks for `loadfonts()` on Windows/macOS/Linux
- A Ghostscript-backed test that runs `embed_fonts()` when GS is available

Heavy, environment-dependent functionality remains guarded with skips to keep CI/CRAN stable.