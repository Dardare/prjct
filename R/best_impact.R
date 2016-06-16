importance1 <- result_minmax_all@model$variable_importances
importance1[,1] <- gsub("V", "", importance1[,1])
importance1[,1] <- strtoi(importance1[,1])
importance1 <- importance1[order(importance1[,1]), ]

importance2 <- result_mean_20@model$variable_importances
importance2[,1] <- gsub("V", "", importance2[,1])
importance2[,1] <- strtoi(importance2[,1])
importance2 <- importance2[order(importance2[,1]), ]


importance3 <- result_minmax_20@model$variable_importances
importance3[,1] <- gsub("V", "", importance3[,1])
importance3[,1] <- strtoi(importance3[,1])
importance3 <- importance3[order(importance3[,1]), ]

importance4 <- result@model$variable_importances
importance4[,1] <- gsub("V", "", importance4[,1])
importance4[,1] <- strtoi(importance4[,1])
importance4 <- importance4[order(importance4[,1]), ]


a <- which(importance1[,4] > 0.0018)

b <- which(importance2[,4] > 0.00092)

c <- which(importance3[,4] > 0.0045)

d <- which(importance4[,4] > 0.0005)

short <- simplify(target, nontarget, 2872)
frame4 <- cmb_frame(short[[1]], short[[2]], as.vector)

short <- simplify(target, nontarget, 300)
frame2 <- cmb_frame(short[[1]], short[[2]], Comb_mean(20))
frame3 <- cmb_frame(short[[1]], short[[2]], Comb_minmax(20))
frame1 <- cmb_frame(short[[1]], short[[2]], all_minmax)

frameimp1 <- frame1[,a]
frameimp2 <- frame2[,b]
frameimp3 <- frame3[,c]
frameimp4 <- frame4[,d]

very_imp <- cbind(as.matrix(frameimp1), as.matrix(frameimp2), as.matrix(frameimp3))
very_imp <- as.data.frame(very_imp)
very_imp$class <- F
very_imp$class[1:300] <- T
Random(very_imp)
