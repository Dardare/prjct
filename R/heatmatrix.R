heatmap_laplacian <- function(test, channels=6) {
  importance <- test@model$variable_importances
  importance[,1] <- gsub("V", "", importance[,1])
  importance[,1] <- strtoi(importance[,1])
  importance <- importance[order(importance[,1]), ]
  heatmatrix <- matrix(importance$percentage, nrow=channels, byrow = T)
  D <- melt(heatmatrix)
  D$Var2 <- seq(-498, 500, by = 2)[D$Var2]

  ggplot(D, aes(Var2, Var1, fill=value))+ scale_fill_gradient(low = "white", high = "steelblue") + geom_tile()
}

heatmap_fft <- function(test, windowSize, channels=7) {
  importance <- test@model$variable_importances
  importance[,1] <- gsub("V", "", importance[,1])
  importance[,1] <- strtoi(importance[,1])
  importance <- importance[order(importance[,1]), ]

  heatarray <- array(importance$percentage, dim=c(windowSize,channels,nrow(importance)/channels/windowSize))

  print(
    ggplot(melt(apply(heatarray, c(2,1), sum)), aes(Var2, Var1, fill=value))+ scale_fill_gradient(low = "white", high = "steelblue") + geom_tile() + ggtitle('Hz x Ch')

  )
  print(
    ggplot(melt(apply(heatarray, c(2,3), sum)), aes(Var2, Var1, fill=value))+ scale_fill_gradient(low = "white", high = "steelblue") + geom_tile() + ggtitle('T x Ch')
  )
  print(
    ggplot(melt(apply(heatarray, c(1,3), sum)), aes(Var2, Var1, fill=value))+ scale_fill_gradient(low = "white", high = "steelblue") + geom_tile() + ggtitle('T x Hz')
  )
  #  plot(
  #    ggplot(melt(heatmatrix), aes(x=Var2, y=Var1, fill=value)) + scale_fill_continuous()
  #    )
}
