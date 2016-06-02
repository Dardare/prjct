mean_subtr <- function(tmp){
  p300 <- tmp[[1]]
  np300 <- tmp[[2]]
  meanEEG <- lapply(p300, function(i) {rowMeans(i)})
  meanNoise <- lapply(np300, function(i) {rowMeans(i)})
  meanEEG <- mapply('-', p300, meanEEG, SIMPLIFY=FALSE)
  meanNoise <- mapply('-', np300, meanNoise, SIMPLIFY=FALSE)
  return(list(meanEEG, meanNoise))
}
