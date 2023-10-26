# RS data

library(devtools) # packages in R are also called libraries

# install the imageRy package from GitHub
install_github("ducciorocchini/imageRy")  # from devtools

library(imageRy)
library(terra)
# in case you have not terra
# install.packages("terra")

# list the data
im.list()

b2 <- im.import("sentinel.dolomites.b2.tif") 

cl <- colorRampPalette(c("dark grey","grey","light grey")) (100)
plot(b2, col=cl)

# import the green band from Sentinel-2 (band 3)
b3 <- im.import("sentinel.dolomites.b3.tif") 
plot(b3, col=cl)

