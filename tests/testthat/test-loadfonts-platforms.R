test_that("loadfonts() also handles postscript device without error", {
  skip_if_no_fonttable()
  expect_silent({
    res <- extrafont::loadfonts(device = "postscript", quiet = TRUE)
    expect_true(is.list(res) || is.null(res))
  })
})

test_that("loadfonts() works for the platform-native device", {
  skip_if_no_fonttable()
  sys <- Sys.info()[["sysname"]]
  if (identical(sys, "Windows")){
    dev <- "win"
    expect_silent({
      res <- extrafont::loadfonts(device = dev, quiet = TRUE)
      # Accept list or NULL (some devices return invisibly with no structured output)
      expect_true(is.list(res) || is.null(res))
    })
  }
  if (!identical(sys, "Windows")) {
    dev <- "pdf"
    expect_silent({
      res <- extrafont::loadfonts(device = dev, quiet = TRUE)
      # Accept list or NULL (some devices return invisibly with no structured output)
      expect_true(is.list(res) || is.null(res))
    })
  }
  if (!identical(sys, "Windows")) {
    dev <- "postscript"
    expect_silent({
      res <- extrafont::loadfonts(device = dev, quiet = TRUE)
      # Accept list or NULL (some devices return invisibly with no structured output)
      expect_true(is.list(res) || is.null(res))
    })
  }
})
