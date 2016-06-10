cmb_frame <- function(target, nontarget, buildFeature){
  features <- as.data.frame(as.data.frame(t(sapply(c(target, nontarget), buildFeature))))
  features$class <- F
  features$class[1:length(target)] <- T
  return(features)
}
