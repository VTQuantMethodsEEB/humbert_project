rm(list=ls())
fs=read.csv("vnfs_treemap.csv")
#lets see if I got this whole hypothesis thing down.
#Hypothesis 1 elevation will be positively correlated with basal area.
Mod1= lm(ELEV ~ BALIVE, data=fs)
summary(Mod1)
plot(Mod1)
#
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

library(performance)

l1 <- lm(ELEV~BALIVE, data = fs)

check_model(l1)

resid(l1)
hist(resid(l1))
#residuals are normally distributed!!!!!

shapiro.test((resid(l1)))
#it is significant (does it matter? I am still confused)




