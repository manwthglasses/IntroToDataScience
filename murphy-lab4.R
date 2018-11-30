setwd("/home/manwthglasses/Documents/IntroToDataScience/")

##Step 1
readStates <- function(urlTemp) {
  data <- read.csv(url(urlTemp))
  
  ##Step 2
  data <- data[-1:-8,-6:-10]
  data <- data[-52:-58,]
  rownames(data) <- NULL
  colnames(data) <- c("StateName", "Census", "Estimates", "Pop2010", "Pop2011")
  data$StateName <- gsub("\\.","",data$StateName)
  data$Census <- as.numeric(gsub(",","",data$Census))
  data$Estimates <- as.numeric(gsub(",","",data$Estimates))
  data$Pop2010 <- as.numeric(gsub(",","",data$Pop2010))
  data$Pop2011 <- as.numeric(gsub(",","",data$Pop2011))
  
  return(data)
}

##Step 3
urlToRead <- "http://www2.census.gov/programs-surveys/popest/tables/2010-2011/state/totals/nst-est2011-01.csv"
dfStates <- readStates(urlToRead)
dfStates
mean(dfStates$Pop2011)
max(dfStates$Pop2011)
dfStates$StateName[match(max(dfStates$Pop2011), dfStates$Pop2011)]
dfStates <- dfStates[order(dfStates$Pop2011),]

##Step 4
Distribution <- function(vector, number){
  count <- 0
  for(i in 1:length(vector)){
    if(vector[i]<number)
      count <- count + 1
  }
  return(count/length(vector))
}

Distribution(dfStates$Pop2011, mean(dfStates$Pop2011))