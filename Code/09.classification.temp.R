 # Procedure for classifying remote sensing data

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

im.list()

sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

sunc <- im.classify(sun)

plotRGB(sun, 1, 2, 3)
plot(sunc)

#-----

im.list()

# Import the data
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

# Classification of 1992
m1992c <- im.classify(m1992, num_clusters=2)

# classes of 1992:
# class 1: agricultural areas
# class 2: forest

#2006

m2006c <- im.classify(m2006, num_clusters=2)

# classes of 2006:
# class 1: agricultural areas
# class 2: forest

# final estimates
# 1992
freq1992 <- freq(m1992c)
freq1992

# 2006
freq2006 <- freq(m2006c)
freq2006

# percentages
tot1992 = ncell(m1992)
perc1992 = freq1992 * 100 / tot1992
perc1992

# 1992: forest = 83.08%, agriculture = 16.91%

tot2006 = ncell(m2006)
perc2006 = freq2006 * 100 / tot2006
perc2006

# 2006: forest = 45.31%, agriculture = 54.69%

# building the output table
cover <- c("forest", "agriculture") 
perc1992 <- c(83.08, 16.91)
perc2006 <- c(45.31, 54.69)

# final table
p <- data.frame(cover, perc1992, perc2006)
p

# final plot
p1 <- ggplot(p, aes(x=cover, y=perc1992, color=cover)) + geom_bar(stat="identity", fill="white"))
p2 <- ggplot(p, aes(x=cover, y=perc2006, color=cover)) + geom_bar(stat="identity", fill="white"))
p1+p2

# final plot - rescaled
p1 <- ggplot(p, aes(x=cover, y=perc1992, color=cover)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot(p, aes(x=cover, y=perc2006, color=cover)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p1+p2


