library(minfi)
library(dplyr)
data<- readRDS("meth_data_samples.csv")


minfi::densityPlot(data)
# Turning the data into a matrix
# 
matrix_data<-as.matrix((data))
# Density Plot
density_beta<-minfi::densityPlot(matrix_data)
save.image("density_beta",density_beta)
# save density plot 
# Bean plot
# save bean plot
bean_plot<-minfi::densityBeanPlot(matrix_data)
save.image("bean_plot_beta",bean_plot)
