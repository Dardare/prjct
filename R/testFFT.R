testFFT <- function(n, buildFeature){
  samples <- c()
  for (i in n) {
    nam <- paste("test", i, sep = ".")
    data <- loadData(i) #load
    laplas <- Value(data$signal) #creating laplacian electrodes
    samples <- rbind(samples, creating_samples(data$StimulusType, data$Flashing, laplas)) #generate features
  }
  frame <- Frame(samples, wndSize, buildFeature) #fft and combine
  test <- Random(frame) #RF
}
