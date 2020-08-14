
require(dplyr)
require(sp)
require(gstat)
require(spatstat)

stem <- read.csv("dat_with_soil_updated.csv", stringsAsFactors = FALSE)
soil <- read.csv("MFP97_SoilData1990.csv", stringsAsFactors = FALSE)
coordinates(soil) <- ~X+Y
coordinates(stem) <- ~X+Y

# pH
# check for outliers; kriging doesn't work well with outliers present
hist(soil$PH)

# visually check empirical variogram
plot(variogram(PH~1, soil))

# then fit variogram model to data
# vgm( psill, model, range, nugget)
v.ph <- variogram(PH~1, soil)
ph.fit <- fit.variogram(v.ph, vgm(0.2, "Exp", 100, 0.15))

# check that model seems reasonable
ph.fit
plot(v.ph, ph.fit, main="pH, Exp model fit")

# perform kriging
ph.kr <- krige(PH~1, soil, stem, model = ph.fit)

# visually inspect results of kriging
# check for homogeneity of variances in kriged values
spplot(ph.kr["var1.pred"], colorkey = TRUE, col.regions = rev(heat.colors(100)),
       main = "Kriged pH values")
spplot(ph.kr["var1.var"], colorkey = TRUE, col.regions = rev(heat.colors(100)),
       main = "Kriged pH variance")


# make grayscale color ramp
gray.ramp <- character(100)
for (i in 1:100) {
  if(i < 11)
    gray.ramp[i] <- "gray10"
  if(i > 10 & i < 91)
    gray.ramp[i] <- paste0("gray", i)
  if(i > 90)
    gray.ramp[i] <- "gray90"
}


# ALT (elevation)
hist(soil$ALT1)
plot(variogram(ALT1~1, soil))
v.alt1 <- variogram(ALT1~1, soil)
alt1.fit <- fit.variogram(v.alt1, vgm(0, "Gau", 120, 5))
plot(v.alt1, alt1.fit, main = "ALT1, Gau model fit")
alt1.fit
alt1.kr <- krige(ALT1~1, soil, stem, model = alt1.fit)

png("map_elevation.png", width = 3, height = 3, units = "in", res = 300)
spplot(alt1.kr["var1.pred"], colorkey = TRUE, 
       col.regions = rev(gray.ramp), cex = 0.5, main = "")
dev.off()

spplot(alt1.kr["var1.var"], colorkey = TRUE, col.regions = rev(heat.colors(100)),
       main = "Kriged ALT1 variance")


# ORG
hist(soil$ORG)   # remove extreme outliers
org <- read.csv("MFP97_SoilData1990.csv", stringsAsFactors = FALSE)
org <- org %>% filter(ORG < 20)
coordinates(org) <- ~X+Y
hist(org$ORG)   # looks good

plot(variogram(ORG~1, org))
v.org <- variogram(ORG~1, org)
org.fit <- fit.variogram(v.org, vgm(3, "Gau", 100, 0.5))
plot(v.org, org.fit, main= "ORG, Gau model fit")
org.fit
org.kr <- krige(ORG~1, org, stem, model = org.fit)

png("map_organic.png", width = 3, height = 3, units = "in", res = 300)
spplot(org.kr["var1.pred"], colorkey = TRUE, 
       col.regions = rev(gray.ramp), cex = 0.5, main = "")
dev.off()

spplot(org.kr["var1.var"], colorkey = TRUE, col.regions = rev(heat.colors(100)), 
       main = "Kriged ORG variance")



# add kriged soil data to stem data (pH, exch cap, altitude, organic matter)
dat <- read.csv("dat_with_soil_use.csv", stringsAsFactors = FALSE)

# ph <- data.frame(X = ph.kr@coords[,1], Y = ph.kr@coords[,2], ph = ph.kr@data$var1.pred)
ph <- data.frame(ph = ph.kr@data$var1.pred)
alt <- data.frame(alt = alt1.kr@data$var1.pred)
org <- data.frame(org = org.kr@data$var1.pred)

