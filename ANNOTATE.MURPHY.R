setwd("/home/manwthglasses/Documents/IntroToDataScience") 

urlToRead <- "https://www2.census.gov/programs-surveys/popest/tables/2010-2011/state/totals/nst-est2011-01.csv"

testFrame <- read.csv(url(urlToRead))

#The head function returns the first part of the data frame, while str will print out the structure, so some column and row names and the type of elements in
head(testFrame)

str(testFrame)

#The first line removes the first row, and the first 8 columns. Then head returns the first part again, this time with the new updated data frame. Then the summary functions returns the variable types and other information about the columns 6 to 10 
testFrame <-testFrame[-1:-8,]
head(testFrame)

summary(testFrame[,6:10])

#After the comprehending the results from the summary function, we delete all the columns other than the first 5
testFrame <- testFrame[,1:5]

#The first line cuts off the columns from 52 to 58, and then prints out the first data points from the data frame
testFrame <-testFrame[-52:-58,]
head(testFrame)

#the first column is given the variable name "stateName", and then the first data points are printed again
testFrame$stateName <-testFrame[,1]
head(testFrame)

#The column names are printed from the data set
colnames(testFrame)

#This removes the first colum
testFrame <-testFrame[,-1]
head(testFrame)

#This prints out the column names and then copies the column names to the variable cnames
#a second variable, cnames2, is given a list of other names
#This variable is then put into the data frame, renaming the columns
colnames(testFrame)
cnames<-colnames(testFrame)
cnames

cnames2 <-c("Census", "Base", "Census2010", "Census2011","StateName")
colnames(testFrame) <-cnames2
head(testFrame)

#The gsub function in this use, deletes all iterations of "\." in the variable StateName
testFrame$StateName <-gsub("\\.", '',testFrame$StateName)
head(testFrame)

#All commas are deleted under the Census, Base, Census2010, and Census2011 variables and then converted to numeric data types
testFrame$Census <-as.numeric(gsub(",","",testFrame$Census))
testFrame$Base <-as.numeric(gsub(",","",testFrame$Base))
testFrame$Census2010 <-as.numeric(gsub(",","",testFrame$Census2010))
testFrame$Census2011 <-as.numeric(gsub(",","",testFrame$Census2011))

testFrame

#rownames
rownames(testFrame)<-NULL
testFrame

#move the last column to first
library(dplyr)
new_testFrame <-testFrame %>% select(StateName, everything())
