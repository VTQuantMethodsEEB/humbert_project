rm(list=ls()) # clears workspace


#hypothesis: There is a difference between the mean snags per acre for squirrels and random points. 
fs=read.csv("vnfs_treemap.csv")
group=fs%>%group_by(ID,TYPE,KIND)%>%summarise(avg_dead=mean(TPA_DEAD,na.rm=T))

set.seed(101)



res=na

comb_BDTR = c(BOX,DEN,TELEM,RANDOM)
sample(comb_BDTR,4,replace=F)


for (i in 1:10000) {vnfsboot=sample(c(BOX,DEN,TELEM,RANDOM))}