dat_soil <- cbind(dat, ph, alt, org)
write.csv(dat_soil, "dat_with_soil_updated.csv", row.names = FALSE)





# perform PCA of soil vars
require(vegan)
soil <- read.csv("MFP97_SoilData1990.csv", stringsAsFactors = FALSE)
soil <- soil %>% select(-X, -Y, -ALT2)
 
# check for extreme outliers
par(mfrow=c(6, 4))
par(mar=rep(0.2, 4))
sapply(soil, hist)
# vars with potential outliers: org, P, Ca, N.A, B?, Zn, DNS, CA_MG?

par(mfrow=c(1,1))
par(mar=rep(4, 4))
hist(soil$ORG)
which(soil$ORG>29)
# 7, 257, 275

hist(soil$P)
which(soil$P>22)

hist(soil$CA)
hist(soil$N.A)
which(soil$N.A>18)

hist(soil$B)
hist(soil$ZN)
which(soil$ZN>15)
# 146, 210, 275

hist(soil$DNS)
hist(soil$CA_MG)

# remove outliers
soil$ORG <- ifelse(soil$ORG>29, NA, soil$ORG)
soil$ZN <- ifelse(soil$ZN>15, NA, soil$ZN)
soil$P <- ifelse(soil$P>22, NA, soil$P)
soil$N.A <- ifelse(soil$N.A>18, NA, soil$N.A)
soil$CA_MG <- ifelse(soil$CA_MG>15, NA, soil$CA_MG)
soil <- soil[complete.cases(soil), ]

# scale variables before running pca
s_soil <- soil %>% mutate_all(funs(scale))

# run and plot pca
s_pca <- rda(s_soil)
biplot(s_pca, 
       display = c("sites", 
                   "species"),
       type = c("text",
                "points"))

#                         PC1    PC2     PC3     PC4     
# Eigenvalue            10.4792 3.2494 2.17459 2.01626 
# Proportion Explained   0.4366 0.1354 0.09061 0.08401 
# Cumulative Proportion  0.4366 0.5720 0.66263 0.74665

# probably will use PCA axes 1 & 2 in model; explain 56% of variation
# extract site scores for first four axes
soil <- read.csv("MFP97_SoilData1990.csv", stringsAsFactors = FALSE)
soil$ORG <- ifelse(soil$ORG>29, NA, soil$ORG)
soil$ZN <- ifelse(soil$ZN>15, NA, soil$ZN)
soil$P <- ifelse(soil$P>22, NA, soil$P)
soil$N.A <- ifelse(soil$N.A>18, NA, soil$N.A)
soil$CA_MG <- ifelse(soil$CA_MG>15, NA, soil$CA_MG)
remove <- rownames(soil[!complete.cases(soil), ])
soil <- soil[complete.cases(soil), ]

axes <- data.frame(s_pca$CA$u[ , 1:4])
soil_dat <- cbind(soil[,c("X", "Y")], s_soil, axes)

# interpolate PC axes
stem <- read.csv("dat_with_soil_updated.csv", stringsAsFactors = FALSE)
coordinates(stem) <- ~X+Y

soil <- soil_dat
coordinates(soil) <- ~X+Y

# PC1
plot(variogram(PC1~1, soil))
v.PC1 <- variogram(PC1~1, soil)
PC1.fit <- fit.variogram(v.PC1, vgm(0.002, "Exp", 80, 0.001))
plot(v.PC1, PC1.fit, main= "PC1, Exp model fit")
PC1.fit
PC1.kr <- krige(PC1~1, soil, stem, model = PC1.fit)
spplot(PC1.kr["var1.pred"], colorkey = TRUE, col.regions = rev(heat.colors(100)),
       main = "Kriged PC1 values")
spplot(PC1.kr["var1.var"], colorkey = TRUE, col.regions = rev(heat.colors(100)), 
       main = "Kriged PC1 variance")

