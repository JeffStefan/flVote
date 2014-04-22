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
# a is set up to be read from FLVotesCSV.csv
# fVotes read from the URL does not contain headers and
# will result in a error offset for the candidates
# 
# Candidate objects are listed below:
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
# Votes by County atomic lookup table
# Objects and observations can be constructed from this table where
# needed or the indexes can be utilized for quick and dirty stats.
#
# Vector for Y axis for bar charts: range from 0 to 50K in 5K increments
vectorYBar <- c(0,5000, 10000, 15000, 20000, 25000, 30000, 35000, 40000, 50000)
#
# ALACHUA COUNTY
# a[1,2] = num votes for Gore 
# a[1,3] = num votes for Bush
# a[1,4] = num votes for Buchanan
# a[1,5] = num votes for Nader
# a[1,2] + a[1,3] + a[1,4] + a[1,5]
# = total votes 
# AlachuaVotes <- a[1,2] + a[1,3] + a[1,4] + a[1,5]
# 
# BAKER COUNTY
# a[2,2] = num votes for Gore
# a[2,3] = num votes for Bush
# a[2,4] = num votes for Buchanan
# a[2,5] = num votes for Nader
# a[2,2] + a[2,3] + a[2,4] + a[2,5]
#
# BAY COUNTY
# a[3,2] = num votes for Gore
# a[3,3] = num votes for Bush
# a[3,4] = num votes for Buchanan
# a[3,5] = num votes for Nader
# a[3,2] + a[3,3] + a[3,4] + a[3,5]
#
# BRADFORD COUNTY
# a[4,2] = num votes for Gore
# a[4,3] = num votes for Bush
# a[4,4] = num votes for Buchanan
# a[4,5] = num votes for Nader
# a[4,2] + a[4,3] + a[4,4] + a[4,5]
#
# BREVARD COUNTY
# a[5,2] = num votes for Gore
# a[5,3] = num votes for Bush
# a[5,4] = num votes for Buchanan
# a[5,5] = num votes for Nader
# a[5,2] + a[5,3] + a[5,4] + a[5,5]
#
# BROWARD COUNTY
# a[6,2] = num votes for Gore
# a[6,3] = num votes for Bush
# a[6,4] = num votes for Buchanan
# a[6,5] = num votes for Nader
# a[6,2] + a[6,3] + a[6,4] + a[6,5]
#
# CALHOUN COUNTY
# a[7,2] = num votes for Gore
# a[7,3] = num votes for Bush
# a[7,4] = num votes for Buchanan
# a[7,5] = num votes for Nader
# a[7,2] + a[7,3] + a[7,4] + a[7,5]
#
# CHARLOTT COUNTY
# a[8,2] = num votes for Gore
# a[8,3] = num votes for Bush
# a[8,4] = num votes for Buchanan
# a[8,5] = num votes for Nader
# a[8,2] + a[8,3] + a[8,4] + a[8,5]
#
# CITRUS COUNTY
# a[9,2] = num votes for Gore
# a[9,3] = num votes for Bush
# a[9,4] = num votes for Buchanan
# a[9,5] = num votes for Nader
# a[9,2] + a[9,3] + a[9,4] + a[9,5] 
#
# CLAY COUNTY
# a[10,2] = num votes for Gore
# a[10,3] = num votes for Bush
# a[10,4] = num votes for Buchanan
# a[10,5] = num votes for Nader
# a[10,2] + a[10,3] + a[10,4] + a[10,5] 
#
# COLLIER COUNTY
# a[11,2] = num votes for Gore
# a[11,3] = num votes for Bush
# a[11,4] = num votes for Buchanan
# a[11,5] = num votes for Nader
# a[11,2] + a[11,3] + a[11,4] + a[11,5]
#
# COLUMBIA COUNTY
# a[12,2] = num votes for Gore
# a[12,3] = num votes for Bush
# a[12,4] = num votes for Buchanan
# a[12,5] = num votes for Nader
# a[12,2] + a[12,3] + a[12,4] + a[12,5]
#
# DADE COUNTY
# a[13,2] = num votes for Gore
# a[13,3] = num votes for Bush
# a[13,4] = num votes for Buchanan
# a[13,5] = num votes for Nader
# a[13,2] + a[13,3] + a[13,4] + a[13,5] 
#
# DE.SOTO COUNTY
# a[14,2] = num votes for Gore
# a[14,3] = num votes for Bush
# a[14,4] = num votes for Buchanan
# a[14,5] = num votes for Nader
# a[14,2] + a[14,3] + a[14,4] + a[14,5]
#
# DIXIE COUNTY
# a[15,2] = num votes for Gore
# a[15,3] = num votes for Bush
# a[15,4] = num votes for Buchanan
# a[15,5] = num votes for Nader
# a[15,2] + a[15,3] + a[15,4] + a[15,5] 
#
# DUVAL COUNTY
# a[16,2] = num votes for Gore
# a[16,3] = num votes for Bush
# a[16,4] = num votes for Buchanan
# a[16,5] = num votes for Nader
# a[16,2] + a[16,3] + a[16,4] + a[16,5]
#
# ESCAMBIA COUNTY
# a[17,2] = num votes for Gore
# a[17,3] = num votes for Bush
# a[17,4] = num votes for Buchanan
# a[17,5] = num votes for Nader
# a[17,2] + a[17,3] + a[17,4] + a[17,5] 
#
# FLAGLER COUNTY
# a[18,2] = num votes for Gore
# a[18,3] = num votes for Bush
# a[18,4] = num votes for Buchanan
# a[18,5] = num votes for Nader
# a[18,2] + a[18,3] + a[18,4] + a[18,5] 
#
# FRANKLIN COUNTY
# a[19,2] = num votes for Gore
# a[19,3] = num votes for Bush
# a[19,4] = num votes for Buchanan
# a[19,5] = num votes for Nader
# a[19,2] + a[19,3] + a[19,4] + a[19,5]

