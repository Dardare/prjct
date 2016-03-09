testFFT <- function(file, wndSize=10){
  file <- "D:/darisiy/data/data/AAS011R01.mat"
  loadData(file) #load
  laplas <- Laplas(signals) #creating laplacian electrodes
  samples <- creating_samples(StimulusType, Flashing, laplas) #generate features
  frame <- Frame(samples) #fft and combine
  test <- Random(frame) #RF
  print(test)
}
