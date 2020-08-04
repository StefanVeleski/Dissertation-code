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


####Publishers code####


