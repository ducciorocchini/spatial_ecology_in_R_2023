# uinstall.pcakages("spatstat")
library(spatstat)

bei 
plot(bei) 
plot(bei, pch=19, cex=.5) 

bei.extra
plot(bei.extra)
plot(bei.extra[[1]])

plot(bei.extra[[1]])
plot(bei, pch=19, cex=.5, add=T) 

density_map <- density(bei)

par(mfrow=c(2,1))
plot(bei.extra[[1]])
plot(density_map)
