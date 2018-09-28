# Task 1
# copy original dataframe into a new one: my_mtcars
# mtcars object is one of many built-in data sets in R. So you do not need to worry about creating mtcars.
my_mtcars <- mtcars
# 1: investigate my_mtcars using str function. How many variables and observations are included in this dataframe?
str(my_mtcars)
# 2: calculate engine displacement per cylinder and save it as a new variable 'UnitEngine' in the dataframe. Populate the two XXXX below
my_mtcars$UnitEngine <- my_mtcars$disp/my_mtcars$cyl
# 3. summarize the new variable 'UnitEngine': use summary function
summary(my_mtcars)
# Task 2
# 4. create a numeric vector 'Pets' with this numbers (1,1,1,0,0)
Pets <- c(1,1,1,0,0)
# 5. create a numeric vector 'Order' with these numbers (3,1,2,3,3)
Order <- c(3,1,2,3,3)
# create a numeric vector 'Siblings'
Siblings <- c(0,3,5,0,0)
# create a numeric vector 'IDs'
IDs <- c(1,2,3,4,5)
# 6. Combine those four numeric vectors together into a dataframe called 'myFriends'. You must use data.frame function
myFriends <- data.frame(Pets, Order, Siblings, IDs)
# 7. report the structure of the dataframe
str(myFriends)
# 8. summarize the dataframe. Use summary function
summary(myFriends)
# list (or print) all of the values for 'IDs' variable in the dataframe
myFriends$IDs
# list all of the values for 'Pets' variable in the dataframe
myFriends$Pets
# 9. list all of the values for 'Order' variable in the dataframe
myFriends$Order
# list all of the values for 'Siblings' variable in the dataframe
myFriends$Siblings
# 10. write a code to print the values in the fifth observation of the Pets variable
print(myFriends$Pets[5])
# 11. add a vector called 'age' to 'myFriends' using cbind function. *** YOU MUST USE cbind FUNCTION to receive full grades.
age <-c(23, 21, 45, 21, 18)
cbind(myFriends, age)
# 12. define a vector called 'names' by including all the names in a vector. Add a vector 'names' to 'myFriends' using cbind function. Print the structure of 'myFriends'. What is the data type (among: factor, numeric, logical, string) of the 'names'?
names <- c("Pets", "Order", "Siblings", "IDs", "age")
cbind(names, myFriends)