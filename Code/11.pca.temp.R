library(imageRy)
library(viridis)
library(terra)

im.list()

sent <- im.import("sentinel.png")

sent.pca <- im.pca(sent)

# measuring variability in the first PC:
sd3pc <- focal(sent.pca[[1]], matrix(1/9, 3, 3), fun=sd)
viridis <- colorRampPalette(viridis(7))(255)
plot(sd3pc, col=viridis)
