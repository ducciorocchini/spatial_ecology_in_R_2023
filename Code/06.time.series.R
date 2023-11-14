# Time series analysis
# Greenland increase of temperature
# Data and code from Emanuela Cosma

# install.packages("raster")
# install.packages("rasterVis")
library(raster)
# library(rasterVis)

# library(rgdal)

setwd("~/lab/greenland") # Linux
# setwd("C:/lab/greenland") # Windows
# setwd("/Users/name/Desktop/lab/greenland") # Mac

lst_2000 <- raster("lst_2000.tif")
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

# par
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# list f files:
rlist <- list.files(pattern="lst")
rlist

import <- lapply(rlist,raster)
import

TGr <- stack(import)
TGr
plot(TGr)

plotRGB(TGr, 1, 2, 3, stretch="Lin")
plotRGB(TGr, 2, 3, 4, stretch="Lin")
plotRGB(TGr, 4, 3, 2, stretch="Lin")

# levelplot(TGr)
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(TGr, col=cl)

# levelplot(TGr,col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
#
# levelplot(TGr,col.regions=cl, main="LST variation in time",
#           names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
#

##########################
#### Example 2: NO2 decrease during the lockdown period
##########################

library(raster)

setwd("~/lab/en") # Linux
# setwd("C:/lab/en") # Windows
# setwd("/Users/name/Desktop/lab/en") # Mac

en01 <- raster("EN_0001.png")

cl <- colorRampPalette(c('red','orange','yellow'))(100) #
plot(en01, col=cl)

en13 <- raster("EN_0013.png")
plot(en13, col=cl)

# Let's import the whole set (altogether!)

# Exercise: import the whole as in the Greenland example
# by the following steps: list.files, lapply, stack

rlist <- list.files(pattern="EN")

# lapply(X,FUN)
rimp <- lapply(rlist, raster)

# stack
en <- stack(rimp)

# plot everything
plot(en, col=cl)

# Exercise: plot EN01 besides EN13
par(mfrow=c(1,2))
plot(en[[1]], col=cl)
plot(en[[13]], col=cl)

# or:
en113 <- stack(en[[1]], en[[13]])
plot(en113, col=cl)

# let's make the difference:
difen <-  en[[1]] - en[[13]]
cldif <- colorRampPalette(c('blue','white','red'))(100) #
plot(difen, col=cldif)

# plotRGB of three files together
plotRGB(en, r=1, g=7, b=13, stretch="lin")
plotRGB(en, r=1, g=7, b=13, stretch="hist")



