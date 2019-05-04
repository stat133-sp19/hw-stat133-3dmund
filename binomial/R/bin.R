bin_choose <- function(n, k) {
  if (k > n) {
    stop('k cannot be greater than n')
  }

  num <- factorial(n)
  denom <- factorial(k) * factorial(n - k)
  return(num / denom)
}

bin_probability <- function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(trials, success)

  return(bin_choose(trials, success) * prob ^ success * (1 - prob) ^ (trials - success))

}
