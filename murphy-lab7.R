setwd("/home/manwthglasses/Documents/IntroToDataScience/")

##Activating the sqldf library
library(sqldf)

##Making sure built-in data set airquality is available, and seeing first few values
print(head(airquality))

##Copies airquality into air object
air <- airquality
##Checks the object type of air
class(air)

##
average_ozone <- sqldf("Select AVG(Ozone) From air")
print(average_ozone)

sqldf("Select Ozone From air Where Ozone > (Select AVG(Ozone) From air)")

newAQ <- sqldf("Select Ozone From air Where Ozone > (Select AVG(Ozone) From air)")
class(newAQ)
nrow(newAQ)
ncol(newAQ)
head(newAQ)

# (a) Exclude Missing Values from calculating "Ozone" mean and assign the result to "average_ozone": Hint:use na.rm
average_ozone <- mean(air$Ozone, na.rm = TRUE)
# (b) print the result (average_ozone)
print(average_ozone)
# Repeat step 5
# (c) select rows with bigger values than the average ozone value 
######wrong approach: data$Ozone > meanOzone 
#[1] FALSE FALSE FALSE FALSE    NA FALSE FALSE FALSE FALSE    NA FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#[23] FALSE FALSE
###################
##tapply(air$Ozone, air$Ozone>average_ozone , data.frame)$'TRUE'
na.exclude(air[air$Ozone>average_ozone,])
# (d) Repeat step 6
# only keep the rows in which the Ozone values are higher than the average, and write the result table into a new R data object called "newAQ2"
newAQ2 <- na.exclude(air[air$Ozone>average_ozone,])
# (e) reveal what type of object newAQ2 is
class(newAQ2)
# (f) reveal the number of rows, then reveal the number of columns
nrow(newAQ2)
ncol(newAQ2)
# (g) show the first few rows of "newAQ2
head(newAQ2)