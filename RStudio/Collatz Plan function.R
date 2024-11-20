CollatzPlan <- function(n) {
  vector <- c()
  stopping_time <- 0
  while (n != 1) {
    vector <- c(vector, n)
    if (n %% 2 == 0) {
      n <- n/2
    } else {
      n <- 3 * n + 1
    }
    stopping_time <- stopping_time + 1
  }
  return(stopping_time)
}

vcollatz <- Vectorize(CollatzPlan)
num <- 1:100
stopping_time <- sapply(num, vcollatz)
hist(stopping_time, xlab = "Stopping Time", ylab = "Frequency")
