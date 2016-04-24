testFFT <- function(n, buildFeature){
  frame <- c()
  for (i in n) {
    #nam <- paste("test", i, sep = ".")
    data <- loadData(i) #load
    laplas <- Value(data$signal) #creating laplacian electrodes
    samples <- creating_samples(data$StimulusType, data$Flashing, laplas) #generate features
    frame <- rbind(frame, Frame(samples, wndSize, buildFeature)) #fft and combine
  }
  test <- Random(frame) #RF
}
