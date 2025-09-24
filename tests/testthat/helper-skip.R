# Helper skips for robust tests across environments

skip_if_no_pkg <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    skip(sprintf("Package '%s' not installed", pkg))
  }
}

skip_if_no_fonttable <- function() {
  ftfile <- try(extrafont:::fonttable_file(), silent = TRUE)
  if (inherits(ftfile, "try-error") || isTRUE(is.na(ftfile)) || !file.exists(ftfile)) {
    skip("fonttable.csv not found")
  }
}

skip_if_no_fonts <- function() {
  ft <- try(extrafont::fonttable(), silent = TRUE)
  if (inherits(ft, "try-error") || is.null(ft) || NROW(ft) == 0) skip("No fonts registered in fonttable")
}
# Basic Ghostscript checker (POSIX-only) kept for backward compat with earlier tests

skip_if_no_gs <- function() {
  gs <- Sys.which("gs")
  if (identical(gs, "") || is.na(gs)) skip("Ghostscript not available")
}
