library(minfi)
library(dplyr)
library(GEOquery)


data<- readRDS("meth_data_samples.csv")
# Turning the data into a matrix
matrix_data<-as.matrix((data))
# Density Plot
density_beta<-minfi::densityPlot(matrix_data)
## save density plot 
save.image("density_beta.png",density_beta)

# Bean plot
# save bean plot
bean_plot<-minfi::densityBeanPlot(matrix_data)
save.image("bean_plot_beta.png",bean_plot)

