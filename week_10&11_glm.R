rm(list=ls())
fs=read.csv("vnfs_treemap.csv")
library(effects)
library(emmeans)
library(ggplot2)
library(epitools)
library(MASS)
library(DHARMa)
library(AICcmodavg)
library(reshape2)
library(tidyverse)
library(caret)
library(leaps)
library(pROC)







###### HW 10 ##########

### comment NAL: don't forget to say what hypothesis you're testing in your code (:
    ## everything else is wonderful! excellent job Tanner

####maybe that was too much for this assignment####
####real homework 10&11####

#add
lme1.10 = glm(SQUR~STANDHT+ CLASS, family=binomial(link="logit"), fs)
summary(lme1.10)

#inter
lme1.11 = glm(SQUR~STANDHT* CLASS, family=binomial(link="logit"), fs)
summary(lme1.11)


dat.new=expand.grid(STANDHT=seq(from = min(fs$STANDHT),
                             to = max(fs$STANDHT),length.out = 100),
                    CLASS = unique(fs$CLASS))
dat.new
predict(lme1.10,newdata = dat.new)

dat.new$yhat  = predict(lme1.10,type="response",newdata = dat.new)
fs$yhat2 = predict(lme1.10,type="response")
head(dat.new)

emmeans(lme1.10, pairwise~STANDHT+CLASS)
emmeans(lme1.10, pairwise~STANDHT+CLASS, type="response")
#squirel probability at 66.6ft in classes high and medium are 95% and 92% respectively. 
head(fs)

plot1=ggplot(data=fs,aes(x=STANDHT,y=SQUR,color=CLASS))+
  geom_point(size=2,shape =1) +
  geom_line(data=dat.new, aes(x=STANDHT,y=yhat,col = CLASS))

plot1

#High spruce will have the highest predictability for squirrels when using stand height. 

####WEEK 11####
#####Likelihood ratio test#####

#library(LRTesteR) #didnt work
library(lmtest) #if mine does not look like code it is because i am following instructions given on the lmtest package documentaion. 

##Hypothesis the nested formula will be improved with the addition of stand height and basal area
head(fs)

l1 = glm(SQUR~ELEV+LFI+ELEV *LFI + CLASS, family=binomial(link="logit"), fs)
l2 = glm(SQUR~ELEV+LFI+ELEV *LFI + CLASS + STANDHT, family=binomial(link="logit"), fs)
l3 = glm(SQUR~ELEV+LFI+ELEV *LFI + CLASS + BALIVE , family=binomial(link="logit"), fs)
l4 = glm(SQUR~ELEV+LFI+ELEV *LFI + CLASS +STANDHT +BALIVE, family=binomial(link="logit"), fs)
summary(l4)
#testing the nested model against the addition of STANDHT
lrtest(l1,l2)
#looks like stand height alone is not a significant addition 
 
#Testing the nested model against the addition of basal area
lrtest(l1,l3)
#looks like basal area is a significant addition to the model

#testing the nested adding basal area to the nested model and testing it against the addition of stand height
lrtest(l3,l4)
#seems the the addition of stand height and basal area are most significant 
#lets test the new model against the original nested model
lrtest(l1,l4)
lrtest(l2,l4)
#the new model seems to be most significant
#Finally lets test for interaction
l5 = glm(SQUR~STANDHT*BALIVE, family=binomial(link="logit"), fs)
summary(l5)
#This interaction seems to be a significant predictor of squirrels, lets test it against the model. 
l6 = glm(SQUR~ELEV+LFI+ELEV *LFI + CLASS +STANDHT +BALIVE + STANDHT * BALIVE, family=binomial(link="logit"), fs)

lrtest(l4,l6)
#the addition of the interaction was not significant, lets test the removal of the BALIVE + STANDHT against the current best model 
l7= glm(SQUR~ELEV+LFI+ELEV *LFI + CLASS  + STANDHT * BALIVE, family=binomial(link="logit"), fs)
lrtest(l4,l7)
# Not significant 
#According to the LR test the best mdoel for prediction squirrel height is the original model with the addition of stand height and basal area. 
#reject the null (the original model is best), accept the alternative (the addition of stand height and basal area is best at predicting squirrel presence).

####AIC####

