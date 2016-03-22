heatmatrix <- function(test, frame, wndSize, wndStep) {
  importance <- test@model$variable_importances
  tmp <- test[,1:2760]
  partition <- seq(from = 1, to = 240-wndSize+1, by = wndStep)
  for (i in tmp) {
    tapply(partition, function(s){
      i[(s-wndSize):(s+wndSize-1), ]
    })


    partition <- seq(from = 1, to = 240-20+1, by = 10)
    for (i in features) {
      blabla <- tapply(partition, function(s){
        i[(s-20):(s+20-1), ]
      })
    }

  heatmatrix <- array(nrow = 240, ncol = 6)
  heatmatrix <- tapply(white, function(s){
    laplas[(s-120):(s+119), ]
  })
    heatmatrix <- for(i in p300list) {abind(i, heatmatrix, rev.along = 0)}
    i=1
    while(i) { heatmatrix <- abind(p300list(i), p300list(i+1), along = 2)
      i = i+2
    }
}
