Frame <- function(samples) {
  p300list <- samples[[1]]
  otherstimlist <- samples[[2]]
  epochA <- matrix(ncol = 1440, nrow = 0)

  for (i in p300list) {
    epochA <- rbind(epochA, as.numeric(abs(mvfft(i))))
  }

  epochB <- matrix(ncol = 1440, nrow = 0)

  for (i in otherstimlist) {
    epochB <- rbind(epochB, as.numeric(abs(mvfft(i))))
  }

  randomf <- rbind(epochB, epochA)

  logicvector <- vector(mode = "logical", length = 180)
  logicvector[1:90] <- TRUE

  random <- data.frame(random, logicvector)
  return(random)
}
