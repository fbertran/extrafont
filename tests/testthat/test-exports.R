test_that("exported objects exist and are functions", {
  exports <- c("choose_font", "embed_fonts", "font_addpackage", "font_import", "font_install", "fonts", "fonttable", "loadfonts", "ttf_import")
  for (nm in exports) {
    obj <- getExportedValue("extrafont", nm)
    expect_true(!is.null(obj), info = nm)
    expect_true(is.function(obj), info = paste(nm, "is not a function"))
  }
})
