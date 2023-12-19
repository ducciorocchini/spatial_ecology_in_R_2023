# measuring variability from RS imagery

library(terra)
library(imageRy)
library(viridis)

im.list()

sent <- im.import("sentinel.png")

im.plotRGB(sent, 1, 2, 3)

nir <- sent[[1]]

# calculation
sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)

viridis <- colorRampPalette(viridis(7))(255)
plot(sd3, col=viridis)

# stacking nir and sd
stacknv <- c(nir, sd3)
plot(stacknv, col=viridis)

# change the moving window
sd5 <- focal(nir, matrix(1/25, 5, 5), fun=sd)
stacknv <- c(nir, sd3, sd5)
plot(stacknv, col=viridis)

# change the moving window
sd7 <- focal(nir, matrix(1/49, 7, 7), fun=sd)
stacknv <- c(nir, sd3, sd5, sd7)
plot(stacknv, col=viridis)
