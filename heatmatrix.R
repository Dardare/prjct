importance <- rf@model$variable_importances
heatmatrix <- matrix(nrow = 240, ncol = 6)
heatmatrix <- tapply(white, function(s){
  laplas[(s-120):(s+119), ]
})
  heatmatrix <- for(i in p300list) {abind(i, heatmatrix, rev.along = 0)}
  i=1
  while(i) { heatmatrix <- abind(p300list(i), p300list(i+1), along = 2)
    i = i+2
  }
hm <- heatmap(heatmatrix, Rowv=NA, Colv=NA, col = heat.colors(256), scale="column", margins=c(5,10))
