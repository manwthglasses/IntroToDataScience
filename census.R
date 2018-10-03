#Set working directory 
setwd("/home/manwthglasses/Documents/IntroToDataScience/")
#Set URl and load dataframe
urlToRead <- "http://www2.census.gov/programs-surveys/popest/tables/2010-2011/state/totals/nst-est2011-01.csv"
testFrame <- read.csv(url(urlToRead))
str(testFrame)
#Removing rows and columns
testFrame <- testFrame[-1:-8,]
summary(testFrame[,6:10])
testFrame <- testFrame[,1:5]
tail(testFrame,5) 
testFrame <- testFrame[-52:-58,]
str(testFrame)
#Renaming rows and columns
testFrame$stateName <- testFrame[,1]
str(testFrame)
colnames(testFrame)
testFrame <- testFrame[,-1]
colnames(testFrame)
testFrame$stateName
#cleaning up elements
testFrame$stateName <- gsub("\\.","", testFrame$stateName) 
testFrame$stateName
str(testFrame)
testFrame$april10census
testFrame$april10census <- gsub(",", "", testFrame$X) 
testFrame$april10base <- gsub(",","",testFrame$X.1)
testFrame$july10pop <- gsub(",","",testFrame$X.2)
testFrame$july11pop <- gsub(",","",testFrame$X.3)
testFrame$april10census <- as.numeric(gsub(" ","", testFrame$april10census))
testFrame$april10base <- as.numeric(gsub(" ","", testFrame$april10base))
testFrame$july10pop <- as.numeric(gsub(" ","", testFrame$july10pop))
testFrame$july11pop <- as.numeric(gsub(" ","", testFrame$july11pop))
testFrame <- testFrame[,-1:-4]
head(testFrame,5)
rownames(testFrame) <- NULL
head(testFrame,5)
#Sorting data frames
sortedStates <- testFrame[order(-testFrame$july11pop),]
head(sortedStates,5)
write.csv(testFrame, "testFrame.WM.csv")