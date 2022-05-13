#### Comparison box plots of bestsellers and canonical novels across all three parameters ####
# Box plot with mean points
library(readr)
library(tidyverse)
library(ggpubr)

sentiment_flesch <- read_csv("Datasets and auxiliary files/sentiment_flesch.csv")
Sentiment_dataset1 <- read_csv("Datasets and auxiliary files/Sentiment_dataset1.csv")
sentiment_MATTR_dataset <- read_csv("Datasets and auxiliary files/sentiment_MATTR.csv")



# Comparison box plot of sentiment
Sentiment_dataset1_new <- droplevels(Sentiment_dataset1[!Sentiment_dataset1$Status == 'Neither',])

A <- ggplot(Sentiment_dataset1_new, aes(x=Sentiment, y=Status, color=Status)) + 
  geom_boxplot()+ 
  geom_jitter(alpha=0.5, position = position_jitter(width = .2)) + 
  stat_summary(fun=mean, geom="point", shape=15, size=4)+
  scale_fill_manual(values=c("#F8766D", "#7CAE00", "#00BFC4", "#C77CFF")) + 
  labs(title="Comparison of sentiment across facets",x="Sentiment", y = "Status") +
  theme_minimal() + 
  theme(legend.position="none") + 
 
  coord_flip()
?stat_summary

# Comparison box plot of MATTR

sentiment_MATTR_dataset_new <- droplevels(sentiment_MATTR_dataset[!sentiment_MATTR_dataset$Status == 'Neither',])

B <- ggplot(sentiment_MATTR_dataset_new, aes(x=MATTR, y=Status, color=Status)) + 
  geom_boxplot()+
  geom_jitter(alpha=0.5, position = position_jitter(width = .2)) + 
  stat_summary(fun=mean, geom="point", shape=15, size=4)+
  scale_fill_manual(values=c("#F8766D", "#7CAE00", "#00BFC4", "#C77CFF")) + 
  labs(title="Comparison of MATTR across facets",x="MATTR", y = "Status") +
  theme_minimal() +
  theme(legend.position="none") +
  coord_flip()

# Comparison box plot of Flesch scores
sentiment_flesch_new <- droplevels(sentiment_flesch[!sentiment_flesch$Status == 'Neither',])

C <- ggplot(sentiment_flesch_new, aes(x=Flesch, y=Status, color=Status)) + 
  geom_boxplot()+ 
  geom_jitter(alpha=0.5, position = position_jitter(width = .1)) + 
  stat_summary(fun=mean, geom="point", shape=15, size=4)+
  scale_fill_manual(values=c("#F8766D", "#7CAE00", "#00BFC4", "#C77CFF")) + 
  labs(title="Comparison of Flesch scores across facets",x="Flesch", y = "Status") +
  theme_minimal() + 
  theme(legend.position="none") + 
  coord_flip()

# Merging the three plots together
ggarrange(A, B, C,
          labels = c("1", "2", "3"),
          ncol = 1, nrow = 3
)

# Exporting the plot

ggsave(file = "Raw plots/Figure 13 (raw).pdf", dpi = 300, width = 2250, height = 3131, units = "px")
