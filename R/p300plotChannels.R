p300plotChannels <- function(data, minSamplesAtXAxis, maxSamplesAtXAxis){
  arr <- abind(data, along = 3)
  M <- rowMeans(arr, dims=2)

  D <- melt(M)

  D$Var2 <- as.factor(D$Var2)
  levels(D$Var2) <- c('Cz','Pz','PO7','O1','Oz','O2','PO8')
  class(D$Var2) <- 'factor'

  ggplot(data=D) + geom_line(aes(x=Var1, y=value, color=Var2)) + facet_wrap(~Var2, scales = "free_y")

  dirtyP300Plot <- ggplot(data = D) +
    theme(plot.background  = element_rect(fill = 'white'),
          panel.background = element_rect(fill = "white"),
          panel.grid.minor = element_line(colour = "darkgray"),
          panel.grid.major = element_line(colour = "gray")) +
    geom_line(aes(x=Var1, y=value)) + facet_wrap(~Var2, scales = "free_y")  + scale_x_continuous(minor_breaks=seq(minSamplesAtXAxis*2,maxSamplesAtXAxis*2,by=100)) +
    labs(title=sprintf("Channels (P300)\nBandpass: %.3f-%.3fHz",

                       0, 14,
                       0, 0),
         x = "Time [ms]", y="Voltage [uV]")
print(dirtyP300Plot)
}
