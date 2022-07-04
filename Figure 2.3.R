#### Boxplot of bestsellers and different canonical editions####

# Loading in the data (for more information about the data collection process, see the CHR2020 repository)

library(readr)
box_plot_data1 <- read_csv("Datasets and auxiliary files/box_plot_data1.csv")

# Taking care of incomplete factor labels

box_plot_data1$Type <- as.factor(box_plot_data1$Type)
levels(box_plot_data1$Type)[1] <- "Bestsellers"
levels(box_plot_data1$Type)[2] <- "Broadview editions"
levels(box_plot_data1$Type)[3] <- "Oxford editions"
levels(box_plot_data1$Type)[4] <- "Penguin editions"

# Creating the plot

library(tidyverse)
library(ggstatsplot)

set.seed(123)

options(scipen = 10000)

ggbetweenstats(
  data = box_plot_data1,
  x = Type,
  y = `Number of Ratings`,
  ylab = "Number of Goodreads ratings (log)",
  outlier.tagging = FALSE
) +
  scale_y_log10()

# Exporting the plot

ggsave(file = "Raw plots/Figure 2.3 (raw).pdf", dpi = 300)