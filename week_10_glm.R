rm(list=ls())
fs=read.csv("vnfs_treemap.csv")
library(effects)
library(emmeans)
library(ggplot2)
library(epitools)
library(MASS)
library(DHARMa)


#####GLM PLAYING FOR MY REFRENCE)######
lme1.1 <- glm(SQUR~TPA_DEAD, family=binomial(link="logit"), fs)
summary(lme1.1)

#presence of squirrel by canopy height
lme1.2 <- glm(SQUR~STANDHT, family=binomial(link="logit"), fs)
summary(lme1.2)

spruce <- subset(fs,ForTypName=="Red spruce")


lme1.3 <- glm(SQUR~STANDHT, family=binomial(link="logit"), spruce)
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





###### HW 10 ##########
#variables I want to look at. 

lme1.8 = glm(SQUR~STANDHT + BALIVE + ASPECT + ELEV + LFI + CLASS  + SLOPE + DRYBIO_D, family=binomial(link="logit"), spruce2)
summary(lme1.8)












