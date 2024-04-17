####HW####
rm(list=ls())
fs=read.csv("vnfs_treemap.csv")
#lets see if I got this whole hypothesis thing down.
#Hypothesis 1 elevation will be positively correlated with basal area.
Mod1= lm(ELEV ~ BALIVE, data=fs)
summary(Mod1)
plot(Mod1)
#see check model
mod2 <- lm(SQUR ~ ., data=fs)
summary(mod2)

head(fs)
library(ggplot2)
r=ggplot(data=fs, aes(x=BALIVE, y=ELEV))+ 
  geom_point()+
  stat_smooth(method = "lm")+
  theme_bw() + 
  theme(axis.title=element_text(size=20),axis.text=element_text(size=10),panel.grid = element_blank(), axis.line=element_line(),legend.position="top",legend.title=element_blank())
print(r)
#data is tall but fairly distributed 
library(performance)

l1 <- lm(ELEV~BALIVE, data = fs)

par(mfrow=c(2,2)) 
plot(l1)

check_model(l1)
### comment NAL: It looks like your scale-location plot is not horizontal, meaning your residuals are not equally spread along the range of predictors!
# Also some deviation from the line in your Q-Q plot. 

#All assumptions seem to be met.
resid(l1)
hist(resid(l1))
#residuals are normally distributed!!!!!

shapiro.test((resid(l1)))
#it is significant (does it matter? I am still confused)
### comment NAL: If the Sig. value of the Shapiro-Wilk Test is greater than 0.05, the data is normal. 
# If it is below 0.05, the data significantly deviate from a normal distribution.


###week 8 
library(effects)
library(emmeans)
library(multcompView)
library(multcomp)

pr <- function(m) printCoefmat(coef(summary(m)),
                               digits=3,signif.stars=FALSE)




#Squirrel presence will increase with the with interaction of forest type(spruce) and canopy height.
lmLC <- lm(SQUR~KIND*STANDHT, data=fs)
summary(lmLC)

#### Comment NAL: To check out the effects of other "Kind" you could do a relevel command or an effects plot
library(effects)
plot(allEffects(lmLC))


#Making the new data frame!
new.dat.combos = with(fs, 
                       expand.grid(KIND=unique(KIND), 
                                   STANDHT=seq(min(STANDHT),max(STANDHT), by=1)))
#Prediction of stand heights based on the interaction between squirrels and spruce stand type. 
new.dat.combos$SQUR = predict(lmLC,newdata=new.dat.combos)

#Plotting flat predictions
ggplot(new.dat.combos,aes(x=STANDHT,y=SQUR,colour=KIND))+ 
  geom_line(aes(group=KIND))+ 
  geom_point(data=fs, aes(x=STANDHT,y=SQUR,colour = KIND)) 


#There are more squirrels in spruce or conifer systems at 37 ft than in any other system at any other height. 

#Plotting predictions with smooth lines 
s=ggplot(fs,aes(x=STANDHT,y= SQUR,colour=KIND))+  geom_smooth(method = "glm", method.args = list(family = "binomial")) + geom_point(data=fs) 

s
###EXPLINATION: The correlation with a spruce component stand height, predicts squirrel presence in stands containing conifers at 25-50 ft and decreasing there after.

##ADDITIVE
#

pr(lmTL1 <- lm(SQUR~KIND+STANDHT,data=fs))
#

#plot it

pp <- with(fs,expand.grid(KIND=unique(KIND),STANDHT=unique(STANDHT)))
pp$SQUR <- predict(lmTL1,newdata=pp)

ggplot(fs,aes(x=STANDHT,y=SQUR,colour=KIND))+
  geom_point()+
  geom_line(data=pp,aes(group=KIND))
### my additive model shows supports my hypothesis in that squirrels will be more present in spruce conditions, but does not support my claim that presence will increase with height.  




###### PLAYING #######
###class
lmLS <- lm(SQUR~CLASS*STANDHT, data=fs)
summary(lmLS)####

#Making the new data frame!
new.dat.combos2 = with(fs, 
                      expand.grid(CLASS=unique(CLASS), 
                                  STANDHT=seq(min(STANDHT),max(STANDHT), by=1)))
#Prediction of stand heights based on the interaction between squirrels and spruce abundance. 
new.dat.combos2$SQUR = predict(lmLS,newdata=new.dat.combos)


sq=ggplot(fs,aes(x=STANDHT,y= SQUR,colour=CLASS))+  geom_smooth(method = "glm", method.args = list(family = "binomial")) + geom_point(data=fs) 

sq

####class by basal area

lmLS1 <- lm(SQUR~CLASS*BALIVE, data=fs)
summary(lmLS1)####

#Making the new data frame!
new.dat.combos3 = with(fs, 
                       expand.grid(CLASS=unique(CLASS), 
                                   BALIVE=seq(min(BALIVE),max(BALIVE), by=1)))
#Prediction of stand heights based on the interaction between squirrels and spruce abundance. 
new.dat.combos3$SQUR = predict(lmLS1,newdata=new.dat.combos)


sq1=ggplot(fs,aes(x=BALIVE,y= SQUR,colour=CLASS))+  geom_smooth(method = "glm", method.args = list(family = "binomial")) + geom_point(data=fs) 

sq1

#class by dry bio D

lmLS3 <- lm(SQUR~CLASS*DRYBIO_D, data=fs)
summary(lmLS3)####

#Making the new data frame!
new.dat.combos3 = with(fs, 
                       expand.grid(CLASS=unique(CLASS), 
                                   DRYBIO_D=seq(min(DRYBIO_D),max(DRYBIO_D), by=1)))
#Prediction of stand heights based on the interaction between squirrels and spruce abundance. 
new.dat.combos3$SQUR = predict(lmLS3,newdata=new.dat.combos)


sq3=ggplot(fs,aes(x=DRYBIO_D,y= SQUR,colour=CLASS))+  geom_smooth(method = "glm", method.args = list(family = "binomial")) + geom_point(data=fs) 

sq3

#tpa by class

lmLS4 <- lm(SQUR~CLASS*TPA_LIVE, data=fs)
summary(lmLS4)####

#Making the new data frame!
new.dat.combos4 = with(fs, 
                       expand.grid(CLASS=unique(CLASS), 
                                   TPA_LIVE=seq(min(TPA_LIVE),max(TPA_LIVE), by=1)))
#Prediction of stand heights based on the interaction between squirrels and spruce abundance. 
new.dat.combos4$SQUR = predict(lmLS4,newdata=new.dat.combos)


sq4=ggplot(fs,aes(x=TPA_LIVE,y= SQUR,colour=CLASS))+  geom_smooth(method = "glm", method.args = list(family = "binomial")) + geom_point(data=fs) 

sq4

#TPA DEAD by class

lmLS5 <- lm(SQUR~CLASS*TPA_DEAD, data=fs)
summary(lmLS5)####

#Making the new data frame!
new.dat.combos5 = with(fs, 
                       expand.grid(CLASS=unique(CLASS), 
                                   TPA_DEAD=seq(min(TPA_DEAD),max(TPA_DEAD), by=1)))
#Prediction of stand heights based on the interaction between squirrels and spruce abundance. 
new.dat.combos5$SQUR = predict(lmLS5,newdata=new.dat.combos)


sq5=ggplot(fs,aes(x=TPA_DEAD,y= SQUR,colour=CLASS))+  geom_smooth(method = "glm", method.args = list(family = "binomial")) + geom_point(data=fs) 

sq5


