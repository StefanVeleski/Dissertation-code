# General summary
All of the datasets, code, full text files, and figures used in my dissertation.

## Datasets

The metadata for the books was taken from the [At the Circulating Library website](http://www.victorianresearch.org/atcl/), before the June 2020 update. It should be noted that the raw data from the ACL website was cleaned in order to keep only novels and standalone novellas, excluding collections of poems, short stories, and novellas, as well as plays (this is because books containing several disparate stories could seriously affect the results, i.e. if a book contains three stories, and the first and third have vastly different mean emotional valence for example, the end results could be heavily skewed).

Data about which novels were bestsellers at the time of publication was manually extracted from ["Booksellers and Bestsellers: British Book Sales as Documented by "The Bookman", 1891-1906"](https://www.jstor.org/stable/30227332?seq=1#metadata_info_tab_contents) by Bassett and Walter.

Data from [Goodreads](https://www.goodreads.com/) (used as proxy for the present-day popularity of the novels) was scraped over the course of June 2020, and slight changes in the number of ratings since then are to be expected. For easier access, the data has been split into several datasets, for each stage of the analysis.

Data from [Open Syllabus](https://opensyllabus.org/) (used as proxy for the present-day academic prestige of the novels) was manually extracted in June and July 2020 as my request for the data was rejected "due to uncertainty [of the Open Syllabus staff] about [their] liabilities and responsibilities under GDPR" which prevented them from sharing raw data with researchers from EU institutions.

## Code

All of the analyses in the paper were done in R (version 4.2.0.). The packages [ggplot2](https://cran.r-project.org/web/packages/ggplot2/index.html) and [ggstatsplot](https://cran.r-project.org/web/packages/ggstatsplot/index.html) were used for the exploratory analyses and data visualization, [gutenbergr](https://cran.r-project.org/web/packages/gutenbergr/index.html) was used for dealing with the full text files taken from Project Gutenberg, [syuzhet](https://cran.r-project.org/web/packages/syuzhet/index.html) was used for getting the mean sentiment of each of the novels, [ggpubr](https://cran.r-project.org/web/packages/ggpubr/index.html) was used for the correlation plots (Pearson correlation), and [koRpus](https://cran.r-project.org/web/packages/koRpus/vignettes/koRpus_vignette.html) was used for calculating the average MATTR for each of the novels.

The packages [ggrepel](https://cran.r-project.org/web/packages/ggrepel/vignettes/ggrepel.html#overview), [ggforce](https://ggforce.data-imaginist.com/), and [ggextra](https://cran.r-project.org/web/packages/ggExtra/vignettes/ggExtra.html) were used to improve the aesthetics and the information density of the plots (improved labels, facet zoom, and marginal distribution respectively).

## Text files

The full text files of the novels covered in the paper were taken from [Project Gutenberg](https://www.gutenberg.org/), after the full dataset gotten from ACL was matched against the full Project Gutenberg dataset (which contains more than 60,000 titles). All the remaining paratext in the files (advertisements, table of contents, foreword etc.) was manually removed.

Note: each of the novels are assigned numbers from 1 to 847, but there are only 846 novels in total. This is because novel number 11 — A Christmas Child: A Sketch of A Boy's Life (published in 1880 and hence outside of the scope of this paper, which focuses on novels published between 1891 and 1901) was mistaken for Marie Corelli's Boy: A Sketch (which surprisingly does not have a Project Gutenberg page, despite being a bestseller upon publication) by the fuzzy lookup function I used. I have not noticed any other such errors in the data collection process.

## Figures

All analyses in this repository is meant to be fully reproducible. Each R script generates .jpg or .pdf files, which are stored in the Raw plots subfolder. Images that needed additional processing were exported as .pdf files and their file names contain "(raw)" at the end. The additional processing was done using Adobe Illustrator and usually consisted of very minor cosmetic changes. The plots were then exported as .jpg files, in the same image quality as the images exported directly from R (300 dpi).

Any suggestions, comments, and advice are more than welcome!
