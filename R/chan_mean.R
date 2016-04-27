chan_mean <- function(wndSize){

  partition <- seq(from = 1, to = 240-wndSize+1, by = wndSize)

  function(i){
    wnds <- lapply(partition, function(s) {
      i[1:wndSize + s-1, ]
    })
    as.vector(wnds)

  }
}
