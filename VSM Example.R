# VSM
library(SixSigma)
inputs=c("Ingredients","Cook","Oven","Plates")
outputs=c("Temperature","Taste","Tenderness","Weight","Radius","Time")
steps=c("DOUGH","TOPPINGS","BAKE","DELIVER")

# Then we save the names of the outputs of each step in lists
# create first the list object
# The outputs of a step are the inputs of what follows:

io=list()
io[[1]]=list("X's")
io[[2]]=list("Dough","Ingredients","Cooker")
io[[3]]=list("Raw Pizza","Cooker","Oven Plate")
io[[4]]=list("Baked Pizza","Plates")

# Finally, we save the names, parameter types, and features:
param=list()  
param[[1]]=list(c("Cook","C"),c("flour brand","C"),c("prop Water","P"))
param[[2]]=list(c("Cook","C"),c("Eng. Brand","Cr"),c("amount","P"),c("prep.Time","Cr"))
param[[3]]=list(c("Cook","C"),c("queue","N"),c("BakeTime","Cr"))
param[[4]]=list(c("Waiter","C"),c("queue","N"))

feat=list()
feat[[1]]=list("Density","Toughness","Thickness")
feat[[2]]=list("Diameter", "Weight","Thickness")
feat[[3]]=list("Temperature","Tenderness","Taste")
feat[[4]]=list("Temperature","Taste","Tenderness","Weight","Radius")

ss.pMap(steps,inputs,outputs,io,param,feat,sub="Pizza Process Project")