# GADSDEN COUNTY
# a[20,2] = num votes for Gore
# a[20,3] = num votes for Bush
# a[20,4] = num votes for Buchanan
# a[20,5] = num votes for Nader
# a[20,2] + a[20,3] + a[20,4] + a[20,5]
#
# GILCHRIST COUNTY
# a[21,2] = num votes for Gore
# a[21,3] = num votes for Bush
# a[21,4] = num votes for Buchanan
# a[21,5] = num votes for Nader
# a[21,2] + a[21,3] + a[21,4] + a[21,5]
#
# GLADES COUNTY
# a[22,2] = num votes for Gore
# a[22,3] = num votes for Bush
# a[22,4] = num votes for Buchanan
# a[22,5] = num votes for Nader
# a[22,2] + a[22,3] + a[22,4] + a[22,5]
#
# GULF COUNTY
# a[23,2] = num votes for Gore
# a[23,3] = num votes for Bush
# a[23,4] = num votes for Buchanan
# a[23,5] = num votes for Nader
# a[23,2] + a[23,3] + a[23,4] + a[23,5]

# HAMILTON COUNTY
# a[24,2] = num votes for Gore
# a[24,3] = num votes for Bush
# a[24,4] = num votes for Buchanan
# a[24,5] = num votes for Nader
# a[24,2] + a[24,3] + a[24,4] + a[24,5]
#
# HARDEE COUNTY
# a[25,2] = num votes for Gore
# a[25,3] = num votes for Bush
# a[25,4] = num votes for Buchanan
# a[25,5] = num votes for Nader
# a[25,2] + a[25,3] + a[25,4] + a[25,5]
#
# HENDRY COUNTY
# a[26,2] = num votes for Gore
# a[26,3] = num votes for Bush
# a[26,4] = num votes for Buchanan
# a[26,5] = num votes for Nader
# a[26,2] + a[26,3] + a[26,4] + a[26,5]
#
# HERNANDO COUNTY
# a[27,2] = num votes for Gore
# a[27,3] = num votes for Bush
# a[27,4] = num votes for Buchanan
# a[27,5] = num votes for Nader
# a[27,2] + a[27,3] + a[27,4] + a[27,5] 
#
# HIGHLAND COUNTY
# a[28,2] = num votes for Gore
# a[28,3] = num votes for Bush
# a[28,4] = num votes for Buchanan
# a[28,5] = num votes for Nader
# a[28,2] + a[28,3] + a[28,4] + a[28,5] 
#
# HILLSBORO COUNTY
# a[29,2] = num votes for Gore
# a[29,3] = num votes for Bush
# a[29,4] = num votes for Buchanan
# a[29,5] = num votes for Nader
# a[29,2] + a[29,3] + a[29,4] + a[29,5]
#
# HOLMES COUNTY
# a[30,2] = num votes for Gore
# a[30,3] = num votes for Bush
# a[30,4] = num votes for Buchanan
# a[30,5] = num votes for Nader
# a[30,2] + a[30,3] + a[30,4] + a[30,5]
#
# INDIAN.RIVER COUNTY
# a[31,2] = num votes for Gore
# a[31,3] = num votes for Bush
# a[31,4] = num votes for Buchanan
# a[31,5] = num votes for Nader
# a[31,2] + a[31,3] + a[31,4] + a[31,5]
#
# JACKSON COUNTY
# a[32,2] = num votes for Gore
# a[32,3] = num votes for Bush
# a[32,4] = num votes for Buchanan
# a[32,5] = num votes for Nader
# a[32,2] + a[32,3] + a[32,4] + a[32,5]
#
# JEFFERSON COUNTY
# a[33,2] = num votes for Gore
# a[33,3] = num votes for Bush
# a[33,4] = num votes for Buchanan
# a[33,5] = num votes for Nader
# a[33,2] + a[33,3] + a[33,4] + a[33,5]
#
# LAYFAYETTE COUNTY
# a[34,2] = num votes for Gore
# a[34,3] = num votes for Bush
# a[34,4] = num votes for Buchanan
# a[34,5] = num votes for Nader
# a[34,2] + a[34,3] + a[34,4] + a[34,5] 
#
# LAKE COUNTY
# a[35,2] = num votes for Gore
# a[35,3] = num votes for Bush
# a[35,4] = num votes for Buchanan
# a[35,5] = num votes for Nader
# a[35,2] + a[35,3] + a[35,4] + a[35,5] 
#
# LEE COUNTY
# a[36,2] = num votes for Gore
# a[36,3] = num votes for Bush
# a[36,4] = num votes for Buchanan
# a[36,5] = num votes for Nader
# a[36,2] + a[36,3] + a[36,4] + a[36,5] 
#
# LEON COUNTY
# a[37,2] = num votes for Gore
# a[37,3] = num votes for Bush
# a[37,4] = num votes for Buchanan
# a[37,5] = num votes for Nader
# a[37,2] + a[37,3] + a[37,4] + a[37,5]
#
# LEVY COUNTY
# a[38,2] = num votes for Gore
# a[38,3] = num votes for Bush
# a[38,4] = num votes for Buchanan
# a[38,5] = num votes for Nader
# a[38,2] + a[38,3] + a[38,4] + a[38,5]
#
# LIBERY COUNTY
# a[39,2] = num votes for Gore
# a[39,3] = num votes for Bush
# a[39,4] = num votes for Buchanan
# a[39,5] = num votes for Nader
# a[39,2] + a[39,3] + a[39,4] + a[39,5] 
#
# MADISON COUNTY
# a[40,2] = num votes for Gore
# a[40,3] = num votes for Bush
# a[40,4] = num votes for Buchanan
# a[40,5] = num votes for Nader
# a[40,2] + a[40,3] + a[40,4] + a[40,5]
#
# MANATEE COUNTY
# a[41,2] = num votes for Gore
# a[41,3] = num votes for Bush
# a[41,4] = num votes for Buchanan
# a[41,5] = num votes for Nader
# a[41,2] + a[41,3] + a[41,4] + a[41,5]
#
# MARION COUNTY
# a[42,2] = num votes for Gore
# a[42,3] = num votes for Bush
# a[42,4] = num votes for Buchanan
# a[42,5] = num votes for Nader
# a[42,2] + a[42,3] + a[42,4] + a[42,5]
#
# MARTIN COUNTY
# a[43,2] = num votes for Gore
# a[43,3] = num votes for Bush
# a[43,4] = num votes for Buchanan
# a[43,5] = num votes for Nader
# a[43,2] + a[43,3] + a[43,4] + a[43,5]
#
# MONROE COUNTY
# a[44,2] = num votes for Gore
# a[44,3] = num votes for Bush
# a[44,4] = num votes for Buchanan
# a[44,5] = num votes for Nader
# a[44,2] + a[44,3] + a[44,4] + a[44,5]
#
# NASSAU COUNTY
# a[45,2] = num votes for Gore
# a[45,3] = num votes for Bush
# a[45,4] = num votes for Buchanan
# a[45,5] = num votes for Nader
# a[45,2] + a[45,3] + a[45,4] + a[45,5]
#
# OKALOOSA COUNTY
# a[46,2] = num votes for Gore
# a[46,3] = num votes for Bush
# a[46,4] = num votes for Buchanan
# a[46,5] = num votes for Nader
# a[46,2] + a[46,3] + a[46,4] + a[46,5] 
#
# OKEECHOBEE COUNTY
# a[47,2] = num votes for Gore
# a[47,3] = num votes for Bush
# a[47,4] = num votes for Buchanan
# a[47,5] = num votes for Nader
# a[47,2] + a[47,3] + a[47,4] + a[47,5]
#
# ORANGE COUNTRY
# a[48,2] = num votes for Gore
# a[48,3] = num votes for Bush
# a[48,4] = num votes for Buchanan
# a[48,5] = num votes for Nader
# a[48,2] + a[48,3] + a[48,4] + a[48,5]
#
# OSCEOLA
# a[49,2] = num votes for Gore
# a[49,3] = num votes for Bush
# a[49,4] = num votes for Buchanan
# a[49,5] = num votes for Nader
# a[49,2] + a[49,3] + a[49,4] + a[49,5] 
#
# PALM.BEACH
# a[50,2] = num votes for Gore
# a[50,3] = num votes for Bush
# a[50,4] = num votes for Buchanan
# a[50,5] = num votes for Nader
# a[50,2] + a[50,3] + a[50,4] + a[50,5]
#
# PASCO
# a[51,2] = num votes for Gore
# a[51,3] = num votes for Bush
# a[51,4] = num votes for Buchanan
# a[51,5] = num votes for Nader
# a[51,2] + a[51,3] + a[51,4] + a[51,5] 
#
# PINELLAS
# a[52,2] = num votes for Gore
# a[52,3] = num votes for Bush
# a[52,4] = num votes for Buchanan
# a[52,5] = num votes for Nader
# a[52,2] + a[52,3] + a[52,4] + a[52,5] 
#
# POLK
# a[53,2] = num votes for Gore
# a[53,3] = num votes for Bush
# a[53,4] = num votes for Buchanan
# a[53,5] = num votes for Nader
# a[53,2] + a[53,3] + a[53,4] + a[53,5]
#
# PUTNAM
# a[54,2] = num votes for Gore
# a[54,3] = num votes for Bush
# a[54,4] = num votes for Buchanan
# a[54,5] = num votes for Nader
# a[54,2] + a[54,3] + a[54,4] + a[54,5]
#
# SANTA.RIOS
# a[55,2] = num votes for Gore
# a[55,3] = num votes for Bush
# a[55,4] = num votes for Buchanan
# a[55,5] = num votes for Nader
# a[55,2] + a[55,3] + a[55,4] + a[55,5] 
#
# SARASOTA
# a[56,2] = num votes for Gore
# a[56,3] = num votes for Bush
# a[56,4] = num votes for Buchanan
# a[56,5] = num votes for Nader
# a[56,2] + a[56,3] + a[56,4] + a[56,5]
#
# SEMINOLE
# a[57,2] = num votes for Gore
# a[57,3] = num votes for Bush
# a[57,4] = num votes for Buchanan
# a[57,5] = num votes for Nader
# a[57,2] + a[57,3] + a[57,4] + a[57,5] 
#
# ST.JOHNS
# a[58,2] = num votes for Gore
# a[58,3] = num votes for Bush
# a[58,4] = num votes for Buchanan
# a[58,5] = num votes for Nader
# a[58,2] + a[58,3] + a[58,4] + a[58,5] 
#
# ST.LUCIE
# a[59,2] = num votes for Gore
# a[59,3] = num votes for Bush
# a[59,4] = num votes for Buchanan
# a[59,5] = num votes for Nader
# a[59,2] + a[59,3] + a[59,4] + a[59,5] 
#
# SUMTER
# a[60,2] = num votes for Gore
# a[60,3] = num votes for Bush
# a[60,4] = num votes for Buchanan
# a[60,5] = num votes for Nader
# a[60,2] + a[60,3] + a[60,4] + a[60,5] 
#
# SUWANNEE
# a[61,2] = num votes for Gore
# a[61,3] = num votes for Bush
# a[61,4] = num votes for Buchanan
# a[61,5] = num votes for Nader
# a[61,2] + a[61,3] + a[61,4] + a[61,5]
#
# TAYLOR
# a[62,2] = num votes for Gore
# a[62,3] = num votes for Bush
# a[62,4] = num votes for Buchanan
# a[62,5] = num votes for Nader
# a[62,2] + a[62,3] + a[62,4] + a[62,5]
#
# UNION
# a[63,2] = num votes for Gore
# a[63,3] = num votes for Bush
# a[63,4] = num votes for Buchanan
# a[63,5] = num votes for Nader
# a[63,2] + a[63,3] + a[63,4] + a[63,5] 
#
# VOLUSIA
# a[64,2] = num votes for Gore
# a[64,3] = num votes for Bush
# a[64,4] = num votes for Buchanan
# a[64,5] = num votes for Nader
# a[64,2] + a[64,3] + a[64,4] + a[64,5]
#
# WAKULLA
# a[65,2] = num votes for Gore
# a[65,3] = num votes for Bush
# a[65,4] = num votes for Buchanan
# a[65,5] = num votes for Nader
# a[65,2] + a[65,3] + a[65,4] + a[65,5]
#
# WALTON
# a[66,2] = num votes for Gore
# a[66,3] = num votes for Bush
# a[66,4] = num votes for Buchanan
# a[66,5] = num votes for Nader
# a[66,2] + a[66,3] + a[66,4] + a[66,5] 

