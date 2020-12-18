#==============================================================================#
#
# title: "SDTM: Sample Study"
# encoding: "utf-8"
# author: "Francois C A COLLIN, Ph.D."
# date: 20201218 09:52
# Note: vim-user friendly script / UTF8
#
#==============================================================================#

# ---
# **NOTE**
# Must be run from package root.
# ---

ae <- read.table(
  file = file.path("inst", "extdata", "Emam2019", "ae.csv"),
  sep = ",",
  header = TRUE,
  stringsAsFactors = FALSE
)

dm <- read.table(
  file = file.path("inst", "extdata", "Emam2019", "dm.csv"),
  sep = ",",
  header = TRUE,
  stringsAsFactors = FALSE
)

eg <- read.table(
  file = file.path("inst", "extdata", "Emam2019", "eg.csv"),
  sep = ",",
  header = TRUE,
  stringsAsFactors = FALSE
)

lb <- read.table(
  file = file.path("inst", "extdata", "Emam2019", "lb.csv"),
  sep = ",",
  header = TRUE,
  stringsAsFactors = FALSE
)

mh <- read.table(
  file = file.path("inst", "extdata", "Emam2019", "mh.csv"),
  sep = ",",
  header = TRUE,
  stringsAsFactors = FALSE
)

pe <- read.table(
  file = file.path("inst", "extdata", "Emam2019", "pe.csv"),
  sep = ",",
  header = TRUE,
  stringsAsFactors = FALSE
)

vs <- read.table(
  file = file.path("inst", "extdata", "Emam2019", "vs.csv"),
  sep = ",",
  header = TRUE,
  stringsAsFactors = FALSE
)
