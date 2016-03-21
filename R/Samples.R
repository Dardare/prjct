Frame <- function(samples, wndSize, buildFeature) {
#  p300list <- samples[[1]]
#  otherstimlist <- samples[[2]]

  partition <- seq(from = 1, to = 240-wndSize+1, by = wndSize)
  features <- as.data.frame(t(sapply(c(samples[[1]], samples[[2]]), buildFeature)))
  features$class <- F
  features$class[1:length(samples[[1]])] <- T
  return(features)
}
