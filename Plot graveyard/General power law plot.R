####Power law plots for CHR2020 article####
library(readr)
Popularity_and_rank <- read_csv("Datasets and auxiliary files/Popularity and rank.csv")

library(ggpubr)

#overall non log
options(scipen=10000)
df <- Popularity_and_rank
A<- ggplot(df, aes(x=df$Rank, y=df$`Number of Ratings`)) +
  geom_point(alpha = 0.8, size = 3, color = 'dimgray') +
  labs(title = "Full dataset", 
       x = "Rank", 
       y ="Number of Ratings")

#overall
options(scipen=10000)
B <- ggplot(df, aes(x=df$Rank, y=df$`Number of Ratings`)) +
  geom_point(alpha = 0.8, size = 3, color = 'dimgray') +
  scale_x_log10()+
  labs(title = "Full dataset (log)", 
       x = "Rank", 
       y ="Number of Ratings")
#Merging all of them in a single graph
ggarrange(A, B,
          labels = c("1", "2"),
          ncol = 2, nrow = 1)