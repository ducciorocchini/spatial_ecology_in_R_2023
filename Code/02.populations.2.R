# Code related to population ecology

# A package is needed for point pattern analysis
install.packages("spatstat")
library(spatstat)

# let's use the bei data:
# data description:
# https://CRAN.R-project.org/package=spatstat

bei

# plotting the data
plot(bei)

# changing dimension - cex
plot(bei, cex=.2)

# changing the symbol - pch
plot(bei, cex=.2, pch=19)

# additional datasets
bei.extra
plot(bei.extra)

# let's use only part of the dataset: elev
plot(bei.extra$elev)
elevation <- bei.extra$elev
plot(elevation)

# second method to select elements
elevation2 <- bei.extra[[1]]
plot(elevation2)

# passing from points to a countinuous surface
densitymap <- density(bei)
plot(densitymap)
points(bei, cex=.2)

cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(100)
plot(densitymap, col=cl)

cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(4)
plot(densitymap, col=cl)

clnew <- colorRampPalette(c("dark blue", "blue", "light blue"))(100)
plot(densitymap, col=clnew)

plot(bei.extra)

elev <- bei.extra[[1]] # bei.extra$elev
plot(elev)

# multiframe
par(mfrow=c(1,2))
plot(densitymap)
plot(elev)

par(mfrow=c(2,1))
plot(densitymap)
plot(elev)

par(mfrow=c(1,3))
plot(bei)
plot(densitymap)
plot(elev)












