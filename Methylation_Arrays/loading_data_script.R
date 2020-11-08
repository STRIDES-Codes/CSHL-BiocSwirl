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

# Convert back methylation data into a matrix 
df_selected<- as.matrix(df_selected)
saveRDS(df_selected,file="meth_data_samples.csv")

# Get phenotype data
phenotype_data<- data$GSE39141_series_matrix.txt.gz@phenoData@data

disease_status<- data.frame("GEO Accession"=phenotype_data$geo_accession,"Disease"=phenotype_data$`disease state:ch1`)
needed_samples<-data.frame("geo_accession"=colnames(df_selected)) 
disease_status_1<- left_join(needed_samples,phenotype_data, by="geo_accession")
# Save the phenotype data as a matrix in an RDS
disease_status_status_1<-as.matrix(disease_status_1)
saveRDS(disease_status_status_1,file="phenotype_data_samples.csv")


