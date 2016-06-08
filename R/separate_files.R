separate_files <- function(fname){
  eeg_data <- list.files(fname, pattern = "*_EEGData.csv",   recursive=T, full.names=T)
  event_data <- list.files(fname, pattern = "*_EventData.csv",   recursive=T, full.names=T)
  eeg_data <- as.vector(matrix(c(eeg_data[1:36], eeg_data[43:48], eeg_data[55:72]), nrow=2, byrow=TRUE))
  event_data <- as.vector(matrix(c(event_data[1:36], event_data[43:48], event_data[55:72]), nrow=2, byrow=TRUE))
  return(list(eeg_data, event_data))
}
