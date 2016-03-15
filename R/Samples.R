Frame <- function(samples, wndSize) {
#  p300list <- samples[[1]]
#  otherstimlist <- samples[[2]]

  partition <- seq(from = 1, to = 240-wndSize+1, by = wndSize)

  buildFeature <- function(i) {
      wnds <- lapply(partition, function(s) {
        i[1:wndSize + s-1, ]
      })
      tmp <- matrix(ncol = 0, nrow = 0)
      tmp <- do.call(c, lapply(wnds, function(k){ as.numeric(abs(mvfft(k)))  }))
      as.vector(tmp)
  }


  features <- as.data.frame(t(sapply(c(samples[[1]], samples[[2]]), buildFeature)))
  features$class <- F
  features$class[1:length(samples[[1]])] <- T
  return(features)
}
