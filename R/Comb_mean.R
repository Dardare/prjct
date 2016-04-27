
Comb_mean <- function(wndSize){

  partition <- seq(from = 1, to = 240-wndSize+1, by = wndSize)

  function(i){
    wnds <- lapply(partition, function(s) {
      i[1:wndSize + s-1, ]
    })
    wnds <- lapply(wnds, function(k) {colMeans(k)})
    wnds <- do.call(rbind, wnds)
    tmp <- apply(wnds, 2, function(e){combn(x = e, m = 2, FUN = function(x) x[1] - x[2])})
    as.vector(tmp)
  }
}

