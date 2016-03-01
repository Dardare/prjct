require(R.matlab)
library(h2o)
data <- readMat("D:/darisiy/data/data/AAS011R01.mat", header=FALSE, comment.char="#") #D:/darisiy/data/data/AAS011R01.mat
signals <- data$signal
StimulusType <- data$StimulusType
Flashing <- data$Flashing
