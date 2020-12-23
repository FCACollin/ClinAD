#' Expand Columns
#'
#' Row-binds to dataset while insuring column match.
#'
#' @param x,y (`data.frame`)
#'
#' @details The columns metadata must follow the column, even when transfered
#' from a dataset to another one. However, while the `data.frame` format with
#' row number equal to data column number, it is not garranty the two data
#' sets have the same metadata composition. This function, makes sure of the
#' column match between two datasets before row binding.
#'
#' @return A `data.frame` with the columns from the two datasets.
#' @export
#' @examples
#'
#' t1 <- data.frame(
#'   row.names = "STUDYID", label = "Study Identifier", names = "name"
#' )
#' # |        |label            |names |
#' # |:-------|:----------------|:-----|
#' # |STUDYID |Study Identifier |name  |
#' t2 <- data.frame(
#'   row.names = c("SUBJID", "AGE"),
#'   names = c("Subject Identifier", "Age")
#' )
#'
#' # |       |names              |
#' # |:------|:------------------|
#' # |SUBJID |Subject Identifier |
#' # |AGE    |Age                |
#'
#' expand_columns(t1, t2)
#' # |        |label            |names              |
#' # |:-------|:----------------|:------------------|
#' # |STUDYID |Study Identifier |name               |
#' # |SUBJID  |NA               |Subject Identifier |
#' # |AGE     |NA               |Age                |
#'
expand_columns <- function(x, y) {

  new_y <- setdiff(colnames(x), colnames(y))
  new_x <- setdiff(colnames(y), colnames(x))
  fill_na <- function(x, data) rep(NA, nrow(data))
  if (length(new_x) > 0) {
    new_x <- lapply(
      setNames(nm = new_x),
      fill_na,
      data = x
    )
    x <- cbind(x, new_x)
  }
  if (length(new_y) > 0) {
    new_y <- lapply(
      setNames(nm = new_y),
      fill_na,
      data = y
    )
    y <- cbind(new_y, y)
  }
  rbind(x, y)
}
