p300plotChannels <- function(target, nontarget){
  arr <- abind(target, along = 3)
  M <- rowMeans(arr, dims=2)

  narr <- abind(nontarget, along = 3)
  NM <- rowMeans(narr, dims=2)

  D <- melt(M)
  ND <- melt(NM)

  D$color <- 'target'
  ND$color <- 'nontaget'

  data <- rbind(D,ND)

  data$Var2 <- as.factor(data$Var2)
  levels(data$Var2) <- c('Cz','Pz','PO7','O1','Oz','O2','PO8')
  class(data$Var2) <- 'factor'

  data$Var1 <- seq(-498, 500, by = 2) [data$Var1]


  ggplot(data=data, aes(x=Var1, y=value, colour=color)) + geom_line() + facet_wrap(~Var2, scales = "free_y") +
    labs(title=sprintf("Channels\nBandpass: %.1f-%.1f Hz",
                       0, 14),
         x = "Time [ms]", y="Voltage [uV]") +
    geom_vline(xintercept = 0)
}
