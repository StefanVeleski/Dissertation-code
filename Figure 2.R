#### Gender and contemporary success####

# Loading in the data (for more information about the data collection process, see the CHR2020 repository)

library(readr)
Main_dataset <- read_csv("Datasets and auxiliary files/Main dataset.csv")

# Taking care of the incomplete factor labels

# Gender column

Main_dataset$Gender <- as.factor(Main_dataset$Gender)
levels(Main_dataset$Gender)[1] <- "Female"
levels(Main_dataset$Gender)[2] <- "Male"
levels(Main_dataset$Gender)[3] <- "Unknown"

# Bestseller? column

Main_dataset$`Bestseller?` <- as.factor(Main_dataset$`Bestseller?`)
levels(Main_dataset$`Bestseller?`)[1] <- "No"
levels(Main_dataset$`Bestseller?`)[2] <- "Yes"
Main_dataset$`Bestseller?`

# Creating the plot

set.seed(123)

library(tidyverse)
library(ggstatsplot)

options(scipen = 10000)

gender_plot <- ggbetweenstats(
  data = Main_dataset,
  x = Gender,
  y = Ratings,
  xlab = "The author's gender",
  ylab = "Number of Goodreads ratings (log)"
) +
  scale_y_log10()

gender_plot

# Exporting the plot

ggsave(file = "Raw plots/Figure 2.jpg", dpi = 300)
