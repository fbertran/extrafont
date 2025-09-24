test_that("ttf_import is available (skip heavy external tool requirement)", {
  # Only assert the symbol exists; full import requires external tools and system fonts.
  obj <- getExportedValue("extrafont", "ttf_import")
  expect_true(is.function(obj))
})
