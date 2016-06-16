
short <- simplify(target, nontarget, 2872)
result <- Random(cmb_frame(short[[1]], short[[2]], as.vector))
heatmap_laplacian(result, 7)

save(result_electrodes=result, file='result_1.Rd')
