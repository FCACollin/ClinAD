#' SDTM - Sample Study Dataset
#'
#' A sample study dataset following SDTM guidelines.
#' This generally follows a controlled terminolgy \insertCite{NCI2020}{ClinAD}.
#'
#' @source \insertCite{Emam2019;textual}{ClinAD}.
#' @format SDTM
#' @references \insertAllCited{}
#' @name data-sdtm
#'
NULL

#' @describeIn data-sdtm Adverse Events data.
#' @format * `ae`: 18 Variables, 16 Observations.
#' @examples
#' head(ae)
#'
"ae"

#' @describeIn data-sdtm Subject demographics data.
#' @format * `dm`: 16 Variables, 5 Observations.
#' @examples
#' dm
#'
"dm"

#' @describeIn data-sdtm Electrogardiogram data.
#' @format * `eg`: 21 Variables, 56 Observations.
#' @examples
#' head(eg)
#'
"eg"

#' @describeIn data-sdtm Laboratory findings data.
#' @format * `lb`: 29 Variables, 83 Observations.
#' @examples
#' head(lb)
#'
"lb"

#' @describeIn data-sdtm Medical History data.
#' @format * `mh`: 12 Variables, 18 Observations.
#' @examples
#' head(mh)
#'
"mh"

#' @describeIn data-sdtm Physical examination data.
#' @format * `pe`: 13 Variables, 65 Observations.
#' @examples
#' head(pe)
#'
"pe"

#' @describeIn data-sdtm Vital Signs data..
#' @format * `vs`: 18 Variables, 72 Observations.
#' @examples
#' head(vs)
#'
"vs"
