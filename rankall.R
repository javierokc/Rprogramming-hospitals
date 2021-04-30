#
rankall <- function(outcome, num = "best") {
        ## Read outcome data
        ## Check that state and outcome are valid
        ## For each state, find the hospital of the given rank
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
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
        states <- vector(mode = "character")
        hospitals <- vector(mode = "character")
        for(thestate in state.abb) {
                my_state <- getElement(outcome_by_state, thestate)
                if(is.null(my_state)) { next }
                my_state[, outcomeCol] <- as.numeric(my_state[, outcomeCol])
                
                if(num == "best") { num <- 1 }
                
                if (num == "worst") {
                        my_sort <- my_state[order(my_state[, outcomeCol], my_state[, "Hospital.Name"], na.last = FALSE),]
                        hospitals <- append(hospitals, my_sort[length(my_sort[, "Hospital.Name"]), "Hospital.Name"])
                        states <- append(states, thestate)
                } else {
                        my_sort <- my_state[order(my_state[, outcomeCol], my_state[, "Hospital.Name"]),]
                        if(is.na(my_sort[num, outcomeCol])) { next }
                        states <- append(states, thestate)
                        hospitals <- append(hospitals, my_sort[num, "Hospital.Name"])
                }
        }
        data.frame(state = states, hospital = hospitals)
}
