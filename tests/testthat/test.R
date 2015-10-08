context("Test logical conversion functionality")

test_that("Simple logicals (including NAs) can be handled", {
  expect_that(to_logical(c("true","t","y","none","flkargfs")), equals(c(TRUE, TRUE, TRUE, FALSE, NA)))
})

test_that("Custom logical can be handled", {
  expect_that(to_logical(c("true","t","y","none","flkargfs","blargh"),
                         "blargh"), equals(c(TRUE, TRUE, TRUE, FALSE, NA, TRUE)))
})

test_that("Custom logical can be handled", {
  expect_that(to_logical(c("true","t","y","none","flkargfs","blargh"),
                        custom_false = "blargh"), equals(c(TRUE, TRUE, TRUE, FALSE, NA, FALSE)))
})
