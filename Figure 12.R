library(koRpus)
library(koRpus.lang.en)
library(tidyverse)
library(gutenbergr)
library(tidytext)

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

# Attaching final MATTR values to the existing sentiment dataset

Sentiment_dataset1 <- read_csv("Datasets and auxiliary files/Sentiment_dataset1.csv")
sentiment_flesch_dataset <- cbind(Sentiment_dataset1, Flesch = final_flesch_values) 

# Exporting sentiment_flesch_dataset for future reuse 

# DO NOT RUN WITHOUT LOADING THE FLESCH DATA FIRST (BIG DATA FILE, AVAILABLE ON REQUEST)

write_csv(sentiment_flesch_dataset, path = "Datasets and auxiliary files/sentiment_flesch.csv")

# Flesch and present day popularity correlation plot (load sentiment_flesch.csv only and you can run the rest of the code)

sentiment_flesch <- read_csv("Datasets and auxiliary files/sentiment_flesch.csv")

library(ggpubr)
options(scipen=10000)
A <- ggscatter(sentiment_flesch, x = 'Goodreads', y = 'Flesch',
               add = "reg.line", conf.int = TRUE,
               color = 'dimgray',
               xscale = "log10",
               cor.coef = TRUE, cor.method = "pearson",
               title = "Correlation between present day popularity and Flesch reading ease score (full dataset)",
               xlab = "Number of Goodreads ratings (log)", ylab = "Flesch reading ease score")

B <- ggscatter(sentiment_flesch,
               x = "Goodreads", y = "Flesch",
               add = "reg.line", conf.int = TRUE,
               color = "Status",
               xscale = "log10",
               cor.coef = TRUE, cor.method = "pearson",
               title = "Correlation between present day popularity and Flesch reading ease score (faceted by status)",
               xlab = "Number of Goodreads ratings (log)", ylab = "Flesch reading ease score",
               facet.by = "Status"
)

ggarrange(A, B,
          labels = c("1", "2"),
          ncol = 1, nrow = 2
)

