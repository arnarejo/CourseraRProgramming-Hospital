## OBJECTIVE 1 - Read data and plot hist of mortality rates for heart attack

# Read csv data
data <- read.csv("data/outcome-of-care-measures.csv",  colClasses = "character")

# change mortality column to numeric format
data[,11] <- as.numeric(data[,11])

# plot mortality data as histogram
hist(data[,11])


## OBJECTIVE 2 - Finding the best hospital in a state
# Read csv data
data2 <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character")
data2 <- data2[,c(2,7, 11,17,23)]
names(data2) <- c("Hospital", "State", "heart attack", "heart failure", "pneumonia")
state = "TX"
outcome = "heart attack"
data3 <- data2[data2$State == state,][,c("Hospital", "State", outcome)]
final <- head(data3[order(data3$`heart attack`, rev(data3$`heart attack`), decreasing = TRUE), ])
return(final)

best <- function(state, outcome) {
    data <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character")
    data <- data[,c(2,7, 11,17,23)]
    names(data) <- c("Hospital", "State", "heart attack", "heart failure", "pneumonia")
    data <- data[data$State == state,][,c("Hospital", "State", outcome)]
    data[,outcome] <- as.numeric(data[,outcome])
    data <- data[order(data, data[,3], decreasing = TRUE), ]
    return(str(data))
}