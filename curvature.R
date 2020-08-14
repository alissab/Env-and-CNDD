
require(spatstat)
require(raster)
require(spatialEco)  # to calculate curvature and slope/aspect transformation
require(landsat)  # to calculate slope and aspect
require(lme4)

soil <- read.csv("MFP97_SoilData1990.csv", stringsAsFactors = FALSE)
stem <- read.csv("Oosting_env_dat.csv", stringsAsFactors = FALSE)

# make ppp object with elevation, then perform smoothing, save as image, then as raster
elev.pp <- as.ppp(soil[, c('X','Y','ALT1')],owin(c(0,256),c(0,256)))
plot(elev.pp)
elev.fun <- Smoothfun(elev.pp, sigma = 15, edge = TRUE)
plot(elev.fun, main = "")
im <- as.im(elev.fun)
raster <- raster(im)
plot(raster)

# find curvature values using elevation raster
curv <- curvature(raster, type="bolstad")
plot(curv)

# extract curvature values onto stem locations
curvature <- raster::extract(curv, stem[,c('X','Y')])
stem <- cbind(stem, curvature)
# colnames(stem)[37] <- "curv"

# plot curvature on top of stem locations
curvature <- stem %>% dplyr::select(X, Y, curvature)
coordinates(curvature) <- ~X+Y
png("figs_2020/map_curvature.png", width = 3, height = 3, units = "in", res = 300)
spplot(curvature, colorkey = TRUE, 
       col.regions = rev(gray.ramp), cex = 0.5, main = "")
dev.off()


# find slope/aspect using elevation raster
# elev <- soil[,c('X','Y','ALT1')]
# coordinates(elev) <- c("X", "Y") # promote to SpatialPointsDataFrame
# gridded(elev) <- TRUE # promote to SpatialPixelsDataFrame
elev <- as(raster, "SpatialGridDataFrame")
slasp <- slopeasp(elev)
slope <- slasp[[1]]
aspect <- slasp[[2]]

slope.df <- data.frame(slope)
aspect.df <- data.frame(aspect)
names(slope.df)[1] <- "slope"
names(aspect.df)[1] <- "aspect"
identical(slope.df[,2:3], aspect.df[,2:3])  # TRUE
slasp.df <- cbind(slope.df[,"slope"], aspect.df)
names(slasp.df)[1] <- "slope"

# combine slope/aspect into one variable
slasp.df$index <- sa.trans(slope = slasp.df$slope,
                           aspect = slasp.df$aspect,
                           type = 'cos',  # Northness
                           slp.units = 'degrees',
                           asp.units = 'degrees')
slasp.df <- slasp.df[,c('s1','s2','index')]
colnames(slasp.df)[1:2] <- c('X','Y')
coordinates(slasp.df) <- ~ X + Y
gridded(slasp.df) <- TRUE
slasp.r <- raster(slasp.df)

# extract slope/aspect index at stem locations
index.df <- raster::extract(slasp.r, stem[,c('X','Y')])
stem <- cbind(stem, index.df)
names(stem)[ncol(stem)] <- "slope_new"

# plot curvature on top of stem locations
slope <- stem %>% dplyr::select(X, Y, slope_new)
coordinates(slope) <- ~X+Y
png("figs_2020/map_slope.png", width = 3, height = 3, units = "in", res = 300)
spplot(slope, colorkey = TRUE, 
       col.regions = rev(gray.ramp), cex = 0.5, main = "")
dev.off()


# save new data
write.csv(stem, "Oosting_env_dat.csv")
