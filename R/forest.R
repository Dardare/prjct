Random <- function (frame) {
  localH2O = h2o.init()
  random.hex <- as.h2o(frame, destination_frame = "random")
  random.rf = h2o.randomForest(x = c(1:1440), y = 1441, training_frame = random.hex, ntrees = 800, max_depth = 100)
  return(random.rf)
}
