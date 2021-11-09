#### Gender and contemporary success####
library(tidyverse)
Main_dataset <- read_csv("Datasets/Main dataset.csv")
Sentiment_dataset1 <- read_csv("Datasets/Sentiment_dataset1.csv")

options(scipen = 10000)
# Taking care of the incomplete factor labels
# Gender column
Main_dataset$Gender <- as.factor(Main_dataset$Gender)
levels(Main_dataset$Gender)[1] <- "Female"
levels(Main_dataset$Gender)[2] <- "Male"
levels(Main_dataset$Gender)[3] <- "Unknown"

# Bestseller? column
Main_dataset$`Bestseller?` <- as.factor(Main_dataset$`Bestseller?`)
levels(Main_dataset$`Bestseller?`)[1] <- "No"
levels(Main_dataset$`Bestseller?`)[2] <- "Yes"
Main_dataset$`Bestseller?`

set.seed(123)

library(ggstatsplot)                 
gender_plot <- ggbetweenstats(
  data = Main_dataset,
  x = Gender,
  y = Ratings,
  xlab = "The Author's Gender",
  ylab = "Number of Ratings (log)"
) +
  scale_y_log10()
gender_plot

# Export in 6x9 res

#### Correlation of Goodreads and Open Syllabus data####
library(ggpubr)

options(scipen = 10000)

corr_plot <- ggscatter(Main_dataset,
  x = "Ratings", y = "Syllabi",
  add = "reg.line", conf.int = TRUE,
  color = "dimgray",
  xscale = "log10",
  yscale = "log10",
  cor.coef = TRUE, cor.method = "pearson",
  title = "Correlation of Open Syllabus and Goodreads data",
  xlab = "Number of Goodreads ratings (log)",
  ylab = "Open Syllabus"
)
corr_plot

# Export in 6x9 res

#### Correlation of Goodreads and Open Syllabus data faceted by bestseller status####

options(scipen = 10000)

Main_dataset$Syllabi <- as.integer(Main_dataset$Syllabi)
corr_plot2 <- ggscatter(Main_dataset,
  x = "Ratings", y = "Syllabi",
  add = "reg.line", conf.int = TRUE,
  color = "Bestseller?",
  xscale = "log10",
  yscale = "log10",
  cor.coef = TRUE, cor.method = "pearson",
  title = "Correlation of Open Syllabus and Goodreads data (faceted)",
  xlab = "Number of Goodreads ratings (log)",
  ylab = "Open Syllabus"
) +
  facet_wrap(~ Main_dataset$`Bestseller?`, ncol = 1, strip.position = "left")

corr_plot2

# Export in 8x9 res

#### Combining these last two plots together####
library(ggpubr)
ggarrange(corr_plot, corr_plot2, ncol = 2, labels = c("1", "2"))

####Creating the Sentiment_dataset1.csv file (CHR2020 conference)####
library(syuzhet)
library(stringr)

filenames <- list.files("C:/Users/Stefan/OneDrive - MUNI/Github/Dissertation/Text files", pattern="*.txt", full.names=TRUE)
ldf <- lapply(filenames, get_text_as_string)

#This line of code uses the syuzhet package to divide the novels into sentences
sentences <- lapply(ldf, get_sentences)

#This line extracts the sentiment of each sentence of the novels
sentiment <- lapply(sentences, get_sentiment)

#These lines calculate the mean sentiment of each novel and creates a dataframe
mean_sentiment <- lapply(sentiment, mean)
mean_sentiment_df1 <- as.data.frame(mean_sentiment)
mean_sentiment_df2 <- as.data.frame(t(mean_sentiment_df1))

#Exporting the .csv file
write.csv(mean_sentiment_df2,"/Sentiment_dataset1.csv", row.names = TRUE)

#Extracting the names of the observations
names_of_observations <- sapply(sentences, "[[", 1)
names_of_observations <- as.data.frame(names_of_observations)
write.csv(names_of_observations, file="/Names_of_observations.csv", row.names = TRUE)

#This was then cleaned up and added to the Sentiment_dataset1.csv manually in 
# Microsoft Excel, along with columns with the Goodreads ratings and the status 
# of the novel (bestseller, canonical, both, neither)
