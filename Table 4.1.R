#### Calculating the MATTR values of the novels ####

# WARNING: Running this script takes at least 96 hours of computation. You are free to run this code, but to speed up this process, the data derived from this process is available upon request (> 5 GB of data).
# Loading necessary packages

library(koRpus)
library(koRpus.lang.en)
library(tidyverse)
library(gutenbergr)
library(tidytext)

# Loading the main dataset

library(readr)
Main_dataset <- read_csv("Datasets and auxiliary files/Main dataset.csv")

# Calculating the MATTR values of the text files

# Assigning the filenames to an object

filenames <- list.files(path="Text files", pattern="*.txt", full.names=T, recursive=FALSE)

# Tokenizing all of the novels (the MATTR function needs to be run on koRpus objects)

text.tagged <- lapply(filenames, function(x) koRpus::tokenize(x, lang="en"))

# Applying the MATTR function on every element of the list (the koRpus object of each book)

# The window size is set at 500, as per the recommendation by Covington & McFall (2010)

raw_MATTR_values <- lapply(text.tagged, MATTR, window = 500)

# Extracting only the MATTR values from the resulting data structure

final_MATTR_values <- sapply(lapply(raw_MATTR_values,slot,'MATTR'),'[',c('MATTR'))

# Sapply didn't convert the output to a vector so we have to do it with the unlist function

final_MATTR_values <- unlist(final_MATTR_values)

# Attaching final MATTR values to the existing sentiment dataset

Sentiment_dataset1 <- read_csv("Datasets and auxiliary files/Sentiment_dataset1.csv")
sentiment_MATTR <- cbind(Sentiment_dataset1, MATTR = final_MATTR_values) 

# Exporting sentiment_MATTR dataset for future reuse 

write_csv(sentiment_MATTR, path = "Datasets and auxiliary files/sentiment_MATTR.csv")

#### Calculating the Flesch scores of the novels ####

# Loading the main dataset

library(readr)
Main_dataset <- read_csv("Datasets and auxiliary files/Main dataset.csv")

# Applying the flesch function on every element of the list (the koRpus object of each book)

raw_flesch_values <- lapply(text.tagged, flesch)

raw_flesch_values <- flesch_values

# Extracting only the Flesch score resulting data structure

final_flesch_values <- sapply(lapply(raw_flesch_values,slot,'Flesch'),'[',c('RE'))

# Sapply didn't convert the output to a vector so we have to do it with the unlist function

final_flesch_values <- unlist(final_flesch_values)

# Attaching final Flesch values to the existing sentiment dataset

Sentiment_dataset1 <- read_csv("Datasets and auxiliary files/Sentiment_dataset1.csv")
sentiment_flesch_dataset <- cbind(Sentiment_dataset1, Flesch = final_flesch_values) 

# Exporting sentiment_flesch dataset for future reuse 

write_csv(sentiment_flesch, path = "Datasets and auxiliary files/sentiment_flesch.csv")

#### Creating correlation table between sentiment, Flesch and MATTR ####

library(correlation)

# Joining all values in a single dataset 
all_values <- right_join(sentiment_flesch, sentiment_MATTR)

all_values_new <- all_values%>%
  select(Sentiment, Flesch, MATTR)

correlation(all_values_new, method = "pearson")

# As there are no viable exporting method into LaTeX markup in this particular use case, I just manually filled out this information in the main Overleaf file of the dissertation.