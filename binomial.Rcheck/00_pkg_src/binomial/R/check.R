check_prob <- function(prob) {
  if (prob < 0 || prob > 1) {
    stop('invalid prob value')
  }
  return(TRUE)
}