testFFT <- function(file, buildFeature){
  data <- loadData(file) #load
  laplas <- Value(data$signal) #creating laplacian electrodes
  samples <- creating_samples(data$StimulusType, data$Flashing, laplas) #generate features
  frame <- Frame(samples, wndSize, buildFeature) #fft and combine
  test <- Random(frame) #RF
  print(test)
  test
}
