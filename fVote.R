#################################################################
## File: fVote
## Origin Date: 4/9/14
## Jeff Stefan
## Reads voting data from Florida counties (Bush vs. Gore vs indies)
## This looks like a good dataset to work and experiment with.
## Yes, there's a lot of objects but it helps with readability
## and tracibility.
##
## 7 CANDIDATES
## George Bush
## Al Gore
## Ralph Nadar
## Pat Buchanan
## Nelson
## McCollum
## Logan
##
## 66 COUNTIES
## Alachua, Baker, Bay, Bradford, Brevard, Broward, Calhoun,
## Charlotte, Citrus, Clay, Collier, Columbia, Dade, DeSoto,
## Dixie, Duval, Escambia, Flagler, Franklin, Gadsden, Gilcrist,
## Glades, Gulf, Hamilton, Hardee, Hendry, Hernando, Highland,
## Hillsboro, Holmes, Indian River, Jackson, Jefferson, Lafayette,
## Lake, Lee, Leon, Levy, Liberty, Madison, Manatee, Marion, 
## Martin, Monroe, Nassau, Okaloosa, Okeechob, Orange, Palm Beach,
## Pasco, Pinellas, Polk, Putnam, Santa Rosa, Sarasota, Seminole,
## St. Johns, St. Lucie, Sumter, Suwanne, taylor, Union, Volusa,
## Wakulla, Walton, Washington
################################################################
# OBJECTS
# a : is the data frame containing all of the voter data
# alGore    : contains Al Gore's votes by county
# geoBush   : ditto
# patBuchanan : ditto
# ralphNader  : ditto
# Nelson      : ditto
# Logan       : ditto
#################################################
# sortGore    : sorted votes from min to max 
# sortBush    : ditto
# sortBuchanan : ditto
# sortNader   : ditto
# sortNelson : ditto
# sortLogan   : ditto
##################################################
# sumGore     : sum of Gore's votes
# sumBush     : ditto
# sumBuchanan : ditto
# sumNader    : ditto
# sumNelson   : ditto
# sumLogan    : ditto
##################################################
# sdGore      : std dev for Gore
# sdBush      : ditto 
# sdBuchanan  : ditto
# sdNader     : ditto
# sdNelson    : ditto
# sdLogan     : ditto
##################################################
#
#
#
#
#
#
#
#
#
#
#
#
################################################################
## Questions to ask:
##  - what is the ordering from most votes to least votes?
##  - in what counties did the candidates get the most votes?
##  - how close was the race?
##  - what does an ordered histogram look like? 
##  - what does a historgram look like 
##  - what does a heat map look like county to county?
##  - what does a mosaic look like?
##  - what counties correlate to a particular candidate?
##  - does that even mean anything?
##  - are there clusters?
##      - if so, where are they and what do they look like?
##      - can party line inferences be drawn?
##
#####################################################################
## CODE
#####################################################################
## Get data
##fVote = read.table("http://faculty.washington.edu/tlumley/data/FLvote.dat",header=TRUE)
## change to local working directory
getwd()
setwd("/Users/jeffstefan/flVote")
# load ggplot2
library(ggplot2)
## read data from local repo into variable a with header
a <- read.csv("flVotesCSV.csv", header=TRUE)
## check out a
a
## list counties (display col)
a[,1] # displays the first col as a list
a[1,1] # shows the first line but is abbreviated
####################################
## store candiates total votes
####################################
# Al Gore
a[,2] # read Al Gore's total vote
alGore <- a[,2] # save Al Gore's total votes

# George Bush
a[,3]
geoBush <- a[,3]

# Pat Buchanan
a[,4]
patBuchanan <- a[,4]

# Ralph Nader
a[,5]
ralphNader <- a[,5]

# Nelson
a[,6]
Nelson <- a[,6]

# McCollum
a[,7]
McCollum <- a[,7]

# Logan
a[,8]
Logan <- a[,8]

########################################## 
# sort candidates votes in ascending order
# to use later for graphs
#########################################
sortBush <- sort(geoBush)
sortBush # show result
sortGore <- sort(alGore)
sortGore # show result
sortBuchanan <- sort(patBuchanan)
sortBuchanan # show result
sortNader <- sort(ralphNader)
sortNader # show result
sortNelson <- sort(Nelson)
sortNelson # show result
sortMcCollum <- sort(McCollum)
sortMcCollum
sortLogan <- sort(Logan)
sortLogan

#### sum candiate votes and show results ####
# Al Gore
sumGore <- sum(alGore)
sumGore 
# George Bush
sumBush <- sum(geoBush)
sumBush
# Pat Buchanan
sumBuchanan <- sum(patBuchanan)
sumBuchanan
# Ralph Nader
sumNader <- sum(ralphNader)
sumNader
# Nelson
sumNelson <- sum(Nelson)
sumNelson
# McCollum
sumMcCollum <- sum(McCollum)
sumMcCollum
# Logan
sumLogan <- sum(Logan)
sumLogan

# get standard dev and variance for each candidate and show
# Gore
sdGore <- sd(alGore)
sdGore
# Bush
sdBush <- sd(geoBush)
sdBush
# Buchanan
sdBuchanan <- sd(patBuchanan)
sdBuchanan
# Nader
sdNader <- sd(ralphNader)
