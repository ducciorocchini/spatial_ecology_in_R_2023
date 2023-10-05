library(vegan)

data(dune)
ord <- decorana(dune)
ord

# Call:
# decorana(veg = dune) 

# Detrended correspondence analysis with 26 segments.
# Rescaling of axes with 4 iterations.

#                   DCA1   DCA2
# Eigenvalues     0.5117 0.3036
# Decorana values 0.5360 0.2869
# Axis lengths    3.7004 3.1166
#                    DCA3    DCA4
# Eigenvalues     0.12125 0.14267
# Decorana values 0.08136 0.04814
# Axis lengths    1.30055 1.47888

plot(ord)
