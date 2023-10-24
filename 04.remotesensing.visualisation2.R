# Remote sensing for ecosystem monitoring


# install.packages("devtools")
# install.packages("terra")

library(devtools)
library(terra)

devtools::install_github("ducciorocchini/imageRy")

library(imageRy)

im.list()

b2 <- im.import("sentinel.dolomites.b2.tif")

