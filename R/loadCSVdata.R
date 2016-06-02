loadCSVdata <- addMemoization(function(fname, fname1){
  firstTS <- read.csv(fname, sep = ' ',nrow=1, header=F)[[1]]
  eeg <- read.csv(fname, sep = ' ', header=F, skip=1)
  events <- read.csv(fname1, sep = ' ', header=F)
  list(eeg=eeg, events=events, firstTS=firstTS)

})
