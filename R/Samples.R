Frame <- function(samples, wndSize, buildFeature) {
#  p300list <- samples[[1]]
#  otherstimlist <- samples[[2]]
  features <- as.data.frame(t(sapply(c(samples[[1]], samples[[2]]), buildFeature)))
  features$class <- F
  k <- 1
  for(i in seq(1:(length(samples)/2))){
    features$class[k:length(samples[[1]])] <- T
    k <- k + length(samples[[i+1]])
  }
  return(features)
}
