test_that("fontcm Computer Modern families are registered in fonttable()/fonts()", {
  skip_on_cran()
  skip_if_no_pkg("fontcm")
  # Register the packaged CM fonts in extrafont's DB (no prompts)
  expect_no_warning(extrafont::font_install("fontcm", prompt = FALSE))

  ft <- extrafont::fonttable()
  expect_s3_class(ft, "data.frame")
  # Expect at least one CM family from the fontcm README list
  expected_families <- c(
    "CM Roman","CM Roman Asian","CM Roman CE","CM Roman Cyrillic","CM Roman Greek",
    "CM Sans","CM Sans Asian","CM Sans CE","CM Sans Cyrillic","CM Sans Greek",
    "CM Symbol",
    "CM Typewriter","CM Typewriter Asian","CM Typewriter CE","CM Typewriter Cyrillic","CM Typewriter Greek"
  )
  # Some platforms may subset the list; require at least one present
  expect_true(any(ft$FamilyName %in% expected_families),
              info = "No Computer Modern (fontcm) families found in fonttable()")

  fams <- extrafont::fonts()
  expect_true(any(fams %in% expected_families),
              info = "No Computer Modern (fontcm) families reported by fonts()")
})
