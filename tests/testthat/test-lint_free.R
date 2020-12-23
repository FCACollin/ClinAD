# Settings:
skip_lintr <- FALSE

if (requireNamespace("lintr", quietly = TRUE)) {
  test_that(
    desc = "[lintr] Package Style",
    code = {
      if (skip_lintr) {
        skip("[skip_lintr: TRUE] lintr deactivated in test-lint_free.R")
      } else {
        invisible()
      }
      lintr::expect_lint_free(relative_path = FALSE)
    }
  )
}
