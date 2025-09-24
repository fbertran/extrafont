test_that("embed_fonts() produces a valid PDF when Ghostscript is present", {
  skip_on_cran()
  skip_if_no_gs_any()
  tmp_in  <- tempfile(fileext = ".pdf")
  tmp_out <- tempfile(fileext = ".pdf")
  grDevices::pdf(tmp_in, width = 3, height = 3, useDingbats = FALSE)
  plot.new(); text(0.5, 0.5, "Hello from extrafont")
  grDevices::dev.off()
  expect_true(file.exists(tmp_in), info = "input pdf missing")
  expect_gt(file.info(tmp_in)$size, 0)
  # Run embedding
  res <- extrafont::embed_fonts(tmp_in, outfile = tmp_out)
  expect_true(file.exists(tmp_out), info = "embedded output missing")
  expect_gt(file.info(tmp_out)$size, 0)
  # Check PDF header
  con <- file(tmp_out, "rb"); on.exit(try(close(con), silent = TRUE), add = TRUE)
  hdr <- readBin(con, what = "raw", n = 5)
  expect_identical(rawToChar(hdr), "%PDF-")
})
