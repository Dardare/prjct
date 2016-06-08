plotP300evg <- function(tmp){
  target <- tmp[[1]]
  nontarget <- tmp[[2]]
  samples1 <- target[1:10]
  samples2 <- nontarget[1:10]


  pl <- function(A, title){
    A1 <- abind(A, along=3)
    AM <- rowMeans(A1, dims=2)
    rownames(AM) <- -249:250/500


    print(
      ggplot(melt(AM), aes(x=Var1, y=value, colour=as.factor(Var2))) + geom_line() + labs(title=title)
    )
  }

  pl(samples1[[1]], 'P300')
  pl(samples2[[2]], 'NON P300')
}
