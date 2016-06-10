simplify <- function(p300, np300, num){
  tmp1 <- sample(1:length(p300), num , replace = F)
  tmp2 <- sample(1:length(np300), num , replace = F)
  a <- p300[tmp1]
  b <- np300[tmp2]
  return(list(a, b))
}
