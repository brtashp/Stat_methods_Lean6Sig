# Cause and effect Diagram

# Events that can cause a delay in the schedule:
# weather, errors in planning, delay of suppliers, inadequate operators, 
# customer specifications/delays, defects in materials, and permissions

b.effect="Delay"
b.groups=c("Personnel","Weather", "Suppliers", "Planning")
b.causes=vector(mode="list",length = length(b.groups))
b.causes[1]=list(c("Training","Inadequate"))
b.causes[2]=list(c("Rain","Temperature","Wind"))
b.causes[3]=list(c("Materials","Delays","Rework"))
b.causes[4]=list(c("Customer","Permissions","Errors"))
library(SixSigma)
ss.ceDiag(b.effect,b.groups,b.causes,sub="Construction Project")
#########################################################
## Pareto Chart
b.data=data.frame(cause=factor(unlist(b.causes)),
                  count=c(5,1,3,1,2,18,20,4,15,2,4),
                  cost=c(50,150,50,10,20,180,200,10,5,20,150))

pchart=barplot(rev(sort(b.data$count)),
               names.arg=b.data$cause[order(b.data$count,decreasing=TRUE)],
               las=2)
text(pchart, rep(0.5,11),
     sort(round(cumsum(100*(b.data$count/sum(b.data$count))
          [order(b.data$count,decreasing=TRUE)]),1)))

library(qcc)
b.vector=b.data$count
names(b.vector)=b.data$cause
pareto.chart(b.vector,cumperc=c(80))

require(qualityTools)
paretoChart(b.vector,las=2,percentVec=c(0,0.5,0.8,1))
