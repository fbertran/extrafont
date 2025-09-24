test_that("loadfonts() returns a list for pdf device", {
  skip_if_no_fonttable()
  res <- extrafont::loadfonts(device = "pdf", quiet = TRUE)
  expect_type(res, "list")
  expect_true("pdf" %in% names(res))
})
