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

for (i in smallNiggas) {
  blink <- lapply(spellshield, function(s) {
    i[(s-5):(s+4), ]
  })
  for (k in blink) {
    epochB <- rbind(epochB, as.numeric(abs(mvfft(k))))
  }
}






for (i in bigNiggas) {
  epochA <- rbind(epochA, as.numeric(abs(mvfft(i))))
}


bigNiggas <- lapply(white, function(s){
  kek[(s-120):(s+119), ]
})
