#### Boxplot of Gutenberg IDs####

# Loading in the data (for more information about the data collection process, see the CHR2020 repository)

library(readr)
GutenbergIDboxplotdata <- read_csv("Datasets and auxiliary files/GutenbergIDboxplotdata.csv")

# Taking care of incomplete factor labels

GutenbergIDboxplotdata$Factor <- as.factor(GutenbergIDboxplotdata$Factor)
levels(GutenbergIDboxplotdata$Factor)[1] <- "No"
levels(GutenbergIDboxplotdata$Factor)[2] <- "Yes"

# Creating the plot

set.seed(123)

options(scipen = 10000)

library(tidyverse)
library(ggstatsplot)
ggbetweenstats(
  data = GutenbergIDboxplotdata,
  x = Factor,
  y = `Number of ratings`,
  xlab = "Gutenberg page?",
  ylab = "Number of Goodreads ratings (log)"
) +
  scale_y_log10()

# Exporting the plot

ggsave(file = "Raw plots/Figure 5.jpg", dpi = 300)