# PC2
plot(variogram(PC2~1, soil))
v.PC2 <- variogram(PC2~1, soil)
PC2.fit <- fit.variogram(v.PC2, vgm(0.002, "Gau", 80, 0.001))
plot(v.PC2, PC2.fit, main= "PC2, Gau model fit")
PC2.fit
PC2.kr <- krige(PC2~1, soil, stem, model = PC2.fit)
spplot(PC2.kr["var1.pred"], colorkey = TRUE, col.regions = rev(heat.colors(100)),
       main = "Kriged PC2 values")
spplot(PC2.kr["var1.var"], colorkey = TRUE, col.regions = rev(heat.colors(100)), 
       main = "Kriged PC2 variance")

# PC3
plot(variogram(PC3~1, soil))
v.PC3 <- variogram(PC3~1, soil)
PC3.fit <- fit.variogram(v.PC3, vgm(0.0015, "Exp", 80, 0.001))
plot(v.PC3, PC3.fit, main= "PC3, Exp model fit")
PC3.fit
PC3.kr <- krige(PC3~1, soil, stem, model = PC3.fit)
spplot(PC3.kr["var1.pred"], colorkey = TRUE, col.regions = rev(heat.colors(100)),
       main = "Kriged PC3 values")
spplot(PC3.kr["var1.var"], colorkey = TRUE, col.regions = rev(heat.colors(100)), 
       main = "Kriged PC3 variance")

# PC4
plot(variogram(PC4~1, soil))
v.PC4 <- variogram(PC4~1, soil)
PC4.fit <- fit.variogram(v.PC4, vgm(0.001, "Gau", 150, 0.003))
plot(v.PC4, PC4.fit, main= "PC4, Exp model fit")
PC4.fit
PC4.kr <- krige(PC4~1, soil, stem, model = PC4.fit)
spplot(PC4.kr["var1.pred"], colorkey = TRUE, col.regions = rev(heat.colors(100)),
       main = "Kriged PC4 values")
spplot(PC4.kr["var1.var"], colorkey = TRUE, col.regions = rev(heat.colors(100)), 
       main = "Kriged PC4 variance")

# add kriged PC axes to stem data
dat <- read.csv("dat_with_soil_updated.csv", stringsAsFactors = FALSE)

pc1 <- data.frame(X = PC1.kr@coords[,1], Y = PC1.kr@coords[,2], pc1 = PC1.kr@data$var1.pred)
pc2 <- data.frame(pc2 = PC2.kr@data$var1.pred)
pc3 <- data.frame(pc3 = PC3.kr@data$var1.pred)
pc4 <- data.frame(pc4 = PC4.kr@data$var1.pred)
dat_soil <- cbind(pc1, pc2, pc3, pc4)
dat <- cbind(dat, dat_soil)

write.csv(dat, "dat_with_soil_updated.csv", row.names = FALSE)













# perform PCA of soil cation/pH to get fertility proxy
require(vegan)
soil <- read.csv("MFP97_SoilData1990.csv", stringsAsFactors = FALSE)
soil <- soil %>% select(PH, CA, MG, K)

# check for extreme outliers
par(mfrow=c(2, 2))
par(mar=rep(1, 4))
sapply(soil, hist)  # CA might have 2 outliers

# remove outliers
soil$CA <- ifelse(soil$CA>4000, NA, soil$CA)
soil <- soil[complete.cases(soil), ]

# scale variables before running pca
s_soil <- soil %>% mutate_all(funs(scale))

# run and plot pca
s_pca <- rda(s_soil)
biplot(s_pca, 
       display = c("sites", 
                   "species"),
       type = c("text",
                "points"))

#                         PC1    PC2     PC3     PC4
# Eigenvalue            3.0878 0.4840 0.30957 0.11867
# Proportion Explained  0.7719 0.1210 0.07739 0.02967
# Cumulative Proportion 0.7719 0.8929 0.97033 1.00000


