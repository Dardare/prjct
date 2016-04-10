testFFT <- function(n, buildFeature){
  for (i in n) {
    nam <- paste("test", i, sep = ".")
    data <- loadData(i) #load
    laplas <- Value(data$signal) #creating laplacian electrodes
    samples <- creating_samples(data$StimulusType, data$Flashing, laplas) #generate features
    frame <- Frame(samples, wndSize, buildFeature) #fft and combine
    test <- Random(frame) #RF
    print(test)
    assign(nam, test, envir = .GlobalEnv)
  }
}
