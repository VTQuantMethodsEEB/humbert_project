rm(list=ls()) # clears workspace

#play data
#example with directory

#example of read.csv with directory
#dm=read.csv("/Users/klangwig/Desktop/VT/teaching/quant grad course/github/klangwig/bat_data.csv")
fs=read.csv("C:/Users/tanne/Downloads/quan methods/Real Data/FlyingSquirrel.csv")
#this file is in my project folder so I can read it in without calling the directory
#dm=read.csv("bat_data.csv")
#you will need to change this to match your director


#view the data
View(fs)

#look at the first 5 rows
head(fs)

#explore the structure of different colunmns
str(fs$SEX) #character
str(fs$ASPECT) #number
str(fs$FOREST) #character

#dataframe dimensions
dim(fs)
#3808 rows, 17 columns

###selecting things###
#use square brackets

dim(fs[fs$SEX=="M",])

#look at the column in View
View(fs[fs$SEX=="F",])

#this gives you all the values where species is MYSE and the site is Horseshoe Bay
fs[fs$TYPE=="DEN"&fs$SEX=="M",]
#there are only 4 observations of MYSE at Horshoeshoe Bay

#43 den observations contained a male 

#compare this with or which is the | symbol (that a straight line, not an I)
fs[fs$TYPE=="DEN" | fs$FOREST=="HIGH",]
#there are many more observations including all the species

#summary
summary(fs)

#add a column
fs$log_ASPECT = log10(fs$ASPECT)

#make sure the column has added
head(fs)
#why are there NAs? Because you can't log a negative value!

#always check the dimensions when adding a column
dim(fs)
#yes - now there are 12 columns

#sometimes you might want to remove all the NAs from you dataframe
#install package example - can also use console tab at right - 'Packages'
#install.packages("tidyverse")

#need to load the package after installing
library(tidyverse)
#make a new dataframe with NAs removed from the loads column
fs.new = fs %>%
  





  #here I am using tidyverse to do this
  #this symbol is called a pipe
  #we will talk more about this next week
drop_na(log_ASPECT)

#aggregate
f1 = aggregate(log_ASPECT~TYPE+SEX, FUN = mean, data = fs.new)
print(f1)

