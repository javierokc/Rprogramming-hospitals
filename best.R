#
best <- function(state, outcome) {
        ## Read outcome data
        ## Check that state and outcome are valid
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        outcome_data <- read.csv("outcome-of-care-measures.csv")
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
        
        outcome_by_state <- split(outcome_data, outcome_data$State)
        my_state <- getElement(outcome_by_state, state)
        my_state[, outcomeCol] <- as.numeric(my_state[, outcomeCol])
        my_sort <- my_state[order(my_state[, outcomeCol], my_state[, "Hospital.Name"]),]
        c(my_sort[1, "Hospital.Name"], my_sort[1, "City"])
}
