importance <- rf@model$variable_importances
heatmatrix <- matrix(nrow = 240, ncol = 6)
heatmatrix <- tapply(white, function(s){
  kek[(s-120):(s+119), ]
})
for(k in white) {
  for(i in seq(from = kek[k-120,] to kek[k+119,])) {

  }
  for (i in bigNiggas) {
    meld <- cbind(meld, as.numeric(i))
  }
  meld
  heatmatrix <- for(i in bigNiggas) {abind(i, heatmatrix, rev.along = 0)}
  i=1
  while(i) { heatmatrix <- abind(bigNiggas(i), bigNiggas(i+1), along = 2)
    i = i+2
  }
