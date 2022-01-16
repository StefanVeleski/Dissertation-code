#### t-test using ggstatsplot package####

# Loading in the data (for more information about the data collection process, see the CHR2020 repository)

library(readr)
Sentiment_dataset1 <- read_csv("Datasets and auxiliary files/Sentiment_dataset1.csv")
sentiment_MATTR_dataset <- read_csv("Datasets and auxiliary files/sentiment_MATTR.csv")

# Creating the first plot

library(ggstatsplot)
library(tidyverse)

set.seed(123)

ddata <- filter(Sentiment_dataset1, Status %in% c("Bestsellers", "Canonical novels"))

A <- ggbetweenstats(
  data = ddata,
  k = 4L,
  x = Status,
  y = Sentiment,
  ylab = "Mean sentiment",
  title = "Comparison of the mean sentiment of bestsellers and canonical novels"
)

# Creating the second plot
set.seed(123)

ddata1 <- filter(sentiment_MATTR_dataset, Status %in% c("Bestsellers", "Canonical novels"))

B <- ggbetweenstats(
  data = ddata1,
  k = 4L,
  x = Status,
  y = MATTR,
  title = "Comparison of the MATTR of bestsellers and canonical novels"
)

# Merging the two plots together
ggarrange(A, B,
          labels = c("1", "2"),
          ncol = 1, nrow = 2
)

# Exporting the plot

ggsave(file = "Raw plots/Figure 8 (raw).pdf", dpi = 300, width = 2250, height = 3131, units = "px")
