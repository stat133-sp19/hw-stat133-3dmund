context("Check bin functions")

test_that("bin_choose", {
  expect_equal(bin_choose(5, 2), 10)
  expect_equal(bin_choose(5, 0), 1)
  expect_equal(bin_choose(5, 1:3), c(5, 10, 10))
})

test_that("bin_probability", {
  expect_error(bin_probability(success = 2, trials = 5, prob = 1.5))
  expect_equal(
    round(bin_probability(success = 2, trials = 5, prob = 0.5), 5),
    round(0.3125, 5)
  )
  expect_equal(
    round(bin_probability(success = 0:2, trials = 5, prob = 0.5), 5),
    round(c(0.03125, 0.15625, 0.31250), 5)
  )
  expect_equal(
    round(bin_probability(success = 55, trials = 100, prob = 0.45), 5),
    round(0.01075277, 5)
  )
})
