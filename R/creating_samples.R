white <-  which(diff(data$StimulusType)>0)+1
black <- which(diff(data$Flashing)>0)+1
black <- black[!(black %in% white)]

black <- black[seq(by=4, length.out=length(white))]

bigNiggas <- lapply(white, function(s){
  kek[(s-120):(s+119), ]
})
smallNiggas <- lapply(black, function(s){
  kek[(s-120):(s+119), ]
})



epochA <- matrix(ncol = 1440, nrow = 0)

for (i in bigNiggas) {
  epochA <- rbind(epochA, as.numeric(abs(mvfft(i))))
}


epochB <- matrix(ncol = 1440, nrow = 0)

for (i in smallNiggas) {
  epochB <- rbind(epochB, as.numeric(abs(mvfft(i))))
}

random <- rbind(epochB, epochA)

honesty <- vector(mode = "logical", length = 180)
honesty[1:90] <- TRUE

random <- data.frame(random, honesty)

