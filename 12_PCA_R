## set wd #load packages #load data

setwd("~/caribou/Thesis Chapters/pop history")

#load packages and data
library(tidyverse)
library(ggplot2)
library(RColorBrewer)

#load SNP data 
cov<-as.matrix(read.table("FILENAME.pcangsd.cov"))

e <- eigen(cov)

evectors = e$vectors

#add in individual + pop names
names<-read.table("bamfilelist.txt")

#assign names for covariance matix 
range <-names$V2
pop <-names$V3

pca.vectors = as.data.frame(cbind(evectors, range, pop))

df = type_convert(pca.vectors)

####

##plot PCA
pca = ggplot(data = df, aes(x=V1, y=V2, color = pop)) + geom_point()

#plot by population - use colours from R colour brewer packages ##
pca + scale_color_brewer(palette = "Paired") + theme_bw()
ggsave(filename = "pca_pops.pdf", plot = pca)

#plot by ranges - all of the colour brewer packages had red and green in the default 2 main colours ## not good for plot! ## use wes anderson colour palette
install.packages("wesanderson")
library(wesanderson)

pca_ranges = ggplot(data = df, aes(x=V1, y=V2, color = range)) + geom_point() + theme_bw() + scale_color_manual(values=wes_palette(n=2, name="Cavalcanti1"))
pca_ranges

ggsave(filename = "pca_ranges.pdf", plot = pca)

