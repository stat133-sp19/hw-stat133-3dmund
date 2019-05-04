context("Check aux functions")

test_that("aux_mean", {
  expect_equal(aux_mean(10, 0.3), 3)
})

test_that("aux_variance", {
  expect_equal(aux_variance(10, 0.3), 2.1)
})

test_that("aux_mode", {
  expect_equal(aux_mode(10, 0.3), 3)
})

test_that("aux_skewness", {
  expect_equal(round(aux_skewness(10, 0.3), 5), round(0.2760262, 5))
})

test_that("aux_kurtosis", {
  expect_equal(round(aux_kurtosis(10, 0.3), 5), round(-0.1238095), 5)
})
