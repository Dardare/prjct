feat_FFTwnd1 <- function(wndSize, wndStep, defaultWND){

  partition <- seq(from = 1, to = defaultWND-wndSize+1, by = wndStep)

  function(i){
    wnds <- lapply(partition, function(s) {
      i[1:wndSize + s-1, ]
    })
    tmp <- do.call(c, lapply(wnds, function(k){ as.numeric(abs(mvfft(k)))  }))
    as.vector(tmp)
  }
}
