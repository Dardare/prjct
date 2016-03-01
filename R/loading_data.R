loadData <- function(file){
  data <- readMat(file, header=FALSE, comment.char="#") #D:/darisiy/data/data/AAS011R01.mat
  signals <- data$signal
  StimulusType <- data$StimulusType
  Flashing <- data$Flashing
}
