heatmap_laplacian <- function(test) {
  importance <- test@model$variable_importances
  importance[,1] <- gsub("V", "", importance[,1])
  importance[,1] <- strtoi(importance[,1])
  importance <- importance[order(importance[,1]), ]
  heatmatrix <- matrix(importance$percentage, nrow=6, byrow = T)

  heatmap(heatmatrix, Rowv=NA, Colv=NA, col = heat.colors(256), scale="column")
}

heatmap_fft <- function(test, windowSize) {
  importance <- test@model$variable_importances
  importance[,1] <- gsub("V", "", importance[,1])
  importance[,1] <- strtoi(importance[,1])
  importance <- importance[order(importance[,1]), ]

  heatarray <- array(importance$percentage, dim=c(windowSize,6,nrow(importance)/6/windowSize))

  print(
    heatmap(apply(heatarray, c(2,1), mean), Rowv=NA, Colv=NA, col = heat.colors(256), scale="column", main = 'Hz x Ch')
  )
  print(
    heatmap(apply(heatarray, c(2,3), mean), Rowv=NA, Colv=NA, col = heat.colors(256), scale="column", main = 'T x Ch')
  )
  print(
    heatmap(apply(heatarray, c(1,3), mean), Rowv=NA, Colv=NA, col = heat.colors(256), scale="column", main = 'T x Hz')
  )
  #  plot(
  #    ggplot(melt(heatmatrix), aes(x=Var2, y=Var1, fill=value)) + scale_fill_continuous()
  #    )
}
