check_prob <- function(prob) {
  if (!is.numeric(prob) || prob < 0 || prob > 1) {
    stop('invalid prob value')
  }
  return(TRUE)
}

check_trials <- function(trials) {
  if (trials%%1 != 0 || trials < 0) {
    stop('invalid trials value')
  }
  return(TRUE)
}

###### Fix
check_success <- function(trials, success) {
  check_trials(trials)
  num_success <- 0
  for (x in success) {
    if (x) {
      num_success <- num_success + 1
    }
  }

  if (num_success > trials) {
    stop('invalid success value')
  }

  return(TRUE)

}



