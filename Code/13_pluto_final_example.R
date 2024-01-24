setwd("~/Documents/lectures_and_seminars/images")

library(terra)
library(imageRy)
library(viridis)

pluto <- rast("pluto_New_Horizons_spacecraft.png")
plot(pluto)
plotRGB(pluto, 3, 2, 1)
plutovar <- focal(pluto, matrix(1/25, 5, 5), fun=sd)

viridisc <- colorRampPalette(viridis(7))(255)
plot(plutovar[[1]], col=viridisc)

makoc <- colorRampPalette(mako(7))(255)
plot(plutovar[[1]], col=makoc)

par(mfrow=c(1,2))
plot(pluto)
plotRGB(pluto, 3, 2, 1)
plot(plutovar[[1]], col=viridisc)
plot(plutovar[[1]], col=makoc)
