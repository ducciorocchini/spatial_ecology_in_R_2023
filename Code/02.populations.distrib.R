# Species Distribution Modelling

# install.packages("sdm")
# install.packages("rgdal", dependencies=T)

library(sdm)
library(terra) # predictors
library(rgdal) # species

file <- system.file("external/species.shp", package="sdm") 
species <- vect(file)

# looking at the set
species

# plot
plot(species)

# looking at the occurrences
species$Occurrence

# copy and then write:
plot(species[species$Occurrence == 1,],col='blue',pch=16)
points(species[species$Occurrence == 0,],col='red',pch=16)

presence <- species[species$Occurrence == 1]

# predictors: look at the path
path <- system.file("external", package="sdm") 

# list the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst

# stack
elev <- rast("/usr/local/lib/R/site-library/sdm/external/elevation.asc")
prec <- rast("/usr/local/lib/R/site-library/sdm/external/precipitation.asc")
temp <- rast("/usr/local/lib/R/site-library/sdm/external/temperature.asc")
vege <- rast("/usr/local/lib/R/site-library/sdm/external/vegetation.asc")

# stack
preds <- c(elev, prec, temp, vege)

# plot preds
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl) 

# plot predictors and occurrences
plot(preds$elevation, col=cl)
points(species[species$Occurrence == 1,], pch=16)

plot(preds$temperature, col=cl)
points(species[species$Occurrence == 1,], pch=16)

plot(preds$precipitation, col=cl)
points(species[species$Occurrence == 1,], pch=16)

plot(preds$vegetation, col=cl)
points(species[species$Occurrence == 1,], pch=16)

