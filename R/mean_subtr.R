mean_subtr <- function(p300, np300){
 # p300 <- tmp[[1]]
 # np300 <- tmp[[2]]
 # bigP300 <-  abind(p300, along = 3)
 # meanEEG <- rowMeans(bigP300, dims=2)
 # bigNP300 <-  abind(np300, along = 3)
 # meanNoise <- rowMeans(bigNP300, dims=2)
 # for(l in seq(1:(length(p300)))){
 #   p300[[l]] <- p300[[l]] - meanEEG;
 # }
 # for(l in seq(1:(length(np300)))){
 #   np300[[l]] <- np300[[l]] - meanNoise;
 # }

  p300 <- lapply(p300, function(x) {
    for(i in 1:ncol(x)){
      x[,i] <- x[,i] - mean(x[,i])
    }
    x
  })

  np300 <- lapply(np300, function(x) {
    for(i in 1:ncol(x)){
      x[,i] <- x[,i] - mean(x[,i])
    }
    x
  })

  return(list(p300, np300))
}
