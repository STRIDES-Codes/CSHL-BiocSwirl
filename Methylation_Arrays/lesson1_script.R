library(minfi)
library(dplyr)
library(GEOquery)
library(here)

data<- readRDS("meth_data_samples.csv")
# Turning the data into a matrix
matrix_data<-as.matrix((data))
# Density Plot
density_beta <- minfi::densityPlot(matrix_data)

## save density plot 
png("density_beta.png",density_beta)


# Bean plot
# save bean plot
bean_plot <- minfi::densityBeanPlot(matrix_data)
png("bean_plot_beta.png",bean_plot)


