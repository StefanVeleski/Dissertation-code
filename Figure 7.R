#### Calculating MATTR and sentiment####

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

raw_MATTR_values <- lapply(text.tagged, MATTR, window = 100)

# Extracting only the MATTR values from the resulting data structure

final_MATTR_values <- sapply(lapply(raw_MATTR_values,slot,'MATTR'),'[',c('MATTR'))

# Sapply didn't convert the output to a vector so we have to do it with the unlist function

final_MATTR_values <- unlist(final_MATTR_values)

# Attaching final MATTR values to the existing sentiment dataset

Sentiment_dataset1 <- read_csv("Datasets and auxiliary files/Sentiment_dataset1.csv")
sentiment_MATTR_dataset <- cbind(Sentiment_dataset1, MATTR = final_MATTR_values) 

# Exporting sentiment_MATTR_dataset for future reuse 

write_csv(sentiment_MATTR_dataset, path = "Datasets and auxiliary files/sentiment_MATTR.csv")

# MATTR and present day popularity correlation plot

library(ggpubr)
options(scipen=10000)
A <- ggscatter(sentiment_MATTR_dataset, x = 'Goodreads', y = 'MATTR',
              add = "reg.line", conf.int = TRUE,
              color = 'dimgray',
              xscale = "log10",
              cor.coef = TRUE, cor.method = "pearson",
              title = "Correlation between present day popularity and MATTR (full dataset)",
              xlab = "Number of Goodreads ratings (log)", ylab = "MATTR")

B <- ggscatter(sentiment_MATTR_dataset,
          x = "Goodreads", y = "MATTR",
          add = "reg.line", conf.int = TRUE,
          color = "Status",
          xscale = "log10",
          cor.coef = TRUE, cor.method = "pearson",
          title = "Correlation between present day popularity and MATTR (faceted by status)",
          xlab = "Number of Goodreads ratings (log)", ylab = "MATTR",
          facet.by = "Status"
)

ggarrange(A, B,
          labels = c("1", "2"),
          ncol = 1, nrow = 2
)

# Exporting the plot

ggsave(file = "Raw plots/Figure 7 (raw).pdf", dpi = 300, width = 2250, height = 3131, units = "px")