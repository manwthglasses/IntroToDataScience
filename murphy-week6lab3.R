#Set working directory
setwd("/home/manwthglasses/Documents/IntroToDataScience/")
#Explore the mtcars dataset (which is already included in R). Copy the mtcars dataset into a new variable (called it myCars), so that if you mess up, you can start again (by copying mtcars into myCars again).
myCars <- mtcars
#Step 1: Which car has the best hp (hp stands for “horse power”)
#1. Which car has the best hp?
row.names(myCars[which.max(myCars$hp),])
#Step 2: Explore mpg (mpg stands for “miles per gallon”)
#2.What is the highest mpg?

myCars[order(-myCars$mpg),][1,1]
#3.Which car has the highest mpg?
row.names(myCars[which.max(myCars$mpg),])
#4.Create a sorted dataframe, based on mpg.
sortedCars <- myCars[order(-mtcars$mpg),]
#Step 3: Which car has the “best” combination of mpg and hp?
#HINT: divide the mpg value by hp, and pick the car with highest result
#add a new column 'efficiency' in the dataframe to store the division result
myCars$efficiency <- myCars$mpg/myCars$hp

#to find the maximum of this new created column
max(myCars$efficiency)

#6.Which car has the best combination of mpg and hp?
row.names(myCars[which.max(myCars$efficiency),])
#Step 4: Which car has “best” combination of mpg and hp, where mpg and hp must be given equal weight?
#The goal of this step is to put you in a situation where you have to implement a new function you didn't learn. You should be able to use knowledge on R to solve new problem. 
#scale mpg first:
scale(myCars$mpg)

#scale 'hp' (scale is subtracting its column mean and then dividing its column’s standard deviation. But you just use scale function like this:)
scale(myCars$hp)

#7.You just created two new variable using mpg and hp using scale function. Add the two scaled data and save the result as a new column 'combination' in the dataframe. Populate XXXX below;
myCars$combination <-scale(myCars$mpg) + scale(myCars$hp)

#8.Get the index of maximum combination first, and then get its row name. HINT: use which.max function AND row.names function
max(myCars$combination)
row.names(myCars[which.max(myCars$combination),])
