testFFT <- function(file, wndSize){
  buildFeature <- function(i) {
    wnds <- lapply(partition, function(s) {
      i[1:wndSize + s-1, ]
    })
    tmp <- matrix(ncol = 0, nrow = 0)
    tmp <- do.call(c, lapply(wnds, function(k){ as.numeric(abs(mvfft(k)))  }))
    as.vector(tmp)
  }
  data <- loadData(file) #load
  laplas <- Laplas(data$signal) #creating laplacian electrodes
  samples <- creating_samples(data$StimulusType, data$Flashing, laplas) #generate features
  frame <- Frame(samples, wndSize, buildFeature) #fft and combine
  test <- Random(frame) #RF
  print(test)
}
