# dplyr is a grammar of data manipulation, providing a consistent set of verbs that help you solve the most common data manipulation challenges:

  # mutate() adds new variables that are functions of existing variables
  # select() picks variables based on their names.
  # filter() picks cases based on their values.
  # summarise() reduces multiple values down to a single summary.
  # arrange() changes the ordering of the rows.

# Installation
# The easiest way to get dplyr is to install the whole tidyverse:
  # install.packages("tidyverse")

# Alternatively, install just dplyr:
  # install.packages("dplyr")

################################################################################

library(dplyr)  

################################################################################

################################################################################

# **Note:** Remember to create a "data/" and a "output/" folder in the current directory.

# Get the current working directory
wd <- getwd()

# Specify the path to the input and output directories
path_to_input <- file.path(wd, "data")
path_to_output <- file.path(wd, "output")

# Specify the pattern to search for (.txt files)
pattern <- ".txt"

################################################################################

# List files in the input directory that match the specified pattern
txt_files <- list.files(path = path_to_input, pattern = pattern, full.names = TRUE)

# Create an empty list to store data frames
data_frames <- list()

# Loop through the list of txt_files and read each file into a data frame
for (file in txt_files) {
  # Extract the filename without the extension
  filename <- tools::file_path_sans_ext(basename(file))
  
  # Read the txt file into a data frame
  data <- read.table(file, header = TRUE, sep = "\t")  # Adjust sep as needed
  
  # Store the data frame in the list with the filename as the name
  data_frames[[filename]] <- data
}
################################################################################

df = data
head(df)

################################################################################

# select your desired columns
df2<- df %>%
  select(chr, pos, ratio)

head(df2)

################################################################################

# add a new column to your new data frame

df3<-df2 %>%
  mutate(chromend = pos +1)
head(df3)

################################################################################

# arrange the order of your columns in your new data frame

df_final <- df3 %>%
  select(chr, pos, chromend, ratio)

head(df_final)

################################################################################

# change column names in your data frame

colnames(df_final) <- c("chrom", "start", "end", "value")

head(df_final)

################################################################################

# save your data frame in a .txt file

write.table(df_final, file = file.path(path_to_output, "sample_table.txt"), sep = "\t", quote = F, row.names = FALSE)

################################################################################










