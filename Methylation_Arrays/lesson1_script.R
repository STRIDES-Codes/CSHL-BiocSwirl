library(minfi)
library(dplyr)
library(GEOquery)
library(here)

data<- readRDS("meth_data_samples.csv")
# Turning the data into a matrix
matrix_data<-as.matrix((data))
png("density_beta.png")
# Density Plot
beta_density <- minfi::densityPlot(matrix_data)

## save density plot 

dev.off()


# Bean plot
# save bean plot
png("bean_plot_beta.png")
 bean_plot <- minfi::densityBeanPlot(matrix_data)

dev.off()

