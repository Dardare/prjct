separate_files <- function(fname){
  eeg_data <- list.files(fname, pattern = "*_EEGData.csv",   recursive=T, full.names=T)
  event_data <- list.files(fname, pattern = "*_EventData.csv",   recursive=T, full.names=T)
  return(list(eeg_data, event_data))
}
