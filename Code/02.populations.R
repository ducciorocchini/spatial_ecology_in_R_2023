# uinstall.pcakages("spatstat")
library(spatstat)
library(terra)

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

bei.rast <- rast(bei.extra[[1]])
density.rast <- rast(density_map)

randompoints <- spatSample(bei.rast, 100, "random", as.points = TRUE)
bei.points <- terra::extract(bei.rast, randompoints)
density.points <- terra::extract(density.rast, randompoints)
 
pointmaps <- data.frame(bei.points[1:2], density.points[2])

names(pointmaps)

attach(pointmaps)
plot(lyr.1, lyr.1.1)
