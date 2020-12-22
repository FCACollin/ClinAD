#' @describeIn domain class DM
#' @importFrom methods setClass
#'
setClass(
  "DM",
  slots = c(
    df = "data.frame",
    columns = "data.frame"
  ),
  contains = "Domain"
)

#' @describeIn domain generic DM
#'
setGeneric(
  "DM",
  function(df, columns) standardGeneric("DM")
)

#' @describeIn domain create DM with missing column description.
#' @param df (`data.frame`).
#' @param columns (`data.frame`).
#' @importFrom methods setMethod new
#' @export
#' @examples
#' DM(df = dm)
#'
setMethod(
  "DM",
  signature(df = "data.frame", columns = "missing"),
  function(df, columns = NULL) {
    columns <- data.frame(
      row.names = colnames(df),
      names = colnames(df)
      )
    new(
      "DM",
      df = df,
      columns = columns
    )
  }
)

#' @describeIn domain create DM with column description.
#' @param df (`data.frame`).
#' @param columns (`data.frame`).
#' @importFrom methods setMethod new
#' @importFrom stats setNames
#' @export
#' @examples
#'
#' columns <- data.frame(
#'   row.names = c("STUDYID", "AGE"),
#'   label = c("Study Identifier", "Age")
#' )
#' DM(df = dm, columns = columns)
#'
setMethod(
  "DM",
  signature(df = "data.frame", columns = "data.frame"),
  function(df, columns) {

    miss_col_desc <- colnames(df)[!colnames(df) %in% rownames(columns)]
    miss_col_desc <- as.data.frame(
      lapply(
        X = setNames(nm = names(columns)),
        FUN = function(x) {
          setNames(
            object = rep(NA_character_, length(miss_col_desc)),
            nm = miss_col_desc
          )
        }
      )
    )
    columns <- rbind(columns, miss_col_desc)
    columns <- columns[
      match(colnames(df), rownames(columns)),
      seq_len(ncol(columns)),
      drop = FALSE
      ]

    new(
      "DM",
      df = df,
      columns = columns
    )
  }
)
