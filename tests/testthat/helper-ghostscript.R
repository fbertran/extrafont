# Cross-platform Ghostscript detection
find_gs <- function() {
  cands <- if (.Platform$OS.type == "windows") c("gswin64c", "gswin32c", "gs") else c("gs")
  paths <- Sys.which(cands)
  hit <- paths[paths != "" & !is.na(paths)]
  if (length(hit)) unname(hit[[1]]) else ""
}
skip_if_no_gs_any <- function() {
  if (identical(find_gs(), "")) skip("Ghostscript not available on this system")
}
