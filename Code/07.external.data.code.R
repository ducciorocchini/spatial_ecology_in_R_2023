# External data

library(terra)

# set the working directory based on your path:
# setwd("youtpath")
# W***** users: C:\\path\Downloads -> C://path/Downloads
# My own:
setwd("~/Downloads")
naja <- rast("najafiraq_etm_2003140_lrg.jpg")  # like in im.import()

plotRGB(naja, r=1, g=2, b=3) # im-plotRGB

# Exercise: Download the second image from the same site and import it in R
najaaug <- rast("najafiraq_oli_2023219_lrg.jpg")
plotRGB(najaaug, r=1, g=2, b=3)

par(mfrow=c(2,1))
plotRGB(naja, r=1, g=2, b=3) # im-plotRGB
plotRGB(najaaug, r=1, g=2, b=3)

# multitemporal change detection
najadif = naja[[1]] - najaaug[[1]] 
cl <- colorRampPalette(c("brown", "grey", "orange")) (100)
plot(najadif, col=cl)

# Download your own preferred image:
typhoon <- rast("mawar_vir2_2023144_lrg.jpg")

plotRGB(typhoon, r=1, g=2, b=3)
plotRGB(typhoon, r=2, g=1, b=3)
plotRGB(typhoon, r=3, g=2, b=1)


# The Mato Grosso image can be downloaded directly from EO-NASA:

mato <- rast("matogrosso_l5_1992219_lrg.jpg")
plotRGB(mato, r=1, g=2, b=3) 
plotRGB(mato, r=2, g=1, b=3) 

