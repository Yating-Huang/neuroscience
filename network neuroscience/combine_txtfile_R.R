# List the .txt files in the directory
txt_files <- list.files(path = "/home/yathua/Desktop/fmri_preprocessed/extraction/output/SYNR236", pattern = ".txt", full.names = TRUE)

# Read the first text file to determine the number of lines
first_file <- readLines(txt_files[1])
num_lines <- length(first_file)
print(txt_files)

# Initialize a matrix to store the combined data
combined_data <- matrix(NA, nrow = num_lines, ncol = length(txt_files))

# Loop through the text files and populate the combined_data matrix
for (i in 1:length(txt_files)) {
  lines <- readLines(txt_files[i])
  combined_data[, i] <- lines
}

# Convert the matrix to a data frame
combined_data <- as.data.frame(combined_data)

# Write the combined data to an Excel file
library(writexl)
write_xlsx(combined_data, "/home/yathua/Desktop/fmri_preprocessed/extraction/output/SYNR236/SYNR236.xlsx")