# extract site scores for first axis
soil <- read.csv("MFP97_SoilData1990.csv", stringsAsFactors = FALSE)
soil$CA <- ifelse(soil$CA>4000, NA, soil$CA)
remove <- rownames(soil[!complete.cases(soil), ])
soil <- soil[complete.cases(soil), ]

PC1 <- data.frame(s_pca$CA$u[ , 1])
soil_dat <- cbind(soil[,c("X", "Y")], PC1)
names(soil_dat)[3] <- "cations"

# interpolate PC axes
stem <- read.csv("dat_with_soil_updated.csv", stringsAsFactors = FALSE)
coordinates(stem) <- ~X+Y

soil <- soil_dat
coordinates(soil) <- ~X+Y

# PC1
plot(variogram(cations~1, soil))
v.cations <- variogram(cations~1, soil)
cations.fit <- fit.variogram(v.cations, vgm(psill = 0.002, "Exp", 40, nugget = 0.0005))
plot(v.cations, cations.fit, main= "cations, Exp model fit")
cations.fit
cations.kr <- krige(cations~1, soil, stem, model = cations.fit)

png("map_cations.png", width = 3, height = 3, units = "in", res = 300)
spplot(cations.kr["var1.pred"], colorkey = TRUE, 
       col.regions = rev(gray.ramp), cex = 0.5, main = "")
dev.off()

spplot(cations.kr["var1.var"], colorkey = TRUE, col.regions = rev(heat.colors(100)), 
       main = "Kriged cations variance")


# add kriged PC axes to stem data
dat <- read.csv("dat_with_soil_updated.csv", stringsAsFactors = FALSE)

cations <- data.frame(X = cations.kr@coords[,1], Y = cations.kr@coords[,2], pc1 = cations.kr@data$var1.pred)
names(cations)[3] <- "cations"
dat <- cbind(dat, cations)
identical(dat[,1], dat[,36])
identical(dat[,2], dat[,37])
dat <- dat[,-c(36, 37)]

write.csv(dat, "dat_with_soil_updated.csv", row.names = FALSE)


# STEM DEATHS
# USE COMMENTED-OUT CODE TO CONSTRUCT 'STEM DEATH' OBJECTS IF YOU DON'T HAVE IT ALREADY 
# IN THE DATAFRAME (COLUMN NAME 'GAP' in stem data)
# dat<-read.csv("MFP_97.csv")
# dat <- dat[,c(2,8,9,13:15)]
# dat$conditionCode <- ifelse(is.na(dat$conditionCode),1,dat$conditionCode)
# death <- dat[dat$Year=="1998",]
# death <- death[!(death$conditionCode==1 | death$conditionCode==6),]
# colnames(death)[6] <- "diam98"
# 
# diam90 <- dat[dat$Year==1990,c(1,6)]
# colnames(diam90)[2] <- "diam90"
# death <- merge(death,diam90,by="plotStemID",all.x=TRUE,all.y=FALSE)
# 
# death <- death[,-c(1,4:6)]
# death <- death[!is.na(death$diam90),]
# death <- death[death$diam90 > 12.6,]
# death$X <- death$X/10
# death$Y <- death$Y/10
# 
# death.pp <- as.ppp(death,owin(c(0,256),c(0,256)))
# plot(death.pp)
# death.fun <- Smoothfun(death.pp,sigma=10,edge=TRUE)
# 
# # convert death spatial function
# plot(death.fun, main = "")
# im <- as.im(death.fun)
# ext <- im[stem[,c('X','Y)]]
# stem <- cbind(stem,ext)

# plot gap on top of stem locations
stem <- stem %>% dplyr::select(X, Y, gap)
coordinates(stem) <- ~X+Y
png("figs_2020/map_gap.png", width = 3, height = 3, units = "in", res = 300)
spplot(stem, colorkey = TRUE, 
       col.regions = rev(gray.ramp), cex = 0.5, main = "")
dev.off()

