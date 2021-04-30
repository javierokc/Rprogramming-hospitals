#
rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        ## Check that state and outcome are valid
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        if (!state %in% state.abb) stop("invalid state")
        if (outcome == "heart attack") {
                outcomeCol <- 11
        } else if (outcome == "heart failure") {
                outcomeCol <- 17
        } else if (outcome == "pneumonia") {
                outcomeCol <- 23
        } else {
                stop("invalid outcome")
        }
        outcome_data <- read.csv("outcome-of-care-measures.csv")
        outcome_by_state <- split(outcome_data, outcome_data$State)
        my_state <- getElement(outcome_by_state, state)
        my_state[, outcomeCol] <- as.numeric(my_state[, outcomeCol])
        
        if(num == "best") { num <- 1 }
        
        if (num == "worst") {
                my_sort <- my_state[order(my_state[, outcomeCol], my_state[, "Hospital.Name"], na.last = FALSE), ]
                c(my_sort[length(my_sort[, "Hospital.Name"]), "Hospital.Name"],
                  my_sort[length(my_sort[, "Hospital.Name"]), outcomeCol])
        } else {
                my_sort <- my_state[order(my_state[, outcomeCol], my_state[, "Hospital.Name"], na.last = TRUE), ]
                if(is.na(my_sort[num, outcomeCol])) { return(NA)}
                c(my_sort[num, "Hospital.Name"], my_sort[num, "City"], my_sort[num, outcomeCol])
        }
}