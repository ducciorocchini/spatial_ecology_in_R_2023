library(devtools)
library(colorblindr)

install_github("clauswilke/colorblindr")

library(ggplot2)
fig <- ggplot(iris, aes(Sepal.Length, fill = Species)) + geom_density(alpha = 0.7)
fig

cvd_grid(fig)
