
short <- simplify(target, nontarget, 300)

result_fft <- Random(cmb_frame(short[[1]], short[[2]], feat_FFTwnd1(80,60,500)))

result_mean_20 <- Random(cmb_frame(short[[1]], short[[2]], Comb_mean(20)))

result_minmax_20 <- Random(cmb_frame(short[[1]], short[[2]], Comb_minmax(20)))
result_minmax_all <- Random(cmb_frame(short[[1]], short[[2]], all_minmax))

save(result_fft, result_mean_20, result_minmax_20, result_minmax_all, file='result_2.Rd')
