creating_samples <- function (StimulusType, Flashing, laplas) {
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

  list(p300list, otherstimlist)
}

