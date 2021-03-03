#Michael Segaline
#C997 
#BOM1

install.packages("ggplot2")
library("ggplot2")
library(lattice)

# -- Importing the Data -- #
################################################################################

#Importing a copy of the Washington State populations per years as it relates to the 
# nst-est2019-alldata

WA_pop <- read.csv(file="/Users/lindasegalini/Desktop/Data Sets/WashingtonStatePopulation2019.csv")

#Displaying the file.

head(WA_pop)
# -- Exploring the data.--  #
################################################################################

#Create a plot.
#The graph shows a step increasing correlation between years past and population 
#increase into Washington State. 
plot(WA_pop)

#Plotting a scatterplot with ggplot.
#Again, a perfect diagonal line in the same shape and visual slope of the
# last chart.

ggplot(WA_pop, aes(x=Year, y =Population))+
  geom_point()

#Now displaying model on ggplot.
ggplot(WA_pop, aes(x=Year, y=Population))+geom_point()+geom_smooth(method = "lm")

# -- Making the model for Linear Regression Analysis. -- #
################################################################################

#Fitting a linear model for prediction.

fit =lm(Population~Year,WA_pop)

#Generating tabular data about the model.
summary(fit)

#Now the coefficients and are evident for manual computation. 

# --Making Predictions -- #
################################################################################

#Predicting the Washington State population by 2025.
#Creating a variable new_year to use with our predict() function.
new_year <- data.frame(Year =2025)
predict(fit,new_year)

#The model is predicting that by 2025 there will be 8,198,161 Washingtonians.

#Another prediction for year 2030:

year_2030 <- data.frame(Year = 2030)
predict(fit,year_2030)

#The model predicted 8,697,014 Washingtonians as of year 2030.
