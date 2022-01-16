#### Power law plots for Goodreads and Open Syllabus Data####

# Loading in the data (for more information about the data collection process, see the CHR2020 repository)

library(readr)
Main_dataset <- read_csv("Datasets and auxiliary files/Main dataset.csv")

# Creating the plotsw

library(ggpubr)
library(tidyverse)

# Goodreads non log

options(scipen = 10000)

A <- ggplot(Main_dataset, aes(x = Rank1, y = Ratings)) +
  geom_point(alpha = 0.8, size = 3, color = "#F8766D") +
  labs(
    title = "Distribution of present day popularity",
    x = "Rank",
    y = "Number of Goodreads ratings"
  )

# Goodreads log

options(scipen = 10000)

B <- ggplot(Main_dataset, aes(x = Rank1, y = Ratings)) +
  geom_point(alpha = 0.8, size = 3, color = "#F8766D") +
  scale_x_log10() +
  labs(
    title = "Distribution of present day popularity (log)",
    x = "Rank (log)",
    y = "Number of Goodreads ratings"
  )

# Open Syllabus non log

options(scipen = 10000)

C <- ggplot(Main_dataset, aes(x = Rank2, y = Syllabi)) +
  geom_point(alpha = 0.8, size = 3, color = "#00BFC4") +
  labs(
    title = "Distribution of academic prestige",
    x = "Rank",
    y = "Number of Open Syllabus entries"
  )

# Open Syllabus log

options(scipen = 10000)

D <- ggplot(Main_dataset, aes(x = Rank2, y = Syllabi)) +
  geom_point(alpha = 0.8, size = 3, color = "#00BFC4") +
  scale_x_log10() +
  labs(
    title = "Distribution of academic prestige (log)",
    x = "Rank (log)",
    y = "Number of Open Syllabus entries"
  )

# Combining all of these together

ggarrange(A, B, C, D,
  labels = c("1", "2", "3", "4"),
  ncol = 2, nrow = 2
)

# Saving the plot

ggsave(file = "Raw plots/Figure 1 (raw).pdf", dpi = 300)
