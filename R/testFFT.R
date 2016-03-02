testFFT <- function(file, wndSize=10){
  loadData(file) #load
  laplas <- Laplas(signals) #creating laplacian electrodes
  samples <- creating_samples(StimulusType, Flashing, laplas) #generate features
  frame <- Frame(samples) #fft and combine
  Random(frame) #RF
}
