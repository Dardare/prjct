Laplas <- function (signals) {
  x <- matrix(0, nrow=64, ncol=6)
  x[1,1]<-x[41,1]<-x[9,1]<-x[15,1]<- -1/4
  x[8,1]<- 1
  x[4,2]<-x[10,2]<-x[12,2]<-x[18,2]<- -1/4
  x[4,2]<- 1
  x[7,3]<-x[13,3]<-x[14,3]<-x[20,3]<- -1/4
  x[14,3]<- 1
  x[16,4]<-x[48,4]<-x[50,4]<-x[57,4]<- -1/4
  x[49,4]<- 1
  x[20,5]<-x[52,5]<-x[54,5]<-x[59,5]<- -1/4
  x[53,5]<- 1
  x[62,6]<-x[51,6]<- -1
  x[58,6]<- 1/2

  laplas <- signals%*%x
  return(laplas)
}

