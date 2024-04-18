rm(list=ls()) # clears workspace

install.packages("dplyr")
library(dplyr)
#hypothesis: There is a difference between the mean snags per acre for squirrels and random points. 
fs=read.csv("vnfs_treemap.csv")

spruce <- subset(fs,ForTypName=="Red spruce")

spruce2 <- subset(fs,FldTypName=="Red spruce")






set.seed(101)



res = rep(NA,10000)





# Bootstrap loop
for (i in 1:10000) {
  fsboot_indices <- sample(1:nrow(spruce), replace = TRUE)
  sqboot <- spruce$TPA_DEAD[fsboot_indices[spruce$SQUR[fsboot_indices] == 1]]
  rnboot <- spruce$TPA_DEAD[fsboot_indices[spruce$SQUR[fsboot_indices] == 0]]
  res[i] <- mean(rnboot) - mean(sqboot)  
}

# Observed difference
obs <- mean(rnboot) - mean(sqboot)








obs = mean(rnboot) - mean(sqboot)
obs

hist(res,col="gray",las=1,main="")
abline(v=obs,col="red")



res[res>=obs]
length(res[res>=obs])
mean(res>=obs)  

#according to the p value (bullshit) there is no significant difference between the presence of snags at squirrel sites and random points

#ttest

#Hypothesis: squirrels are selecting sites with high density of snags
sq_test=t.test(sqboot)
sq_test
#this says: My bootstrapped resampled squirrel values are significantly different from 0
#so the test does not match the hypothesis

rn_test=t.test(rnboot)
rn_test
#snags are correlated to squirrel presence 
#this says: My bootstrapped resampled rn values are significantly different from 0
#so the test does not match the hypothesis


#hypothesis: 

#KL these are not tests and so the assignment was to use one of the tests we discussed

#dead trees per acre by squirrel presence.
#KL - this isn;t written as a hypothesis 
#this says : the presence/absence of squirrels is predicted by dead trees per acre
lme1.1 <- glm(SQUR~ BALIVE + CLASS, family=binomial(link="logit"), fs)
summary(lme1.1)

#presence of squirrel by canopy height
lme1.2 <- glm(SQUR~STANDHT+CLASS, family=binomial(link="logit"), fs)
summary(lme1.2)

 spruce <- subset(fs,ForTypName=="Red spruce")

 
 lme1.3 <- glm(SQUR~STANDHT, family=binomial(link="logit"), fs)
 summary(lme1.3)
 
 
 lme1.4 <- glm(SQUR~TPA_DEAD, family=binomial(link="logit"), spruce)
 summary(lme1.4)
 
 spruce2 <- subset(fs,FldTypName=="Red spruce")
 
 lme1.5 <- glm(SQUR~STANDHT, family=binomial(link="logit"), spruce2)
 summary(lme1.5)
 
 #squirrel presence by dead biomass
 lme1.6 <- glm(SQUR~DRYBIO_D, family=binomial(link="logit"), spruce2)
 summary(lme1.6)
 
 #squirrel presence by dead trees per acre + dead biomass
 lme1.7 <- glm(SQUR~TPA_DEAD + DRYBIO_D, family=binomial(link="logit"), spruce2)
 summary(lme1.7)
 
 #need to AIC and R^2 for models.
 