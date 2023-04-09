### Charlotte RMSE plotting ml_comparion paper
#this code is to make the RMSE boxplots with jitter for your machine learning paper.
#You need to run both your model (ml_4) and +viola model (ml.4.5) through this code to get the 2 plots
#you might have to move the excel sheets into downloads, it is currently in the ml_comparison folder in docs

# read in libraries
library(ggplot2) # plotting functions
library(readxl) # read xlxs files
library(tidyverse) # programming (see 'R for Data Science')

## Read in data
plot.data <- readxl::read_xlsx('C:/Users/cw266/Downloads/jitter_plot_RMSE_ml_comparison_R_ml_4.5.xlsx')

str(plot.data)

# boxplots

##Overall with colours 
plot.data %>% # take data
  #define plot
  ggplot(aes(x = bodypart, # x axis
             y = RMSE, #y axis
          )) + 
  geom_boxplot(outlier.colour = 'white', show.legend = FALSE, lwd=2) + # makes boxplot with slightly thicker lines
  geom_jitter(show.legend = FALSE, alpha=0.1, aes(color= bodypart)) + # adds jitter and makes slightly see through
  ##(alpha) and adds bodypart colour to jitter
  theme_classic() + #removes gray background
  ylim(0,25) + # sets y axis limits
  ylab('RMSE') + # y axis label
  xlab('Bodypart') + # x axis label
  ggtitle('Model 4.5') + #main title (change with each model)
  geom_hline(yintercept=2.74, color="red", size=2) #add horizontal line for human error RMSE 
