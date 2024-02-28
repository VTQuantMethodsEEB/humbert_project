#3
Q=qnbinom(p=.85, mu=300,size=1)
hist(Q)
Q


#4
?rpois

x=ppois(12, lambda=10)
X= 1-x
hist(x) ######square
X

#1 use for count data
?rpois
borned=rpois(500, lambda=4)
borned
sum(borned)
live=rbinom(prob=.8, n=500, size=borned)
live
sum(live)
dead= borned-live
dead
sum(dead)

#2 use for yes or no, 1 or 0...
survived=rbinom(prob=.98,n=1000, size=1)
survived
sumsur=sum(survived)
sprot=rbinom(prob=.01,n=sumsur, size=1)
sprot
sumsprot=sum(sprot)
sumsprot
