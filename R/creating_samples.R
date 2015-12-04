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
