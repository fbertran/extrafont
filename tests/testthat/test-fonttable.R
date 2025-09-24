test_that("fonttable returns a data.frame with at least FamilyName column", {
  skip_if_no_fonttable()
  ft <- extrafont::fonttable()
  expect_s3_class(ft, "data.frame")
  expect_true("FamilyName" %in% names(ft))
  fams <- unique(ft$FamilyName)
  expect_type(fams, "character")
})
test_that("fonts() reflects unique FamilyName from fonttable", {
  skip_if_no_fonttable()
  fams_fun <- extrafont::fonts()
  ft <- extrafont::fonttable()
  expect_setequal(fams_fun, unique(ft$FamilyName))
})
