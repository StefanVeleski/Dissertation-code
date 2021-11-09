install.packages("devtools") 
devtools::install_github("massimoaria/bibliometrix")
# Installing the latest version just in case

library(bibliometrix)
# Loading .bib file

D <- convert2df("Datasets/scopus.csv")
# I have exported the list with the preliminary 80 sources as a .csv file. The preliminary bibliography that I generated is available on my Scopus profile. The test.bib file was generated with the help of Jabref. For that I need to get the latest version of the .bib file I am using in my dissertation, load it in Jabref, and then get the latest .aux file from the dissertation. Then in Jabref I will need to go to Tools and then new sublibrary based on aux file. This will generate a bib file that only features the cited references. Then I will go through that one by one and match each reference against the test.bib available in the dissertation folder. Whatever doesn't get a match gets added to the Scopus list. Once every single one reference has been added I will need to export a .csv file with all the possible exporting options enabled. I will use that csv file to replace the one in the datasets folder. Finally, I will need to edit this file so that it seems that it's written for the reader, not for me.  

# Converting the loaded file into a R bibliographic dataframe
M <- convert2df("Datasets/scopus.csv", dbsource="scopus",format="csv")

# General information about the data
results <- biblioAnalysis(M, sep = ";")

S <- summary(results, k=15, pause=FALSE, width=130)

plot(x=results, k=10, pause=F)

CR <- citations(M, field = "article", sep = ";")
x <- cbind(CR$Cited[1:20])

NetMatrix <- biblioNetwork(M, analysis = "co-citation", network = "references", sep = ";", short=TRUE)
net=networkPlot(NetMatrix, n = 80, Title = "Co-Citation Network", type = "fruchterman", size.cex=TRUE, size=20, remove.multiple=FALSE, labelsize=0.7,edgesize = 10, edges.min=1, normalize="association")

#OK so I've decided to just track down the articles in question in Scopus. This would guarantee that this thing actualy works. Run the program with the current number of sources to see whether it works or not. 
#Write the full procedure from start to finish in the actual text of the script. This is fully reproducible in the code. 

#The preliminary comment that I can concoct at this point in time is that evolutionary psychology, biocultural criticism is blue, cultural evolution is red, and psychology and other social sciences are green. 