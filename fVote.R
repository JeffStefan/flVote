#################################################################
## File: fVote
## Date: 4/9/14
## Reads voting data from Florida counties (Bush vs. Gore vs indies)
## This looks like a good dataset to work and experiment with
## CANDIDATES
## George Bush
## Al Gore
## Ralph Nadar
## Pat Buchanan
## Harry Browne
## John Hagelin
## Nelson
## McCollum
## Logan
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

# Ralph Nadar
a[,5]
ralphNadar <- a[,5]

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
sortNader <- sort(ralphNadar)
sortNader # show result
sortNelson <- sort(Nelson)
sortNelson # show result
sortMcCollum <- sort(McCollum)
sortMcCollum
sortLogan <- sort(Logan)
sortLogan
