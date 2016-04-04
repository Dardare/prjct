plotP300 <- function(file){
  data <- loadData(file)
  laplas <- Laplas(data$signal)
  sig <- data$signal
  samples <- creating_samples(data$StimulusType, data$Flashing, laplas)
  samples2 <- creating_samples(data$StimulusType, data$Flashing, sig)
  samples3 <- creating_samples(data$StimulusType, data$Flashing, as.matrix(sig[,11]))


  pl <- function(A, title){
    A1 <- abind(A, along=3)
    AM <- rowMeans(A1, dims=2)
    rownames(AM) <- -119:120/240

    print(
      ggplot(melt(AM), aes(x=Var1, y=value, colour=as.factor(Var2))) + geom_line() + labs(title=title)
    )
  }

  pk <- function(A, title){
    A1 <- abind(A, along=2)
    AM <- rowMeans(A1, dims=1)
    AM <- as.matrix(AM)
    rownames(AM) <- -119:120/240

    print(
      ggplot(melt(AM), aes(x=Var1, y=value, colour=as.factor(Var2))) + geom_line() + labs(title=title)
    )
  }

  pl(samples[[1]], 'P300')
  pl(samples[[2]], 'NON P300')
  pl(samples2[[1]], 'P300')
  pl(samples2[[2]], 'NON P300')
  pk(samples3[[1]], 'P300')
  pk(samples3[[2]], 'NON P300')
}
