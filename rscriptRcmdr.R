# R Script for loading the cmc dataset
# and loading the Rcmdr package and 
# starting the Rcmdr GUI interface

# load the cmc dataset into the local environment
load("cmc.RData")

# load the Rcmdr package 
# this also starts the Rcmdr GUI interface
library(Rcmdr)