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

Main_dataset$`Bestseller?` <- as.factor(Main_dataset$`Bestseller?`)
corr_plot <- ggscatter(Main_dataset, x = "Ratings", y = "Syllabi",
                       add = "reg.line", conf.int = TRUE,
                       color ='dimgray',
                       xscale = "log10",
                       yscale = "log10",
                       cor.coef = TRUE, cor.method = "pearson",
                       title = "Correlation of Open Syllabus and Goodreads data",
                       xlab = "Number of Goodreads ratings (log)", 
                       ylab = "Open Syllabus")
corr_plot 

####Correlation of Goodreads and Open Syllabus data faceted by bestseller status####

options(scipen=10000)

Main_dataset$`Bestseller?` <- as.factor(Main_dataset$`Bestseller?`)
corr_plot2 <- ggscatter(Main_dataset, x = "Ratings", y = "Syllabi",
                       add = "reg.line", conf.int = TRUE,
                       color = "Bestseller?",
                       xscale = "log10",
                       yscale = "log10",
                       cor.coef = TRUE, cor.method = "pearson",
                       title = "Correlation of Open Syllabus and Goodreads data (faceted)",
                       xlab = "Number of Goodreads ratings (log)", 
                       ylab = "Open Syllabus") +
    facet_wrap(~ Main_dataset$`Bestseller?`, ncol=1, strip.position = "left")
corr_plot2

####Combining these last two plots together####
library(ggpubr)
ggarrange(corr_plot, corr_plot2, ncol = 2, labels = c("1", "2"))
      