# WASHINGTON
# a[67,2] = num votes for Gore
# a[67,3] = num votes for Bush
# a[67,4] = num votes for Buchanan
# a[67,5] = num votes for Nader
# a[67,2] + a[67,3] + a[67,4] + a[67,5]

#####################################################################
## CODE
#####################################################################
## change to local working directory
getwd()
setwd("/Users/jeffstefan/flVote")
# load ggplot2
library(ggplot2)
# load igraph
library(igraph)
## Get data from web - this contains extra fields and needs to be cleaned
#fVote = read.table("http://faculty.washington.edu/tlumley/data/FLvote.dat",header=TRUE)
###################################
# Graph prep info
###################################
## Vector for Y axis for bar charts: range from 0 to 50K in 5K increments
vectorYBar <- c(0,5000, 10000, 15000, 20000, 25000, 30000, 35000, 40000, 50000)
## Read data from local repo into variable a with header
## File contains data for Gore, Bush, Buchanan and Nader only
a <- read.csv("flVotesCSV2.csv", header=TRUE)
## check out a
#a <- fVote
## list counties (display col)
a[,1] # displays the first col as a list
a[1,1] # shows the first line but is abbreviated
####################################
## store candiates total votes
####################################
# Al Gore
a[,2]
alGore <- a[,2]
# show
alGore

# George Bush
a[,3]
geoBush <- a[,3]
# show
geoBush

# Pat Buchanan
a[,4]
patBuchanan <- a[,4]
# show
patBuchanan

# Ralph Nader
a[,5]
ralphNader <- a[,5]
# show
ralphNader

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
# put into unsorted vector and show
sumUnsorted <- c(sumGore, sumBush, sumBuchanan, sumNader)
sumUnsorted
# put into sorted vector and show
sumSorted <- sort(sumUnsorted,decreasing=T)
sumSorted

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
sdNader

##########################################################
# test code
##########################################################
# Produce a bubble chart with sumSorted
# order is Bush, Gore, Nader, Buchanan
size <- abs(sumSorted)/sqrt(pi)
size
par(bg='cornsilk')
# plot the bubble chart
symbols(sumSorted,circles=size,fg="tan4",bg='orange2',main='2000 Florida Presidental Election',xlab='Candidates',ylab='Votes')
candidates <- c("Gore","Bush","Nader","Buchanan")
# help for symbols
#?symbols
