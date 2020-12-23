# ClinAD 0.1.0-1

## Data

* New data: `ae`, `dm`, `eg`, `lb`, `mh`, `pe`, `vs`.

## Functions

* New class `Domain`.
* New class `DM`.
* New generic and method `DM`:
    + `DM,data.frame,missing-method`.
    + `DM,data.frame,data.frame-method`.
* New `expand_columns`.
* New `Domain` accessors:
    + `[(x, i, j)`
    + `$(x, name)`
    + `$(x, name) <- value`

## Tests

* New: `lintr` test for code quality.
* New: [`accessor`] select a row.
* New: [`accessor`] select a col.
* New: [`expand_columns`] works with no overlap.
* New: [`expand_columns`] works with partial overlap.
* NEW: [`expand_columns`] works with total overlap.

## Package

* New citation management.
* New pkgdown for automated webpage.
* New Vignette: `dm`.
