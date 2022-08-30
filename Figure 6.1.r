#### Film adaptations of Dracula and the Beetle####

# Loading in the data (for more information about the data collection process, see the CHR2020 repository on my Github profile)

library(ggExtra)
library(ggrepel)
library(readr)
Dracula_adaptations <- read_csv("Datasets and auxiliary files/Dracula adaptations.csv")

# Labeling several noteworthy adaptations

ix_label <- c(66,2,3,68,60,69)
Dracula_adaptations$Title[-ix_label] <- ""
Dracula_adaptations$Title[ix_label] <- rownames()[ix_label]

options(ggrepel.max.overlaps = Inf) 

# Creating the plot

plot2 <- ggplot(Dracula_adaptations, aes(Year, ImdB, shape = `Book?`, label = Title)) +
    geom_point(alpha = 0.7, size = 3, color = ifelse(Dracula_adaptations$Title == "", "gray48", "gray20"))+
    geom_label_repel(aes(label = Dracula_adaptations$Title),
    box.padding = 0.35, 
    point.padding = 0.5,
    segment.color = 'grey50') +
    theme(legend.title = element_blank(), 
          legend.position="bottom", 
          legend.direction = "horizontal") +
   labs(y = "Number of IMDb ratings")
plot2

# Adding marginal histograms

plot2 <- ggMarginal(plot2, type="histogram")

plot2

# Exporting the plot

ggsave(file = "Raw plots/Figure 6.1 (raw).pdf", plot = plot2, dpi = 300)