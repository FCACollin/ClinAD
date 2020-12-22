#' S4 Class: domain
#'
#' @slot df (`data.frame`)\cr the data.
#' @slot columns (`data.frame`)\cr metadata, information about columns.
#'
#' @importFrom methods setClass
#' @name domain
#'
setClass(
  "Domain",
  slots = c(
    df = "data.frame",
    columns = "data.frame"
  )
)
