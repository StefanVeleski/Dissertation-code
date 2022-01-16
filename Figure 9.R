#### Scatterplot of sentiment/MATTR

# Loading in the data

library(readr)
box_plot_data1 <- read_csv("Datasets and auxiliary files/sentiment_MATTR_dataset.csv")

# Check distribution of variables

library(tidyverse)

ggplot(sentiment_MATTR_dataset, aes(sentiment_MATTR_dataset$MATTR)) + # check final_MATTR_values too
  geom_histogram()

ggplot(sentiment_MATTR_dataset, aes(sentiment_MATTR_dataset$Sentiment)) + # check final_MATTR_values too
  geom_histogram()

# Creating the plot

ggplot(sentiment_MATTR_dataset, aes(MATTR, Sentiment, shape = Status, color = Status, size = Goodreads)) +
  geom_point() +
  labs(y = "Mean sentiment", size = "Number of Goodreads ratings")

# Exporting the plot

ggsave(file = "Raw plots/Figure 9.jpg", dpi = 300)
