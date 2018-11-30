# --------------- HW5: JSON & tapply ---------------
#install.packages("RCurl")
library(RCurl)
#install.packages("RJSONIO")
library(RJSONIO)
library(sqldf)
# ---------------------------------------------------
# Step 1: Load the data
# get data from the given URL
dataset <- getURL("http://data.maryland.gov/api/views/pdvh-tf2u/rows.json?accessType=DOWNLOAD")
# covert the JSON format dataset into R objects
mydata <- fromJSON(dataset, simplify = FALSE, nullValue = NA)
# look into the data summary
summary(mydata)


# ---------------------------------------------------
# Step 2: Clean the data
#q1: get rid of metadata and only keep the second element in the list "mydata"
mydata <- mydata[[2]]

#q2: count how many elements are in "myList" and store the number into variable "numRows"
numRows <- length(mydata)

# If we didn't have nullValue = NA, then we would need to do the following
# Test every elements in "myList" one by one, for each element:
# First, record the element into a temporary variable "record",
# Second, if the original element is NULL, assign NA to "record". If not, keep the original value.
# Third, re-assign the value of "record" to the element in "myList"
for(i in 1:numRows) { 
 record <- mydata[[i]] 
 record[sapply(record, is.null)] <- NA 
 mydata[[i]] <- record
}

# Unlist "myList" and transform it to a dataframe, whose number of rows is the value of "numRows"
df <- data.frame(matrix(unlist(mydata), nrow=numRows, byrow=T), stringsAsFactors = FALSE)

# q3: remove the first 8 columns
df <- df[,-1:-8]

# rename the rest of columns
colnames(df) <- c("CASE_NUMBER","BARRACK","ACC_DATE","ACC_TIME","ACC_TIME_CODE","DAY_OF_WEEK","ROAD","INTERSECT_ROAD","DIST_FROM_INTERSECT","DIST_DIRECTION","CITY_NAME","COUNTY_CODE","COUNTY_NAME","VEHICLE_COUNT","PROP_DEST","INJURY","COLLISION_WITH_1","COLLISION_WITH_2")

# ---------------------------------------------------
# Step 3: Understand the data using SQL (via SQLDF)
# how many accidents happen on SUNDAY
# Use sql to count how many obersavations meet the criterion that DAT_OF_WEEK is "SUNDAY"
sun_acc <- sqldf("select count(DAY_OF_WEEK) from df where TRIM(DAY_OF_WEEK) = 'SUNDAY'")
# Print the result
print(sun_acc)

# how many accidents had injuries(might need to remove NAs from the data)
# q4: Use sql to count how many obersavations meet the criterion that INJURY value is "YES," then assign the value into "inj_acc" Populate XXX below to complete the code.
inj_acc <- sqldf("select count(INJURY) from df where TRIM(INJURY) = 'YES'")

# q5: Print the result
print(inj_acc)


# list the injuries by day
# count the number of injuries for each day of the week
list_inj <- sqldf("select DAY_OF_WEEK, count(CASE_NUMBER) as Totalnumber from df where INJURY='YES' GROUP BY TRIM(DAY_OF_WEEK)")
# Print the result
print(list_inj)

# ---------------------------------------------------
# Step 4: Understand the data using tapply
# how many accidents happen on SUNDAY
# replace spaces by nothing (remove all spaces) in column "DAT_OF_WEEK" use gsub

df$DAY_OF_WEEK <- gsub(" ", "", df$DAY_OF_WEEK)


# tapply(Summary Variable, Group Variable, Function): 
# q6: apply the length function on the "SUNDAY" subset of the column DAY_OF_WEEK. populate the XXX below.
tapply(df$DAY_OF_WEEK, df$DAY_OF_WEEK=="SUNDAY", length)

# how many accidents had injuries
# apply the length function on the "YES" subset of the column INJURY
tapply(df$INJURY, df$INJURY == 'YES', length)

# list the injuries by day
# q7: apply the length function on subset of the column INJURY broken down by the value in WEEK_OF_DAY as well as INJURY. Populate XXX below
tapply(df$INJURY, df$DAY_OF_WEEK, length)

#Based on the analysis results, please answer to the following questions, if you can write your r script to draw answers:

  #q8: how many accidents happen on Sunday?
  #2372
  #q9: What is the percentage of injury for all accidents? 
  #6433
  #q10: Which day of a week do you observe the most injury?
  #Friday