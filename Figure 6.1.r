#### Differences in popularity and prestige between Dracula and The Beetle ####

# Loading in the data (for more information about the data collection process, see the CHR2020 repository)

library(readr)
Main_dataset <- read_csv("Datasets and auxiliary files/Main dataset.csv")

# Creating a filtered dataset containing the Beetle and Dracula

highlight_df <- Main_dataset %>%
  filter(Rank1 == 30 | Rank1 == 2)

# Creating the plots

library(ggpubr)
library(ggrepel)
library(ggforce)

options(scipen = 10000)

E <- ggplot(Main_dataset, aes(x = Rank1, y = Ratings)) +
  geom_point(alpha = 0.8, size = 3, color = "#F8766D") +
  geom_point(
    data = highlight_df,
    aes(x = Rank1, y = Ratings),
    color = "firebrick4",
    size = 4
  ) +
  labs(
    title = "Distribution of present day popularity",
    x = "Rank",
    y = "Number of Goodreads ratings"
  ) +
  facet_zoom(xlim = c(1, 35))

E <- E + geom_label_repel(
  data = highlight_df, (aes(label = highlight_df$Title)),
  box.padding = 0.35,
  point.padding = 0.5,
  segment.color = "grey50"
)

E

F <- ggplot(Main_dataset, aes(x = Rank2, y = Syllabi)) +
  geom_point(alpha = 0.8, size = 3, color = "#00BFC4") +
  geom_point(
    data = highlight_df,
    aes(x = Rank2, y = Syllabi),
    color = "deepskyblue4",
    size = 4
  ) +
  labs(
    title = "Distribution of academic prestige",
    x = "Rank",
    y = "Number of Open Syllabus entries"
  ) +
  facet_zoom(xlim = c(1, 35))

F <- F + geom_label_repel(
  data = highlight_df, (aes(label = highlight_df$Title)),
  box.padding = 0.35,
  point.padding = 0.5,
  segment.color = "grey50"
)

F

composite_plot <- ggarrange(E, F, ncol = 2, nrow = 1)

composite_plot

# Exporting the plot

ggsave(file = "Raw plots/Figure 6.1 (raw).pdf", dpi = 300)