#same models as before for continuity and learning sake, feel free to check the playing session to see how work towards my publication is going!
#Hypothesis: model L4 will have the lowest AIC score being the most parsimonious accurate prediction. 
l1 = glm(SQUR~ELEV+LFI+ELEV *LFI + CLASS, family=binomial(link="logit"), fs)
l2 = glm(SQUR~ELEV+LFI+ELEV *LFI + CLASS + STANDHT, family=binomial(link="logit"), fs)
l3 = glm(SQUR~ELEV+LFI+ELEV *LFI + CLASS + BALIVE , family=binomial(link="logit"), fs)
l4 = glm(SQUR~ELEV+LFI+ELEV *LFI + CLASS +STANDHT +BALIVE, family=binomial(link="logit"), fs)
AIC(l1,l2,l3,l4)
#looks like l4 (best model from earlier) is most parsimonious, lets check the table.
aictab(cand.set=list(l1,l2,l3,l4),modnames=c("l1", "l2", "l3", "l4"), second.ord = F)#AIC table
#l4 is the most parsimonious by 19.10 AIC value (only need 2 AIC value to be considered more parsimonious than the closest model).
#
#####playing#####

#same glm but with whole data frame

lme1.00 =glm(SQUR~1,family=binomial(link="logit"), fs)
summary(lme1.00)
lme1.9 = glm(SQUR~ELEV+LFI+ELEV *LFI + CLASS, family=binomial(link="logit"), fs)
summary(lme1.9)
lme1.9.1 = glm(SQUR~STANDHT + BALIVE +ELEV+LFI+ ELEV* LFI + CLASS  , family=binomial(link="logit"), fs)
summary(lme1.9.1)
lme1.9.2 = glm(SQUR~STANDHT +ELEV+LFI+ ELEV * LFI + CLASS   , family=binomial(link="logit"), fs)
summary(lme1.9.2)
lme1.9.3 = glm(SQUR~ BALIVE +ELEV+LFI+ ELEV * LFI + CLASS   , family=binomial(link="logit"), fs)
summary(lme1.9.3)
lme1.9.4 = glm(SQUR~STANDHT + BALIVE +ELEV+LFI+ ELEV * LFI + CLASS + TPA_LIVE + TPA_DEAD, family=binomial(link="logit"), fs)
summary(lme1.9.4)
lme1.9.5 = glm(SQUR~STANDHT + BALIVE +ELEV+LFI+ ELEV * LFI + CLASS  + TPA_DEAD, family=binomial(link="logit"), fs)
summary(lme1.9.5)
lme1.9.6 = glm(SQUR~STANDHT + BALIVE +ELEV+LFI+ ELEV * LFI + CLASS  + TPA_LIVE, family=binomial(link="logit"), fs)
summary(lme1.9.5)

AIC(lme1.00, lme1.9, lme1.9.1, lme1.9.2, lme1.9.3, lme1.9.4, lme1.9.5,lme1.9.6 )


aictab(cand.set=list(lme1.00, lme1.9, lme1.9.1, lme1.9.2, lme1.9.3, lme1.9.4, lme1.9.5,lme1.9.6 ),modnames=c("lme1.00", "lme1.9", "lme1.9.1", "lme1.9.2", "lme1.9.3", "lme1.9.4", "lme1.9.5","lme1.9.6" ), second.ord = F)#AIC table

models <- regsubsets(SQUR~STANDHT + BALIVE + ELEV * LFI + CLASS   + TPA_LIVE + TPA_DEAD, data = fs, nvmax = 11)
summary(models)


# predicted data
best_prediction <- predict(lme1.9.1, fs, 
                      type="response")

og_prediction = predict(lme1.9, fs, 
                        type="response")

second_prediction = predict(lme1.9.5, fs, 
                  type="response")

# create roc curve
best_roc_object <- roc(fs$SQUR, best_prediction)

og_roc_object = roc(fs$SQUR, og_prediction)

second_roc_object = roc(fs$SQUR, second_prediction)
# calculate area under curve
auc(best_roc_object)
auc(og_roc_object)
auc (second_roc_object)
##start at 8
#testing for correlation between variables 
paDEAD= cor(fs$BALIVE, fs$TPA_DEAD, method="pearson")
paDEAD


paLIVE= cor(fs$BALIVE, fs$TPA_LIVE, method="pearson")
paLIVE

paTPA= cor(fs$TPA_LIVE, fs$TPA_DEAD, method="pearson")
paTPA



##run fold stuffs 