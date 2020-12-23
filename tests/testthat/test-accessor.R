
dta <- DM(
  dm[1:3, c("STUDYID", "SUBJID", "AGE", "ARMCD")],
  data.frame(
    row.names = c("STUDYID", "AGE"),
    label = c("Study Identifier", "Age")
  )
)

test_that("[`accessor`] select a row", {
  result <- dta[1, ]
  expected <- new(
    "DM",
    df = structure(
      list(
        STUDYID = "S-CDSK-01", SUBJID = 100008L, AGE = 72L, ARMCD = "WONDER10"
        ),
      row.names = 1L,
      class = "data.frame"
      ),
    columns = structure(
      list(label = c("Study Identifier", NA, "Age", NA)),
      class = "data.frame",
      row.names = c("STUDYID", "SUBJID", "AGE", "ARMCD")
    )
  )
  expect_identical(result, expected)
})

test_that("[`accessor`] select a col", {
  result <- dta[, 1]
  expected <- new(
    "DM",
    df = structure(
      list(STUDYID = c("S-CDSK-01", "S-CDSK-01", "S-CDSK-01")),
      class = "data.frame",
      row.names = c(NA, 3L)
      ),
    columns = structure(
      list(label = "Study Identifier"),
      row.names = "STUDYID",
      class = "data.frame"
    )
  )
  expect_identical(result, expected)
})
