#### Comparison box plots of bestsellers and canonical novels across all three parameters ####
# Box plot with mean points
library(readr)
library(tidyverse)
library(ggpubr)

# The parts of this script that are commented out are leftovers from a previous draft of the code, where the resulting figure was supposed to go in Subchapter 4.2, instead of Subchapter 4.1. As some of this information is repeated in Tables 4.1 and 4.2, I decided to just keep the comparison boxplot of sentiment. After all, this information, related to the secondary hypothesis of Subchapter 4.1, was lacking in the original article.

# sentiment_flesch <- read_csv("Datasets and auxiliary files/sentiment_flesch.csv")
Sentiment_dataset1 <- read_csv("Datasets and auxiliary files/Sentiment_dataset1.csv")
# sentiment_MATTR_dataset <- read_csv("Datasets and auxiliary files/sentiment_MATTR.csv")

#### Comparison box plot of sentiment ####

# Dropping the "Neither" factor level (not necessary as I decided to include all facets )
# Sentiment_dataset1_new <- droplevels(Sentiment_dataset1[!Sentiment_dataset1$Status == 'Neither',])

# Calculating the means only, used in the text
means_sentiment <- aggregate(Sentiment ~  Status, Sentiment_dataset1, mean)
means_sentiment$Sentiment <- format(round(means_sentiment$Sentiment, 4), nsmall = 4)

ggplot(Sentiment_dataset1, aes(x=Sentiment, y=Status)) + 
  geom_boxplot(outlier.shape = NA, aes(color=Status))+ 
  geom_jitter(alpha=0.4, aes(color=Status)) + 
  stat_summary(fun=mean, geom="point", shape=15, size=4, aes(color=Status))+
  stat_summary(fun=mean, geom="text", size = 5, vjust=-1, aes(label=round(..x.., digits=4)))+
  labs(x="Sentiment", y = "Status") +
  theme_minimal() + 
  theme(legend.position="none") + 
  coord_flip()


#### Comparison box plot of MATTR ####

# Dropping the "Neither" factor level (not necessary as I decided to include all facets )
# sentiment_MATTR_dataset_new <- droplevels(sentiment_MATTR_dataset[!sentiment_MATTR_dataset$Status == 'Neither',])

# Calculating the means only, used in the text
#means_MATTR <- aggregate(MATTR ~  Status, sentiment_MATTR_dataset, mean)
#means_MATTR$MATTR <- format(round(means_MATTR$MATTR, 4), nsmall = 4)


#B <- ggplot(sentiment_MATTR_dataset, aes(x=MATTR, y=Status)) + 
#  geom_boxplot(outlier.shape = NA, aes(color=Status))+ 
#  geom_jitter(alpha=0.5, aes(color=Status)) + 
#  stat_summary(fun=mean, geom="point", shape=15, size=4, aes(color=Status))+
#  stat_summary(fun=mean, geom="text", size = 5, vjust=-1, aes(label=round(..x.., digits=4)))+
#  labs(title="Comparison of MATTR across facets",x="MATTR", y = "Status") +
#  theme_minimal() +
#  theme(legend.position="none") +
#  coord_flip()

#### Comparison box plot of Flesch scores ####

# Dropping the "Neither" factor level (not necessary as I decided to include all facets )
# sentiment_flesch_new <- droplevels(sentiment_flesch[!sentiment_flesch$Status == 'Neither',])

# Calculating the means only, used in the text
#means_Flesch <- aggregate(Flesch ~  Status, sentiment_flesch, mean)
#means_Flesch$Flesch <- format(round(means_Flesch$Flesch, 4), nsmall = 4)

#C <- ggplot(sentiment_flesch, aes(x=Flesch, y=Status)) + 
#  geom_boxplot(outlier.shape = NA, aes(color=Status))+ 
#  geom_jitter(alpha=0.5, aes(color=Status)) + 
#  stat_summary(fun=mean, geom="point", shape=15, size=4, aes(color=Status))+
#  stat_summary(fun=mean, geom="text", size = 5, vjust=-1, aes(label=round(..x.., digits=4)))+
#  labs(title="Comparison of Flesch scores across facets",x="Flesch", y = "Status") +
#  theme_minimal() + 
#  theme(legend.position="none") +
#  coord_flip()

#### Merging the three plots together ####
#ggarrange(A, B, C,
#          labels = c("1", "2", "3"),
#          ncol = 1, nrow = 3
#)

#### Exporting the plot ####

ggsave(file = "Raw plots/Figure 4.3 (raw).pdf", dpi = 300)
