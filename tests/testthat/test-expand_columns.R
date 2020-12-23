test_that("[`expand_columns`] works with no overlap", {
  a <- data.frame(
    Name = LETTERS[1:2],
    Comment = letters[1:2]
  )
  b <- data.frame(
    label = LETTERS[3:4]
  )

  result <- expand_columns(a, b)
  expected <- structure(
    list(
      Name = c("A", "B", NA, NA),
      Comment = c("a", "b", NA, NA),
      label = c(NA, NA, "C", "D")
      ),
    row.names = c(NA, -4L),
    class = "data.frame"
  )
  expect_identical(result, expected)
})

test_that("[`expand_columns`] works with partial overlap", {
  a <- data.frame(
    Name = LETTERS[1:2],
    Comment = letters[1:2]
  )
  b <- data.frame(
    label = LETTERS[3:4],
    Name = letters[3:4]
  )
  result <- expand_columns(a, b)
  expected <- structure(
    list(
      Name = c("A", "B", "c", "d"),
      Comment = c("a", "b", NA, NA),
      label = c(NA, NA, "C", "D")
      ),
    row.names = c(NA, -4L),
    class = "data.frame"
  )
  expect_identical(result, expected)
})

test_that("[`expand_columns`] works with total overlap", {
  a <- data.frame(
    Name = LETTERS[1:2],
    Comment = letters[1:2]
  )
  b <- data.frame(
    Comment = letters[3:4],
    Name = LETTERS[3:4]
  )
  result <- expand_columns(a, b)
  expected <- structure(
    list(
      Name = c("A", "B", "C", "D"),
      Comment = c("a", "b", "c", "d")
      ),
    row.names = c(NA, -4L),
    class = "data.frame"
  )

  expect_identical(result, expected)
})
