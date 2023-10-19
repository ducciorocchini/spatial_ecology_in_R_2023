# camera traps data
# data from Kerinci-Seblat National Park in Sumatra, Indonesia (Ridout and Linkie, 2009)
# Ridout MS, Linkie M (2009). Estimating overlap of daily activity patterns from camera trap data. 
# Journal of Agricultural, Biological, and Environmental Statistics, 14(3), 322–337.

install.packages("overlap")
library(overlap)
# https://cran.r-project.org/web/packages/overlap/vignettes/overlap.pdf


# data
data(kerinci)
head(kerinci)

# tiger
# The unit of time is the day, so values range from 0 to 1. 
# The package overlap works entirely in radians: fitting density curves uses trigonometric functions (sin, cos, tan),
# so this speeds up simulations. The conversion is straightforward: kerinci$Time * 2 * pi
kerinci$timeRad <- kerinci$Time * 2 * pi

# selecting the first species
tiger <- kerinci[kerinci$Sps=="tiger",]

# selecting the time for the tiger
timetig <- tiger$timeRad
densityPlot(timetig, rug=TRUE)

# selecting the second species
maca <- kerinci[kerinci$Sps=="macaque",]

# selecting the time for the tiger
timemaca <- maca$timeRad
densityPlot(timemaca, rug=TRUE)

# overlap!
overlapPlot(timetig, timemaca)
legend('topright', c("Tigers", "Macaques"), lty=c(1,2), col=c("black","blue"), bty='n')       

# species
kerinci$Sps
summary(kerinci$Sps)

# tapir
tap <- timeRad[kerinci$Sps == 'tapir']
overlapPlot(mac, tap)
legend('topright', c("Macaques", "Tapirs"), lty=c(1,2), col=c("black","blue"), bty='n')       

