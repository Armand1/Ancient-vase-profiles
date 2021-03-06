
```{r}
rm(list=ls())
```
#libraries
```{r}
library(readr)
library(dplyr)
library(data.table)
```
#get list of profiles
```{r}
p<-"data/profiles"
a<-files<-list.files(path=p, pattern = "*.csv")
```
#assemble files
```{r}
a2<-lapply(paste(p,a, sep="/"), read_csv)
a3<-lapply(a2, as.data.frame)
a4<-do.call(rbind.data.frame, a3)
dim(a4)
```
#add metadata
```{r}
m<-read.csv("data/metadata/metadata.csv")
a5<-merge(a4, m, by="id")
```
#arrange
```{r}
a5<-a4%>%
  arrange(dataset, dataset_id, point_order)
```
#write
```{r}
write.csv(a5, "data/processed/all_profiles.csv", row.names=FALSE)
```
