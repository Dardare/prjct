isValid <- function(value, minValue, maxValue){(value >= minValue & value <= maxValue)}

wnd_create <- function(file1, file2, wndSize,
                                    vgaSensFrontExtract =  TRUE,
                                    skipFinishEvents    =  TRUE,
                                    lowFreq             =  FALSE,
                                    highFreq            =  14,
                                    validateEpochs      =  TRUE,
                                    processBaseline     =  FALSE,
                                    min_uV              = -70,
                                    max_uV              =  70,
                                    minSamplesAtXAxis   =  -(wndSize/2)+1,
                                    maxSamplesAtXAxis   =  wndSize/2)
{
  list2env(loadCSVdata(file1, file2), environment())

  trg <- which(diff(bitwShiftR(eeg[,ncol(eeg)], 8))<0)

  ###############################################################################################################################
  # raw <- read.csv("D:\\YandexDisk\\dynamite\\RealExperiment\\08.04.16\\08.04.2016-13.07.35_EEGData.csv")
  # trg <- which(diff(bitwShiftR(raw[1:nrow(eeg),ncol(raw)], 8))<0)
  ###############################################################################################################################

  flashs <- cumsum(diff(trg)) + trg[[1]]
  flashs <- ceiling(flashs[flashs<nrow(eeg)])

  go <- c()
  if(skipFinishEvents)
  {
    startEvents <- events[c(seq(from = 1, to = nrow(events), by = 2)), ]
    go <- ceiling((startEvents$V1-firstTS)/2)
  }
  else
  {
    go <- ceiling((events$V1-firstTS)/2)
  }

  # apply EEG resolution correction factor
  eeg <- cbind(eeg[,1:ncol(eeg)-1]*4.8828127319211489520967006683349609375e-08*1E6,
               eeg[,ncol(eeg)])

  ch.eeg   <- c(10,16,20,21,22,23,24)
  ch.ears  <- c(13,19)
  ch.eog.r <- 1
  ch.eog.l <- 2
  ch.eog.b <- 4
  ch.eog.t <- 3
  ch.eog   <- c(ch.eog.r, ch.eog.l, ch.eog.b, ch.eog.t)

  ###############################################################################################################################
  # Flashes in P300 detect
  ###############################################################################################################################
  P300 <- do.call(c, lapply(go, function(x){flashs[(flashs>x)][2:3]}))

  ###############################################################################################################################
  # Flashes outside P300 detect
  ###############################################################################################################################
  NP300 <- flashs[!(flashs %in% P300)]
  NP300 <- NP300[  NP300<tail(flashs,2)[[1]] ]

  EEG <- pipeline(source.channels(eeg, 500),
                  pipe.spatial(, diag(ncol(eeg))[ c(ch.ears, ch.eeg), ]),
                  pipe.references(, 1:2),
                  pipe.bandFilter(, lowFreq, highFreq, 50)
  )

  wndEEG <- abind(lapply(P300, function(x){ EEG[minSamplesAtXAxis:maxSamplesAtXAxis-1+x,] } ), along=3)

#  if(processBaseline)
#  {
#    for(epoch in 1:length(wndEEG[1,1,]))
#    {
#      for(channel in length(wndEEG[1,,epoch]))
#      {
#        wndEEG[,channel,epoch] - mean(wndEEG[,channel,epoch])
#      }
#    }
#  }

#  if(validateEpochs)
#  {
#    validEEGEpochs   <- wndEEG[,,  isValid(wndEEG[1,1,], min_uV, max_uV),  drop=FALSE]
#    invalidEEGEpochs <- wndEEG[,,(!isValid(wndEEG[1,1,], min_uV, max_uV)), drop=FALSE]
#
#    avgValidP300   <- rowMeans(validEEGEpochs,   dims = 2)
#    avgInvalidP300 <- rowMeans(invalidEEGEpochs, dims = 2)
#  }
#  else
#  {
#    avgP300 <- rowMeans(wndEEG, dims = 2)
#  }
  wndNP300 <- abind(lapply(NP300, function(x){ if(maxSamplesAtXAxis-1+x < nrow(EEG)) {EEG[minSamplesAtXAxis:maxSamplesAtXAxis-1+x,] }}), along=3)
  tmp <- sample(1:length(wndNP300[1,1,]), length(wndEEG[1,1,]) , replace = F)
  wndNP300 <- wndNP300[,,tmp]
  wndEEG <- alply(wndEEG, 3)
  wndNP300 <- alply(wndNP300, 3)
  return(list(wndEEG, wndNP300))
}
