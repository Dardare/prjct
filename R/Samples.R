Frame <- function(samples, wndSize) {
  p300list <- samples[[1]]
  otherstimlist <- samples[[2]]
  partition <- seq(from = (wndSize/2)+1, to = 240, by = wndSize)

  epochA <- matrix(ncol = 1440*(length(partition)), nrow = 0)

  for (i in p300list) {
    wnds <- lapply(partition, function(s) {
      i[(s-wndSize/2):(s+(wndSize/2-1)), ]
    })
    tmp <- vector(mode = "integer")
    tmp <- do.call(c, lapply(wnds, function(k){ as.numeric(abs(mvfft(k)))  }))
    epochA <- rbind(epochA, tmp)
  }


  epochB <- matrix(ncol = 0, nrow = 0)

  for (i in otherstimlist) {
    wnds <- lapply(partition, function(s) {
      i[(s-wndSize/2):(s+(wndSize/2-1)), ]
    })
    tmp <- do.call(c, lapply(wnds, function(k){ as.numeric(abs(mvfft(k)))  }))
    epochB <- rbind(epochB, tmp)
  }

  randomf <- rbind(epochB, epochA)

  logicvector <- vector(mode = "logical", length = 180)
  logicvector[1:90] <- TRUE

  random <- data.frame(randomf, logicvector)
  return(random)
}
