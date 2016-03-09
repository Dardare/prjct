testFFT <- function(file, wndSize){
  data <- loadData(file) #load
  laplas <- Laplas(data$signal) #creating laplacian electrodes
  samples <- creating_samples(data$StimulusType, data$Flashing, laplas) #generate features
  frame <- Frame(samples, wndSize) #fft and combine
  test <- Random(frame) #RF
  print(test)
}
