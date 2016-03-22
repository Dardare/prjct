Frame <- function(samples, wndSize, buildFeature) {
#  p300list <- samples[[1]]
#  otherstimlist <- samples[[2]]
  features <- as.data.frame(t(sapply(c(samples[[1]], samples[[2]]), buildFeature)))
  features$class <- F
  features$class[1:length(samples[[1]])] <- T
  return(features)
}
