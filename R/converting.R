meld <- matrix(ncol = 1440, nrow = 0)

for (i in bigNiggas) {
  meld <- rbind(meld, as.numeric(i))
}

refraction <- matrix(ncol = 1440, nrow = 0)

for (i in smallNiggas) {
  refraction <- rbind(refraction, as.numeric(i))
}

random <- rbind(meld, refraction)

honesty <- vector(mode = "logical", length = 180)
honesty[1:90] <- TRUE

random <- data.frame(random, honesty)



  #lel <- rbind(kek[799:1039,])
  #meld <- (as.numeric(lel))