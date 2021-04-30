# Rprogramming-hospitals
Functions to get information on hospital rankings
This module defines three functions to retrieve information on hospital rankings
best(outcome, state) : Retrieves the best hospital (lowest mortality rate) from three outcomes:

- heart attack
- heart failure
- pneumonia

rankhospital(outcome, state, num = "best") : Retrieves the hospital ranked at 'num' for the given outcome.

rankall(outcome, num = "best") : Retrieves the hospital ranked 'num' for the given outcome at each of 50 states.
