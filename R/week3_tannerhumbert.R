rm(list=ls()) # clears workspace


library(tidyverse)
library(ggplot2)
library(gridExtra)
library(viridis)

fs=read.csv("vnfs_treemap.csv")


head(fs)



ggplot(data=fs,aes(x=KIND,y=ELEV, color=KIND))+geom_point(size=2)

g2=ggplot(data=fs,aes(x=KIND,y=ELEV, color=KIND))+geom_point(size=2)
g2


g2=ggplot(data=fs,aes(x=KIND,y=ELEV, color=KIND))+geom_boxplot()


g2=ggplot(data=fs,aes(x=KIND,y=ELEV, color=KIND))+geom_boxplot()+geom_point(aes(color=KIND))
g2
#I am trying to demonstrate the elevation selection of the different forest types in my study (spruce is selecting higher elevations). 
g1=ggplot(data=fs,aes(x=TYPE,y=ELEV,color=TYPE)) + geom_boxplot()+geom_point(aes(color=TYPE))
g1
#Now I am looking at the relationship between point type (squirrel point vs random point) and elvation. The graph is showing that squirrels are selecting for higher elevation sites.  
  
  
g3=ggplot(data=fs,aes(x=TYPE,y=KIND,color=TYPE)) + geom_boxplot()+geom_point(aes(color=TYPE))
g3 
# I don't know what the hell I did but here it is for your enjoyment. 
 g4=ggplot(data=fs,aes(x=TYPE,y=ASPECT,color=TYPE)) + geom_boxplot()+geom_point(aes(color=TYPE))
g4  
#seems to be another data issue.

g5=ggplot(data=fs,aes(x=TYPE,y=LFI,color=TYPE)) + geom_boxplot()+geom_point(aes(color=TYPE))
g5
# I guess this shows no desernable difference in the landofrom index selected by squirrels and what was observed at random points. 
g6=ggplot(data=fs,aes(x=KIND,y=ASPECT,color=KIND)) + geom_boxplot()+geom_point(aes(color=KIND)) 
g6  
  


g7=ggplot(data=fs,aes(x=TYPE,y=TPA_DEAD,color=TYPE)) + geom_boxplot()+geom_point(aes(color=TYPE)) 
g7  


g8=ggplot(data=fs,aes(x=TYPE,y=TPA_LIVE,color=TYPE)) + geom_boxplot()+geom_point(aes(color=TYPE)) 
g8  


g9=ggplot(data=fs,aes(x=TYPE,y=BALIVE,color=TYPE)) + geom_boxplot()+geom_point(aes(color=TYPE)) 
g9  


g10=ggplot(data=fs,aes(x=TYPE,y=STANDHT,color=TYPE)) + geom_boxplot()+geom_point(aes(color=TYPE)) 
g10  


 


































































