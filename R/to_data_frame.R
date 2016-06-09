cmb_frame <- function(target, nontarget){
  features <- as.data.frame(as.data.frame(t(sapply(c(target, nontarget), function(k){as.vector(k)}))))
  features$class <- F
  features$class[1:length(target)] <- T
  return(features)
}
