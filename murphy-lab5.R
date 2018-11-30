setwd("/home/manwthglasses/Documents/IntroToDataScience/")

## Task 1
norm <- rnorm(1000, mean = 80)

ndist <- function(vector, min, max){
  b <- length(vector[(vector>= min) & (max <= vector) ])
  return(b)
}

replicate(5, ndist(rnorm(1000, mean = 80), 79, 81))

##Task 2
library(VGAM)
FSApops <- rpareto(51, scale = 40000000, 3)
hist(FSApops)
mean(FSApops)
sd(FSApops)
min(FSApops)
max(FSApops)