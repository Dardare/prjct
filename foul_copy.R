#manabreak <- bigNiggas[[1]]
spellshield <- seq(from = 6, to = 240, by = 10)
#blink <- lapply(spellshield, function(s) {
#  manabreak[(s-5):(s+4), ]
#})

for (i in bigNiggas) {
  blink <- lapply(spellshield, function(s) {
    i[(s-5):(s+4), ]
  })

  res <- do.call(c, lapply(blink, function(k){ as.numeric(abs(mvfft(k)))  }))

  for (k in blink) {
    epochA <- rbind(epochA, as.numeric(abs(mvfft(k))))
  }
  rm(blink)
}

for (i in p300list) {
  wnds <- lapply(partition, function(s) {
    i[(s-wndSize/2):(s+(wndSize/2-1)), ]
  })
  tmp <- matrix(ncol = 0, nrow = 0)
  tmp <- do.call(c, lapply(wnds, function(k){ as.numeric(abs(mvfft(k)))  }))
  epochA <- rbind(epochA, tmp)
}



for (i in smallNiggas) {
  blink <- lapply(spellshield, function(s) {
    i[(s-5):(s+4), ]
  })
  for (k in blink) {
    epochB <- rbind(epochB, as.numeric(abs(mvfft(k))))
  }
}


partition <- seq(from = (wndSize/2)+1, to = 240, by = wndSize)

epochA <- matrix(nrow = 0, ncol = 1440)

for (i in p300list) {
  wnds <- lapply(partition, function(s) {
    i[(s-wndSize/2):(s+(wndSize/2-1)), ]
  })
  tmp <- matrix(ncol = 0, nrow = 0)
  tmp <- do.call(c, lapply(wnds, function(k){ as.numeric(abs(mvfft(k)))  }))
  epochA <- rbind(epochA, tmp)
}

partition <- seq(from = 1, to = 240-wndSize+1, by = wndSize/3)

for ( i in warpbreaks) {
  l <- i
  break
}

ggg <- olm[,11]


for(i in p300list) {
  wnds <- lapply(partition, function(s) {
    i[1:20 + s-1, ]
  })
  wnds <- lapply(wnds, function(k) {colMeans(k)})
  tmp <- do.call(c, lapply(wnds, function(k){combn(x = k, m = 2, FUN = function(x) x[1] - x[2])}))
  as.vector(tmp)
}

qqq <- do.call(rbind, wnds)

ppp <- apply(qqq, 2, function(k){combn(x = k, m = 2, FUN = function(x) x[1] - x[2])})

qqq <- do.call(c, lapply(qqq, function(k){combn(x = k, m = 2, FUN = function(x) x[1] - x[2])}))

qqq <- lapply(wnds, function(k){combn(x = k, m = 2, FUN = function(x) x[1] - x[2])})

do.call(c, lapply(wnds, function(k){colMeans(k)}))

pp <- 0

for(i in seq(1:4)) {pp <- pp + 1}
