Random <- function (frame) {
  localH2O = h2o.init()
  random.hex <- as.h2o(frame, destination_frame = "random")
  random.rf = h2o.randomForest(x = c(2:ncol(frame)-1), y = ncol(frame), training_frame = random.hex, ntrees = 500, max_depth = 200)
  return(random.rf)
}
