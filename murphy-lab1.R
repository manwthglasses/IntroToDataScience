setwd("/home/manwthglasses/Documents/IntroToDataScience/")
#Define the following vectors, which represent the weight and height of people on a particular team (in inches and pounds):
height <- c(59,60,61,58,67,72,70)
weight <- c(150,140,180,220,160,140,130)
#Define a variable:
a <- 150
#1.Compute, using R, the average height (called mean in R).
mean(height)
#2,Compute, using R, the average weight (called mean in R).
mean(weight)
#3.Calculate the length of the vector “height” and “weight.”
length(height)
length(weight)
#4.Calculate the sum of the heights.
sum(height)
#5.Compute the average of both height and weight, by dividing the sum (of the height or the width, as appropriate), by the length of the vector. How does this compare to the “mean” function?
sum(height)/length(height)
sum(weight)/length(weight)
#6.Compute the max height, store the result in “maxH.”
maxH <- max(height)
#7.Compute the min weight, store the results in “minW.”
minW <- min(weight)
#8.Create a new vector, which is the weight + 5 (every person gained 5 pounds).
newWeight <- weight + 5
#9.Compute the weight/height (weight divided by height) for each person, using the new weight just created.
newWeight/height
#10.Write the R code to test if max height is greater than 60 (output “yes” or “no”).
if (maxH > 60){
  print("yes")
} else {
  print("no")
}
#11.Write the R code to test if min weight is greater than the variable “a” (output “yes” or “no”).
if (minW > a){
  print("yes")
} else {
  print("no")
}