
if (requireNamespace("lintr", quietly = TRUE)) {
  test_that(
    "Package Style",
    code = {
      lintr::expect_lint_free(
        relative_path = FALSE
      )
    }
  )
}
