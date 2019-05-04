context("Check checker functions")

test_that("check_prob", {

  expect_true(check_prob(0.5))
  expect_true(check_prob(1.0))
  expect_error(check_prob(1.5))
  expect_error(check_prob("asfwe"))
})

test_that("check_trials", {
  expect_true(check_trials(0))
  expect_true(check_trials(5))
  expect_error(check_trials(0.5))
})

