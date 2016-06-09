p300plotChannels <- function(target, nontarget, minSamplesAtXAxis, maxSamplesAtXAxis){
  D <- melt(target[9])
  D$Var2 <- as.factor(D$Var2)
  levels(D$Var2) <- c('Cz','Pz','PO7','O1','Oz','O2','PO8')
  class(D$Var2) <- 'factor'

  D$Var1 <- (D$Var1-abs(minSamplesAtXAxis))*2

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
