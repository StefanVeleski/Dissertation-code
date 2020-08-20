####Gender and contemporary success####
library(tidyverse)
options(scipen=10000)
Main_dataset$Gender <- as.factor(Main_dataset$Gender)

set.seed(123)

library("ggstatsplot")
gender_plot <- ggbetweenstats(data = Main_dataset, 
               x = Gender,
               y = Ratings,
               xlab = "The Author's Gender",
               ylab = "Number of Ratings (log)") +
    scale_y_log10()
gender_plot

####Correlation of Goodreads and Open Syllabus data####
library(ggpubr)

options(scipen=10000)
names(Main_dataset)
str(Main_dataset)

corr_plot <- ggscatter(Main_dataset, x = "Ratings", y = "Syllabi",
                       color = "#00AFBB",
                       add = "reg.line", conf.int = TRUE,
                       xscale = "log10",
                       yscale = "log10",
                       cor.coef = TRUE, cor.method = "pearson",
                       title = "Correlation plot (full dataset)",
                       xlab = "Number of Goodreads ratings (log)", ylab = "Open Syllabus")
corr_plot 
