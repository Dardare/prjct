Comb_mean <- function(wndSize){

  partition <- seq(from = 1, to = 240-wndSize+1, by = wndSize)

  function(i){
    wnds <- lapply(partition, function(s) {
      i[1:wndSize + s-1, ]
    })
    tmp <- do.call(c, lapply(wnds, function(k){colMeans(k)}))
    tmp <- combn(x = tmp, m = 2, FUN = function(x) x[1] - x[2])
    as.vector(tmp)
  }
}

chan_mean <- function(wndSize){

  partition <- seq(from = 1, to = 240-wndSize+1, by = wndSize)

  function(i){
    wnds <- lapply(partition, function(s) {
      i[1:wndSize + s-1, ]
    })
    as.vector(wnds)
  }
}
