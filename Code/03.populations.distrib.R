# Why populations disperse over the landscape in a certain manner?

library(sdm)
library(terra)

file <- system.file("external/species.shp", package="sdm")

rana <- vect(file)
rana$Occurrence

plot(rana)

# Selecting presences
pres <- rana[rana$Occurrence==1,]
plot(pres)

# exercise: select absence and call them abse
abse <- rana[rana$Occurrence==0,]
plot(abse)

# exrecise: plot presences and absences, one beside the other




