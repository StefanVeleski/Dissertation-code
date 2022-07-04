#### Sentiment and Goodreads correlation plots ####

# Due to the nature of the results and the sheer amount of data, I have opted to put the results together in a table instead of showing them in separate plots. As ggpubr does not have any other ways of reporting correlation results in the LaTeX format, I will make the relevant plots, extract the correlation information, and manually insert it in a LaTeX table. 

# MATTR and present day popularity correlation plot
library(tidyverse)
library(ggpubr)

# Loading in the dataset

Sentiment_dataset1 <- read_csv("Datasets and auxiliary files/Sentiment_dataset1.csv")

options(scipen = 10000)

# Calculating the combined mean sentiment for the full dataset

mean(Sentiment_dataset1$Sentiment)

# Calculating the number of observations for each factor level (the same applies for the MATTR and Flesch datasets, so I will not repeat this calculation)

Sentiment_dataset1 %>% 
  group_by(Status) %>%
  summarise(no_rows = length(Status))


A <- ggscatter(Sentiment_dataset1,
               x = "Goodreads", y = "Sentiment",
               add = "reg.line", conf.int = TRUE,
               color = "dimgray",
               xscale = "log10",
               cor.coef = TRUE, cor.method = "pearson",
               title = "Correlation between present day popularity and mean sentiment (full dataset)",
               xlab = "Number of Goodreads ratings (log)", ylab = "Mean sentiment"
)

# Facet wrapped plot

options(scipen = 10000)
B <- ggscatter(Sentiment_dataset1,
               x = "Goodreads", y = "Sentiment",
               add = "reg.line", conf.int = TRUE,
               color = "Status",
               xscale = "log10",
               cor.coef = TRUE, cor.method = "pearson",
               title = "Correlation between present day popularity and mean sentiment (faceted by status)",
               xlab = "Number of Goodreads ratings (log)", ylab = "Mean sentiment",
               facet.by = "Status"
)

# Combining the two graphs

ggarrange(A, B,
          labels = c("1", "2"),
          ncol = 1, nrow = 2
)

#### MATTR and Goodreads correlation plots ####

sentiment_flesch <- read_csv("Datasets and auxiliary files/sentiment_MATTR.csv")
options(scipen=10000)

# Calculating the combined MATTR for the full dataset

mean(sentiment_MATTR$MATTR)

C <- ggscatter(sentiment_MATTR, x = 'Goodreads', y = 'MATTR',
               add = "reg.line", conf.int = TRUE,
               color = 'dimgray',
               xscale = "log10",
               cor.coef = TRUE, cor.method = "pearson",
               title = "Correlation between present day popularity and MATTR (full dataset)",
               xlab = "Number of Goodreads ratings (log)", ylab = "MATTR")

D <- ggscatter(sentiment_MATTR,
               x = "Goodreads", y = "MATTR",
               add = "reg.line", conf.int = TRUE,
               color = "Status",
               xscale = "log10",
               cor.coef = TRUE, cor.method = "pearson",
               title = "Correlation between present day popularity and MATTR (faceted by status)",
               xlab = "Number of Goodreads ratings (log)", ylab = "MATTR",
               facet.by = "Status"
)

ggarrange(C, D,
          labels = c("1", "2"),
          ncol = 1, nrow = 2
)

#### Flesch and Goodreads correlation plots ####


sentiment_flesch <- read_csv("Datasets and auxiliary files/sentiment_flesch.csv")

# Calculating the mean Flesch score for the full dataset

mean(sentiment_flesch$Flesch)

options(scipen=10000)
E <- ggscatter(sentiment_flesch, x = 'Goodreads', y = 'Flesch',
               add = "reg.line", conf.int = TRUE,
               color = 'dimgray',
               xscale = "log10",
               cor.coef = TRUE, cor.method = "pearson",
               title = "Correlation between present day popularity and Flesch reading ease score (full dataset)",
               xlab = "Number of Goodreads ratings (log)", ylab = "Flesch reading ease score")

F <- ggscatter(sentiment_flesch,
               x = "Goodreads", y = "Flesch",
               add = "reg.line", conf.int = TRUE,
               color = "Status",
               xscale = "log10",
               cor.coef = TRUE, cor.method = "pearson",
               title = "Correlation between present day popularity and Flesch reading ease score (faceted by status)",
               xlab = "Number of Goodreads ratings (log)", ylab = "Flesch reading ease score",
               facet.by = "Status"
)

ggarrange(E, F,
          labels = c("1", "2"),
          ncol = 1, nrow = 2
)