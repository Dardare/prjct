 windows_gen <- function(wndSize, fname) {
  sep_files <- separate_files(fname)
  list_eeg <- sep_files[[1]]
  list_events <- sep_files[[2]]
  target <- list()
  nontarget <- list()
  for (i in seq(from = 1, to = 3, by = 1)) {
    #csv_data <- loadCSVdata(list_eeg[1], list_events[1])
    tmp <- wnd_create(list_eeg[i], list_events[i],  wndSize)
    target <- c(target, tmp[[1]])
    nontarget <- c(nontarget, tmp[[2]])
  }
  save(target, nontarget, file='all.dat')
 }
