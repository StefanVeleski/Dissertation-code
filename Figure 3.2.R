# Loading the libraries
library(tidyverse)
library(ggraph)
library(tidygraph)
library(babynames)

# Creating the table of nodes - using the most popular baby names in the USA in 2017 (above the 11000 incidence threshold) to name the individual nodes 

nodes <- babynames %>%
  filter(year == 2017) %>%
  filter(n > 11000)

# Creating the table of links

# Create source and target vectors 
set.seed(123)
src <- sample(1:nrow(nodes), nrow(nodes)*2, replace = TRUE)  
target <- sample(1:nrow(nodes), nrow(nodes)*2, replace = TRUE)

# Merge vectors to form a single table 
links <- data.frame(src, target)

# Clean up 
links <- data.frame(src, target) %>%  
  filter(!(src == target)) 

links <- unique(links[c("src", "target")])


# Plotting the network 
# Type cast to tbl_graph object
social_net_tbls <- tbl_graph(nodes = nodes, 
                             edges = links, 
                             directed = FALSE)

# Creating the network 
ggraph(social_net_tbls, layout = "fr") +                                                                                                  
  geom_node_point(size = 3) +                                         
  geom_node_text(aes(label = name), nudge_y = 0.3)+ 
  geom_edge_link() +
  theme_void()

# Exporting the raw pdf file

ggsave(file = "Raw plots/Figure 3.2 (raw).pdf", dpi = 300)