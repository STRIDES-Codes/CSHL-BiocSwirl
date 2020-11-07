library(GEOquery)
library(dplyr)
data<- getGEO("GSE39141")
meth_data<- data$GSE39141_series_matrix.txt.gz@assayData$exprs
meth_data_df<- as.data.frame(meth_data)
# Healthy samples
health<-data$GSE39141_series_matrix.txt.gz@phenoData@data


# "GSM956790" "GSM956791" "GSM956792" "GSM956793"
healthy_samples<-health[which(health$`disease state:ch1`=="healthy"),]
#GSM956761" "GSM956762" "GSM956763" "GSM956764"
cancer_samples<-health[which(health$`disease state:ch1`=="leukemia"),]
cancer_samples$geo_accession

geo_accession_selected<- c("GSM956790", "GSM956791", "GSM956792", "GSM956793","GSM956761" ,"GSM956762" ,"GSM956763" ,"GSM956764")

df_selected<-meth_data_df %>%
  select("GSM956790", "GSM956791", "GSM956792", "GSM956793","GSM956761" ,"GSM956762" ,"GSM956763" ,"GSM956764")
saveRDS(df_selected,file="meth_data_samples.csv")
