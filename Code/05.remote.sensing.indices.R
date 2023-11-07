# Indices derived from RS imagery

library(imageRy) # beloved package developed at unibo
library(terra)
library(ggplot2)
library(viridis)

im.list()

m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")

# layer 1: NIR
# layer 2: red
# layer 3: green

im.plotRGB.user(m1992, 1, 2, 3)
im.plotRGB.user(m1992, 2, 1, 3)
im.plotRGB.user(m1992, 2, 3, 1)

# import the 2006 image
m2006 <- im.import("matogrosso_ast_2006209_lrg")

# Exercise: plot the 2006 image with NIR in the Green component of the RGB space
im.plotRGB.user(m2006, 2, 1, 3)

# Exercise: plot the 2006 image with NIR in the Blue component of the RGB space
im.plotRGB.user(m2006, 2, 3, 1)

# Exercise: plot the two images one beside the other
par(mfrow=c(1,2))
im.plotRGB.user(m1992, 1, 2, 3)
im.plotRGB.user(m2006, 1, 2, 3)

# Calculating the DVI
# dvi1992
dvi1992 = m1992[[1]] - m1992[[2]]
dvi1992

cl <- colorRampPalette(c("darkblue", "yellow", "red", "black"))(100) # specifying a color scheme
plot(dvi1992, col=cl)

# dvi2006
dvi2006 = m2006[[1]] - m2006[[2]]
dvi2006

cl <- colorRampPalette(c("darkblue", "yellow", "red", "black"))(100) # specifying a color scheme
plot(dvi2006, col=cl)

# dvi by imageRy
dvi1992i <- im.dvi(m1992, 1, 2)
dvi2006i <- im.dvi(m2006, 1, 2)

# ndvi
ndvi1992 = (m1992[[1]] - m1992[[2]]) / (m1992[[1]] + m1992[[2]])
ndvi2006 = (m2006[[1]] - m2006[[2]]) / (m2006[[1]] + m2006[[2]])

dev.off()
par(mfrow=c(1,2))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)

# scientifically meaningful image for everyone!
clvir <- colorRampPalette(c("violet", "dark blue", "blue", "green", "yellow"))(100) # specifying a color scheme
plot(ndvi2006, col=clvir)




