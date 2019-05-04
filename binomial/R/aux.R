aux_mean <- function(trials, prob) {
  return(trials * prob)
}

aux_variance <- function(trials, prob) {
  return((trials * prob) * (1 - prob))
}

aux_mode <- function(trials, prob) {
  return(as.integer(trials * prob + prob))
}

aux_skewness <- function(trials, prob) {
  num <- 1 - 2 * prob
  denom <- sqrt((trials * prob) * (1 - prob))
  return(num / denom)
}

aux_kurtosis <- function(trials, prob) {
  num <- 1 - 6 * prob * (1 - prob)
  denom <- (trials * prob) * (1 - prob)
  return(num / denom)
}
