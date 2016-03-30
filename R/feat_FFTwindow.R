feat_FFTwindow <- function(wndSize, wndStep){

  partition <- seq(from = 1, to = 240-wndSize+1, by = wndStep)

  function(i){
    wnds <- lapply(partition, function(s) {
      i[1:wndSize + s-1, ]
    })
    tmp <- do.call(c, lapply(wnds, function(k){ as.numeric(abs(mvfft(k)))  }))
    as.vector(tmp)
  }
}

feat_laplacian <- function(data){
  as.vector(data)
}
