# This is a script to visualize satellite data

library(devtools) # packages in R are also called libraries

# install the imageRy package from GitHub
devtools::install_github("ducciorocchini/imageRy")

library(imageRy)
library(terra)

# simple operation
10 + 10

# this is an object
duccio <- 10 + 10
duccio

# objects
adam <- 5 + 3
duccio + adam

# arrays
diameter <- c(100, 10, 50, 20, 15)
iron <- c(10, 1000, 20, 700, 900)

# a function
plot(iron, diameter) # iron and diameter are arguments!
plot(iron, diameter, pch=19) # https://www.google.com/search?client=ubuntu-sn&hs=Ssn&sca_esv=564367827&channel=fs&sxsrf=AB5stBhOTkEGpHkLRMvuoUQuTCdqYjKtEw:1694448980289&q=pch+in+R&tbm=isch&source=lnms&sa=X&ved=2ahUKEwjzmr2s-qKBAxUOGuwKHUdlAnMQ0pQJegQIDBAB&biw=960&bih=484&dpr=2#imgrc=lUw3nrgRKV8ynM
plot(iron, diameter, pch=19, cex=2)
plot(iron, diameter, pch=19, cex=2, col="red")

# do you want info about functions?
?plot()

# now we will use a package
im.list()

# importing data
# blue band
b2 <- im.import("sentinel.dolomites.b2.tif") # b2 is the blue wavelength
b2

# green band
b3 <- im.import("sentinel.dolomites.b3.tif") # b2 is the green wavelength
b3

# red band
b4 <- im.import("sentinel.dolomites.b4.tif") # b2 is the green wavelength
b4

# NIR band
b8 <- im.import("sentinel.dolomites.b8.tif") # b2 is the green wavelength
b8

plot(b2) # blue

cl <- colorRampPalette(c("dark blue", "blue", "light blue")) (100) # 100 is the amount of colours in the gradient
plot(b2, col=cl)

# exercise: plot the green band of Sentinel with a new color palette
clg <- colorRampPalette(c("dark green", "green", "light green")) (100) # 100 is the amount of colours in the gradient
plot(b3, col=clg)

# multiframe
par(mfrow=c(1,2))

cl <- colorRampPalette(c("dark blue", "blue", "light blue")) (100) # 100 is the amount of colours in the gradient
plot(b2, col=cl)

# exercise: plot the green band of Sentinel with a new color palette
clg <- colorRampPalette(c("dark green", "green", "light green")) (100) # 100 is the amount of colours in the gradient
plot(b3, col=clg)

# Exercise: plot all the bands
par(mfrow=c(2,2))

cl <- colorRampPalette(c("dark blue", "blue", "light blue")) (100) # 100 is the amount of colours in the gradient
plot(b2, col=cl)

# exercise: plot the green band of Sentinel with a new color palette
clg <- colorRampPalette(c("dark green", "green", "light green")) (100) # 100 is the amount of colours in the gradient
plot(b3, col=clg)

clr <- colorRampPalette(c("dark red", "red", "pink")) (100) # 100 is the amount of colours in the gradient
plot(b4, col=clr)

cln <- colorRampPalette(c("brown", "orange", "yellow")) (100) # 100 is the amount of colours in the gradient
plot(b8, col=cln)

# Sentinel-2 image
sentdo <- c(b2, b3, b4, b8)
clall <- colorRampPalette(c("black", "dark gray", "gray")) (100) # 100 is the amount of colours in the gradient
plot(sentdo, col=clall)

# how to consider only one element
plot(sentdo[[4]])

# dev.off() cleaning graphs
dev.off()

# how to consider only one element
plot(sentdo[[4]])

# RGB space
im.plotRGB.user(sentdo, 3, 2, 1)  # it plots the first three layers in the RGB components

# use of NIR
im.plotRGB.user(sentdo, 4, 3, 2)  # it plots the first three layers in the RGB components

# multiframe with the natural colours image and the false colour image
par(mfrow=c(1,2))
im.plotRGB.user(sentdo, 3, 2, 1)  # it plots the first three layers in the RGB components
im.plotRGB.user(sentdo, 4, 3, 2)  # it plots the first three layers in the RGB components

im.plotRGB.user(sentdo, 3, 4, 2)  # it plots the first three layers in the RGB components
im.plotRGB.user(sentdo, 3, 2, 4)  # it plots the first three layers in the RGB components

# what is the band carrying the highest infomration
pairs(sentdo)



