### ANOVA
library(SixSigma)
data=ss.data.strings
boxplot(power~type,data=data)
model.power=lm(power~type,data=data)
summary(model.power)
str(data)
anova(model.power)
##Ho: are means are equal
##Ha: at least onw mean differs from the others
## Pvalue < alpha (0.05) then reject Ho
confint(model.power)
