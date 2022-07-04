#### Correlation of Goodreads and Open Syllabus data####

# Loading in the data (for more information about the data collection process, see the CHR2020 repository)

library(readr)
Main_dataset <- read_csv("Datasets and auxiliary files/Main dataset.csv")

# Creating the plot

library(ggpubr)

options(scipen = 10000)

corr_plot <- ggscatter(Main_dataset,
  x = "Ratings", y = "Syllabi",
  add = "reg.line", conf.int = TRUE,
  color = "dimgray",
  xscale = "log10",
  yscale = "log10",
  cor.coef = TRUE, cor.method = "pearson",
  xlab = "Number of Goodreads ratings (log)",
  ylab = "Number of Open Syllabus entries"
)
corr_plot

# Exporting the plot

ggsave(file = "Raw plots/Figure 2.2.jpg", dpi = 300)
