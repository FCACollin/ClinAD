#' Accessor
#'
#' Extract data from a `Domain` object.
#'
#' @param x (`Domain`).
#' @param i,j (`numeric` or `character`)\cr indices of the columns/rows to
#'  select.
#'
#' @name accessor
#'
NULL

#' @describeIn accessor select with brackets and indices.
#' @include domain.R
#'
#' @examples
#' dta <- DM(
#'   dm[1:3, c("STUDYID", "SUBJID", "RACE")],
#'   data.frame(row.names = "STUDYID", label = "Study Identifier")
#' )
#' dta
#' dta[1, ]
#' dta[, 1]
#' dta[1, 1]
#' dta[1:2, ]
#' dta[, 1:2]
#' dta[1:2, 1:2]
#'
setMethod(
  "[",
  signature(x = "Domain", i = "ANY", j = "ANY"),
  function(x, i, j) {
    x@df <- x@df[i, j, drop = FALSE]
    columns <- x@columns
    x@columns <- columns[j, seq_len(ncol(columns)), drop = FALSE]
    x
  }
)

#' @describeIn accessor select a variable with the dollar symbol `$`.
#' @param name (`character`)\cr name of the object in `x` to access.
#' @include domain.R
#' @importFrom methods validObject
#'
#' @examples
#' dta <- DM(
#'   dm[1:2, c("STUDYID", "SUBJID", "RACE", "AGE")],
#'   data.frame(row.names = "STUDYID", label = "Study Identifier")
#' )
#' dta
#' dta$RACE
#' dta$STUDYID
#'
setMethod(
  "$",
  signature(x = "Domain"),
  function(x, name) {
    x@df <- x@df[, name, drop = FALSE]
    x@columns <- x@columns[
      name,
      seq_len(ncol(x@columns)),
      drop = FALSE
      ]
    validObject(x)
    x
  }
)

#' @describeIn accessor assign a variable with the dollar symbol `$`.
#' @param value (`atomic` or `domain`).
#' @include domain.R
#'
#' @importFrom methods is
#' @examples
#'
#' dta_1 <- DM(
#'   dm[1:3, c("STUDYID", "SUBJID", "ARMCD")],
#'   data.frame(
#'     row.names = "STUDYID",
#'     label = "Study Identifier",
#'     comment = "std"
#'   )
#' )
#'
#' dta_1$new_var <- 1:3
#' dta_1
#'
#' dta_2 <- DM(
#'   dm[1:3, c("STUDYID", "SUBJID", "AGE")],
#'   data.frame(
#'     row.names = c("STUDYID", "AGE"),
#'     names = c("Study Identifier", "Age"),
#'     label = c(NA, "Age")
#'   )
#' )
#' dta_2$AGE
#' dta_1$age <- dta_2$AGE
#' dta_1
#'
setMethod(
  "$<-",
  signature(x = "Domain"),
  function(x, name, value) {
    if (is(value, "Domain")) {
      x@df[, name] <- value@df
      x@columns <- expand_columns(x@columns, value@columns)
    } else {
      x@df[, name] <- value
      x@columns[name, ] <- NA
    }
    x
  }
)
