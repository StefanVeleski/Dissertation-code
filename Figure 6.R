#### Correlation plot of the full dataset####

# Loading in the data (for more information about the data collection process, see the CHR2020 repository)

library(readr)

Sentiment_dataset1 <- read_csv("Datasets and auxiliary files/Sentiment_dataset1.csv")

# Creating the plots

library(ggpubr)

options(scipen = 10000)

E <- ggscatter(Sentiment_dataset1,
  x = "Goodreads", y = "Sentiment",
  add = "reg.line", conf.int = TRUE,
  color = "dimgray",
  xscale = "log10",
  cor.coef = TRUE, cor.method = "pearson",
  title = "Correlation between present day popularity and mean sentiment (full dataset)",
  xlab = "Number of Goodreads ratings (log)", ylab = "Mean sentiment"
)

#### Facet wrapped plot####

options(scipen = 10000)
F <- ggscatter(Sentiment_dataset1,
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

ggarrange(E, F,
  labels = c("1", "2"),
  ncol = 1, nrow = 2
)

# Exporting the plot

ggsave(file = "Raw plots/Figure 6 (raw).pdf", dpi = 300, width = 2250, height = 3131, units = "px")