#==============================================================================#
#
# title:    "SDTM Sample Study"
# encoding: "utf-8"
# author:   "Francois C A COLLIN, Ph.D."
# date: 201218 09:41
# Note: vim-user friendly script / UTF8
#
#==============================================================================#

# ---
# **NOTE**
# Must be run from package root.
# ---

source("inst/r_script/sample_study.R")
usethis::use_data(ae, overwrite = TRUE)
usethis::use_data(dm, overwrite = TRUE)
usethis::use_data(eg, overwrite = TRUE)
usethis::use_data(lb, overwrite = TRUE)
usethis::use_data(mh, overwrite = TRUE)
usethis::use_data(pe, overwrite = TRUE)
usethis::use_data(vs, overwrite = TRUE)
