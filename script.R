# Author: Simon Besson-Girard
# Creation date: 20170413
# Description: functions for analysing bibtex library (stats, graphs, ...)

library(magrittr)
library(dplyr)
library(tidyr)
library(ggplot2)

pathbib <- "library.bib"
bib <- readChar(pathbib, file.info(pathbib)$size)
bibart <- strsplit(bib, "[@]article") %>% unlist
bibpmidand <- lapply(strsplit(bibart[-1], "pmid ="), function(x) return(x[2])) %>% unlist #-1 for export with header (mendeley)
bibpmidbra <- lapply(strsplit(bibpmidand, ",\n"), function(x) return(x[1])) %>% unlist
bibpmid <- bibpmidbra %>% sub("[{]", "", .) %>%  sub("[}]", "", .) %>% sub(" ", "", .)

citationpageroot <- "https://www.ncbi.nlm.nih.gov/pubmed?LinkName=pubmed_pubmed_refs&from_uid=" #followed by pmid


