install.packages("overlap")
library(overlap)
# https://cran.r-project.org/web/packages/overlap/vignettes/overlap.pdf

# data
data(kerinci)
head(kerinci)

# tiger
timeRad <- kerinci$Time * 2 * pi
timeRad
tig <- timeRad[kerinci$Sps == 'tiger']
densityPlot(tig, rug=TRUE)

# overlap
mac <- timeRad[kerinci$Sps == 'macaque']
overlapPlot(tig, mac)
legend('topright', c("Tigers", "Macaques"), lty=c(1,2), col=c("black","blue"), bty='n')       

# species
kerinci$Sps
summary(kerinci$Sps)

# tapir
tap <- timeRad[kerinci$Sps == 'tapir']
overlapPlot(mac, tap)
legend('topright', c("Macaques", "Tapirs"), lty=c(1,2), col=c("black","blue"), bty='n')       

