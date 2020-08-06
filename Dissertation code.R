####Gender and contemporary success####
library(tidyverse)
gender_df <- select(Main_dataset, Year, Name, Gender, Title, `Gutenberg ID`, `Number of Ratings`, `Bestseller?`)

set.seed(123)

options(scipen=10000)
library("ggstatsplot")
ggbetweenstats(data = gender_df, 
               x = Gender, 
               y = `Number of Ratings`,
               xlab = "Author's gender",
               ylab = "Number of Ratings (log)") +
    scale_y_log10()


####Correlation of Goodreads and Open Syllabus data####
library(ggpubr)
options(scipen=10000)
names(Main_dataset)
str(Main_dataset)

corr_plot <- ggscatter(Main_dataset, x = "Ratings", y = "Syllabi",
                       color = 'darkturquoise',
                       add = "reg.line", conf.int = TRUE,
                       xscale = "log10",
                       yscale = "log10",
                       cor.coef = TRUE, cor.method = "pearson",
                       title = "Correlation plot (full dataset)",
                       xlab = "Number of Goodreads ratings (log)", ylab = "Open Syllabus")
corr_plot
