test_that("choose_font falls back to empty string when none are installed", {
  res <- extrafont::choose_font(c("__NopeOne__", "__NopeTwo__"), quiet = TRUE)
  expect_identical(res, "")
})

test_that("choose_font warns when preferred missing and quiet=FALSE", {
  expect_warning(extrafont::choose_font(c("__NopeOne__", "serif"), quiet = FALSE))
})
