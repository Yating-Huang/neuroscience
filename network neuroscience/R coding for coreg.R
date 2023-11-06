#network neuroscience --- 

# Replace 'path_to_folder' with the actual path to your folder
folder_path_people <- "/home/yathua/Desktop/fmri_preprocessed/extraction/people"
# Use list.files to list the items in the folder
item_people <- list.files(path = folder_path_people)
folder_path_brain <- "/home/yathua/Desktop/fmri_preprocessed/extraction/brain"
item_brain <- list.files(path = folder_path_brain)
results <- list()# Initialize an empty list to store results
integer_people <- sub("\\..*", "", item_people)# Use sub() to extract the text before the decimal point
integer_brain <- sub("\\..*", "", item_brain)

# Double loop to combine elements from both vectors
for (i in 1:length(integer_brain)) {
  for (j in 1:length(integer_people)) {
    #fslmeants -i sub-001 -o sub-001_PCC.txt -m ../seed/PCC_bin
    #fslmeants -i SYNR41_1_rs_coreg.nii.gz -o output/synr41_1_rs_coreg_frontal_pole_bin.txt -m Frontal_Pole_bin.nii.gz
    combined <- paste("fslmeants -i people/",integer_people[j],".nii.gz -o output/",integer_people[j],"_",integer_brain[i],".txt -m brain/",integer_brain[i],".nii.gz",sep = "")
    results[[length(results) + 1]] <- combined
  }
}
file_conn <- file("/home/yathua/Desktop/fmri_preprocessed/extraction/my_script.txt", "w")
# Print the results
for (result in results) {
  print(result)
  writeLines(result, file_conn)
}
close(file_conn)

# Replace 'your_file.txt' with the path to your text file
file_path <- "/home/yathua/Desktop/fmri_preprocessed/extraction/output/syn111_1_rs_coreg_Angular_Gyrus_bin.txt"

# Read the file line by line
lines <- readLines(file_path)

# Now, 'lines' is a character vector where each element is a line from the file
# You can iterate through 'lines' to process each line individually
file_conn <- file("/home/yathua/Desktop/fmri_preprocessed/extraction/out_normalize/syn111_1_rs_coreg_Angular_Gyrus_bin.txt", "w")
for (line in lines) {
  # Perform operations on 'line'
  standardized_data <- scale(line)
  writeLines(standardized_data, file_conn)
  cat("Line:", line, "\n")
}