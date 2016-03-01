function (StimulusType, Flashing, laplas) {
  p300stim <- which(diff(StimulusType)>0)+1
  otherstim <- which(diff(Flashing)>0)+1
  otherstim <- otherstim[!(otherstim %in% p300stim)]
  
  otherstim <- otherstim[seq(by=4, length.out=length(p300stim))]
  
  p300list <- lapply(p300stim, function(s){
    laplas[(s-120):(s+119), ]
  })
  otherstimlist <- lapply(otherstim, function(s){
    laplas[(s-120):(s+119), ]
  })
  
  
  
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

