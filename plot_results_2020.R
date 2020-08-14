setwd('C:/Users/abrow/Documents/Env-and-CNDD')
setwd('//BioArk.bio.unc.edu/PeetLab/users/Brown_Alissa/chap2/rework')

require(effects)
require(ggplot2)
require(gridExtra)

# read in model objects


# get attributes for scaled basal areas so you can back-transform for plotting
# redefine dataframe
growth <- read.csv("Oosting_env_dat.csv", stringsAsFactors = FALSE)
growth <- growth[!is.na(growth$growth),]
growth <- growth[growth$growth<=1,]
growth$growth <- ifelse(growth$growth<0, 0, growth$growth)

BAc15scale <- scale(growth$BAc15)
BAh15scale <- scale(growth$BAh15)
BAc5scale <- scale(growth$BAc5)
BAh5scale <- scale(growth$BAh5)

toscale <- c("diam1", "gap", "org", "cations", "curv", "slope", "BAc5", "BAh5", "BAc10", "BAh10", "BAc15", "BAh15", "BAc20", "BAh20")
growth[, toscale] <- scale(growth[, toscale])



# BAc vs. BAh using cations model at 15m scale
ef <- effect("BAc15", cations.sep.int15.REML)
x <- as.data.frame(ef)

ef <- effect("BAh15", cations.sep.int15.REML)
y <- as.data.frame(ef)

# png("BAc15_x_cations.png", width = 3, height = 2, units = "in", res = 300)
# ggplot(x, aes(x=BAc15, y=fit)) + 
#   scale_y_continuous(name="",
#                      limits=c(-0.16, 0.13)) +
#   scale_x_continuous(name="", limits=c(-0.5, 20)) +
#   coord_cartesian(ylim=c(-0.16, 0.13)) +
#   coord_cartesian(xlim=c(-0.5, 20)) +
#   
#   geom_ribbon(data=x, inherit.aes=FALSE,
#               aes(ymin=lower, ymax=upper, x=BAc15),
#               alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
#   geom_smooth(data=x, inherit.aes=FALSE,
#               aes(x=BAc15, y=fit), size=1, color="gray60", method="lm") +
#   theme_classic() + 
#   theme(
#     axis.text=element_text(size=10),
#     plot.margin=margin(t=1, r=15, b=1, l=1))
# dev.off()
# 
# png("BAh15_x_cations.png", width = 3, height = 2, units = "in", res = 300)
# ggplot(y, aes(x=BAh15, y=fit)) + 
#   scale_y_continuous(name="",
#                      limits=c(-0.16, 0.13)) +
#   scale_x_continuous(name="", limits=c(-4, 3)) +
#   coord_cartesian(ylim=c(-0.16, 0.13)) +
#   coord_cartesian(xlim=c(-4, 3)) +
#   
#   geom_ribbon(data=y, inherit.aes=FALSE,
#               aes(ymin=lower, ymax=upper, x=BAh15),
#               alpha=0, linetype=5, size=0.75, color="gray10") +
#   geom_smooth(data=y, inherit.aes=FALSE,
#               aes(x=BAh15, y=fit), size=1, color="gray10", method="lm") +
#   theme_classic() + 
#   theme(
#     axis.text=element_text(size=10),
#     plot.margin=margin(t=1, r=15, b=1, l=1))
# dev.off()





# ORG - HIGH VS. LOW, CON VS. HET
ef <- effect("org:BAc5", org.sep.int5.REML)
o <- as.data.frame(ef)
o$raw <- (o$BAc5 * attr(BAc5scale, 'scaled:scale')) + attr(BAc5scale, 'scaled:center')

ef <- effect("org:BAh5", org.sep.int5.REML)
oh <- as.data.frame(ef)
oh$raw <- (oh$BAh5 * attr(BAh5scale, 'scaled:scale')) + attr(BAh5scale, 'scaled:center')

png("BAc5_low_org.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(o, aes(x=raw, y=fit)) +
  # scale_y_continuous(name="", limits=c(-0.21, 0.15)) +
  # scale_x_continuous(name="", limits=c(-0.2, 23)) +
  # coord_cartesian(ylim=c(-0.21, 0.15)) +
  # coord_cartesian(xlim=c(-0.2, 23)) +
  geom_ribbon(data=o[o$org==-1, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=raw),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=o[o$org==-1, ], inherit.aes=FALSE,
              aes(x=raw, y=fit), size=1, color="gray60", method="lm") +
  theme_classic() +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10),
        # axis.ticks.x=element_blank(),
        # axis.line.x=element_blank(),
        plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("BAc5_high_org.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(o, aes(x=BAc5, y=fit)) +
  # scale_y_continuous(name="", limits=c(-0.21, 0.15)) +
  # scale_x_continuous(name="", limits=c(-0.2, 23)) +
  # coord_cartesian(ylim=c(-0.21, 0.15)) +
  # coord_cartesian(xlim=c(-0.2, 23)) +
  
  geom_ribbon(data=o[o$org==3, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAc5),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=o[o$org==3, ], inherit.aes=FALSE,
              aes(x=BAc5, y=fit), size=1, color="gray60", method="lm") +
  theme_classic() +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10),
        # axis.ticks.x=element_blank(),
        # axis.line.x=element_blank(),
        plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("BAh5_low_org.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(oh, aes(x=BAh5, y=fit)) +
  # scale_y_continuous(name="", limits=c(-0.21, 0.15)) +
  # scale_x_continuous(name="", limits=c(-1, 5)) +
  # coord_cartesian(ylim=c(-0.21, 0.15)) +
  # coord_cartesian(xlim=c(-1, 5)) +
  geom_ribbon(data=oh[oh$org==-1, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh5),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=oh[oh$org==-1, ], inherit.aes=FALSE,
              aes(x=BAh5, y=fit), size=1, color="gray10", method="lm") +
  theme_classic() +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10),
        # axis.ticks.x=element_blank(),
        # axis.line.x=element_blank(),
        plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("BAh5_high_org.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(oh, aes(x=BAh5, y=fit)) +
  scale_y_continuous(name="", limits=c(-0.21, 0.15)) +
  scale_x_continuous(name="", limits=c(-1, 5)) +
  coord_cartesian(ylim=c(-0.21, 0.15)) +
  coord_cartesian(xlim=c(-1, 5)) +
  
  geom_ribbon(data=oh[oh$org==3, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh5),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=oh[oh$org==3, ], inherit.aes=FALSE,
              aes(x=BAh5, y=fit), size=1, color="gray10", method="lm") +
  theme_classic() +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10),
        # axis.ticks.x=element_blank(),
        # axis.line.x=element_blank(),
        plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()



# IF YOU WANT CON-HET PLOTS AT BOTH HIGH/LOW ORG LEVELS, SIDE-BY-SIDE:
oplot <- ggplot(o, aes(x=BAc5, y=fit)) +
  scale_y_continuous(name="", limits=c(-0.21, 0.15)) +
  scale_x_continuous(name="", limits=c(-0.2, 23)) +
  coord_cartesian(ylim=c(-0.21, 0.15)) +
  coord_cartesian(xlim=c(-0.2, 23)) +
  
  geom_ribbon(data=o[o$org==-1, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAc5),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=o[o$org==-1, ], inherit.aes=FALSE,
              aes(x=BAc5, y=fit), size=1, color="gray60", method="lm") +
  
  geom_ribbon(data=o[o$org==3, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAc5),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=o[o$org==3, ], inherit.aes=FALSE,
              aes(x=BAc5, y=fit), size=1, color="gray10", method="lm") +
  
  theme_classic() +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10),
        # axis.ticks.x=element_blank(),
        # axis.line.x=element_blank(),
        plot.margin = unit(c(5,5,5,5), "mm"))

ohplot <- ggplot(oh, aes(x=BAh5, y=fit)) +
  scale_y_continuous(name="", limits=c(-0.21, 0.15)) +
  scale_x_continuous(name="", limits=c(-1, 5)) +
  coord_cartesian(ylim=c(-0.21, 0.15)) +
  coord_cartesian(xlim=c(-1, 5)) +
  
  geom_ribbon(data=oh[oh$org==-1, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh5),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=oh[oh$org==-1, ], inherit.aes=FALSE,
              aes(x=BAh5, y=fit), size=1, color="gray60", method="lm") +
  
  geom_ribbon(data=oh[oh$org==3, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh5),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=oh[oh$org==3, ], inherit.aes=FALSE,
              aes(x=BAh5, y=fit), size=1, color="gray10", method="lm") +
  
  theme_classic() +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10),
        # axis.ticks.x=element_blank(),
        # axis.line.x=element_blank(),
        plot.margin = unit(c(5,5,5,5), "mm"))

png("con-het_x_org5.png", width = 6, height = 2, units = "in", res = 300)
grid.arrange(oplot, ohplot, ncol=2, nrow=1)
dev.off()




# GAP - LOW VS. HIGH, CON VS. HET
ef <- effect("gap:BAc5", gap.sep.int5.REML)
b <- as.data.frame(ef)

ef <- effect("gap:BAh5", gap.sep.int5.REML)
h <- as.data.frame(ef)

png("BAc5_low_gap.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(b, aes(x=BAc5, y=fit)) +
  scale_y_continuous(name="", limits = c(-0.25, 0.38)) +
  scale_x_continuous(name="") +
  coord_cartesian(ylim=c(-0.25, 0.38)) +
  coord_cartesian(xlim=c(-0.18, 23)) +
  
  geom_ribbon(data=b[b$gap==-2, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAc5),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=b[b$gap==-2, ], inherit.aes=FALSE,
              aes(x=BAc5, y=fit), size=1, color="gray60", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("BAc5_high_gap.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(b, aes(x=BAc5, y=fit)) +
  scale_y_continuous(name="", limits = c(-0.25, 0.38)) +
  scale_x_continuous(name="") +
  coord_cartesian(ylim=c(-0.25, 0.38)) +
  coord_cartesian(xlim=c(-0.18, 23)) +
  
  geom_ribbon(data=b[b$gap==5, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAc5),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=b[b$gap==5, ], inherit.aes=FALSE,
              aes(x=BAc5, y=fit), size=1, color="gray60", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()


png("BAh5_low_gap.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(h, aes(x=BAh5, y=fit)) +
  scale_y_continuous(name="", limits = c(-0.25, 0.38)) +
  scale_x_continuous(name="") +
  coord_cartesian(ylim=c(-0.25, 0.38)) +
  coord_cartesian(xlim=c(-1, 5)) +
  
  geom_ribbon(data=h[h$gap==-2, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh5),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=h[h$gap==-2, ], inherit.aes=FALSE,
              aes(x=BAh5, y=fit), size=1, color="gray10", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("BAh5_high_gap.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(h, aes(x=BAh5, y=fit)) +
  scale_y_continuous(name="", limits = c(-0.25, 0.38)) +
  scale_x_continuous(name="") +
  coord_cartesian(ylim=c(-0.25, 0.38)) +
  coord_cartesian(xlim=c(-1, 5)) +
  
  geom_ribbon(data=h[h$gap==5, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh5),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=h[h$gap==5, ], inherit.aes=FALSE,
              aes(x=BAh5, y=fit), size=1, color="gray10", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()



# CATIONS - LOW VS. HIGH, CON VS. HET
# as compared to BAh * cations
ef <- effect("cations:BAc15", cations.sep.int15.REML)
a <- as.data.frame(ef)

ef <- effect("cations:BAh15", cations.sep.int15.REML)
f <- as.data.frame(ef)

png("BAc15_low_cations.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(a, aes(x=BAc15, y=fit)) +
  scale_y_continuous(name="", limits=c(-0.51, 0.18)) +
  scale_x_continuous(name="", limits=c(-0.3, 20)) +
  coord_cartesian(ylim=c(-0.51, 0.18)) +
  coord_cartesian(xlim=c(-0.3, 20)) +
  
  geom_ribbon(data=a[a$cations==-3, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAc15),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=a[a$cations==-3, ], inherit.aes=FALSE,
              aes(x=BAc15, y=fit), size=1, color="gray60", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("BAc15_high_cations.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(a, aes(x=BAc15, y=fit)) +
  scale_y_continuous(name="", limits=c(-0.51, 0.18)) +
  scale_x_continuous(name="", limits=c(-0.3, 20)) +
  coord_cartesian(ylim=c(-0.51, 0.18)) +
  coord_cartesian(xlim=c(-0.3, 20)) +
  
  geom_ribbon(data=a[a$cations==2, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAc15),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=a[a$cations==2, ], inherit.aes=FALSE,
              aes(x=BAc15, y=fit), size=1, color="gray60", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("BAh15_low_cations.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(f, aes(x=BAh15, y=fit)) +
  scale_y_continuous(name="", limits=c(-0.51, 0.18)) +
  scale_x_continuous(name="", limits=c(-4, 3)) +
  coord_cartesian(ylim=c(-0.51, 0.18)) +
  coord_cartesian(xlim=c(-4, 3)) +
  
  geom_ribbon(data=f[f$cations==-3, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh15),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=f[f$cations==-3, ], inherit.aes=FALSE,
              aes(x=BAh15, y=fit), size=1, color="gray10", method="lm") +
  
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("BAh15_high_cations.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(f, aes(x=BAh15, y=fit)) +
  scale_y_continuous(name="", limits=c(-0.51, 0.18)) +
  scale_x_continuous(name="", limits=c(-4, 3)) +
  coord_cartesian(ylim=c(-0.51, 0.18)) +
  coord_cartesian(xlim=c(-4, 3)) +
  
  geom_ribbon(data=f[f$cations==2, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh15),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=f[f$cations==2, ], inherit.aes=FALSE,
              aes(x=BAh15, y=fit), size=1, color="gray10", method="lm") +
  
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()







# CURVATURE - LOW VS. HIGH, CON VS. HET
# as compared to BAh * curv
ef <- effect("curv:BAc5", curv.sep.int5.REML)
a <- as.data.frame(ef)
a$raw <- (a$BAc5 * attr(BAc5scale, 'scaled:scale')) + attr(BAc5scale, 'scaled:center')

ef <- effect("curv:BAh5", curv.sep.int5.REML)
f <- as.data.frame(ef)
f$raw <- (f$BAh5 * attr(BAh5scale, 'scaled:scale')) + attr(BAh5scale, 'scaled:center')

low <- round( min( min(a$lower), min(f$lower)), digits = 3) - 0.005
high <- round( max( max(a$upper), max(f$upper)), digits = 3) + 0.005

png("figs_2020/BAc5_low_curv.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(a, aes(x=raw, y=fit)) +
  scale_y_continuous(name="", limits=c(low, high)) +
  scale_x_continuous(name = '') +
  geom_ribbon(data=a[a$curv==min(a$curv), ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=raw),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=a[a$curv==min(a$curv), ], inherit.aes=FALSE,
              aes(x=raw, y=fit), size=1, color="gray60", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("figs_2020/BAc5_high_curv.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(a, aes(x=raw, y=fit)) +
  scale_y_continuous(name="", limits=c(low, high)) +
  scale_x_continuous(name="") +
  geom_ribbon(data=a[a$curv==max(a$curv), ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=raw),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=a[a$curv==max(a$curv), ], inherit.aes=FALSE,
              aes(x=raw, y=fit), size=1, color="gray60", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("figs_2020/BAh5_low_curv.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(f, aes(x=raw, y=fit)) +
  scale_y_continuous(name="", limits=c(low, high)) +
  scale_x_continuous(name="") +
  geom_ribbon(data=f[f$curv==min(f$curv), ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=raw),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=f[f$curv==min(f$curv), ], inherit.aes=FALSE,
              aes(x=raw, y=fit), size=1, color="gray10", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("figs_2020/BAh5_high_curv.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(f, aes(x=raw, y=fit)) +
  scale_y_continuous(name="", limits=c(low, high)) +
  scale_x_continuous(name="") +
  geom_ribbon(data=f[f$curv==max(f$curv), ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=raw),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=f[f$curv==max(f$curv), ], inherit.aes=FALSE,
              aes(x=raw, y=fit), size=1, color="gray10", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()





# SLOPE - LOW VS. HIGH, CON VS. HET
ef <- effect("slope:BAc15", slope.sep.int15.REML)
a <- as.data.frame(ef)
a$raw <- (a$BAc15 * attr(BAc15scale, 'scaled:scale')) + attr(BAc15scale, 'scaled:center')

ef <- effect("slope:BAh15", slope.sep.int15.REML)
f <- as.data.frame(ef)
f$raw <- (f$BAh15 * attr(BAh15scale, 'scaled:scale')) + attr(BAh15scale, 'scaled:center')

low <- round( min( min(a$lower), min(f$lower)), digits = 3) - 0.005
high <- round( max( max(a$upper), max(f$upper)), digits = 3) + 0.005

png("figs_2020/BAc15_low_slope.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(a, aes(x=raw, y=fit)) +
  scale_y_continuous(name="", limits=c(low, high)) +
  scale_x_continuous(name = '') +
  geom_ribbon(data=a[a$slope==min(a$slope), ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=raw),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=a[a$slope==min(a$slope), ], inherit.aes=FALSE,
              aes(x=raw, y=fit), size=1, color="gray60", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("figs_2020/BAc15_high_slope.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(a, aes(x=raw, y=fit)) +
  scale_y_continuous(name="", limits=c(low, high)) +
  scale_x_continuous(name="") +
  geom_ribbon(data=a[a$slope==max(a$slope), ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=raw),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=a[a$slope==max(a$slope), ], inherit.aes=FALSE,
              aes(x=raw, y=fit), size=1, color="gray60", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("figs_2020/BAh15_low_slope.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(f, aes(x=raw, y=fit)) +
  scale_y_continuous(name="", limits=c(low, high)) +
  scale_x_continuous(name="") +
  geom_ribbon(data=f[f$slope==min(f$slope), ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=raw),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=f[f$slope==min(f$slope), ], inherit.aes=FALSE,
              aes(x=raw, y=fit), size=1, color="gray10", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("figs_2020/BAh15_high_slope.png", width = 3, height = 2.3, units = "in", res = 300)
ggplot(f, aes(x=raw, y=fit)) +
  scale_y_continuous(name="", limits=c(low, high)) +
  scale_x_continuous(name="") +
  geom_ribbon(data=f[f$slope==max(f$slope), ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=raw),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=f[f$slope==max(f$slope), ], inherit.aes=FALSE,
              aes(x=raw, y=fit), size=1, color="gray10", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()



# OLD
# elevation - con vs. het - survival, 5m scale
ef <- effect("elev:BAc5", elev.sep.int5)
ec <- as.data.frame(ef)

ef <- effect("elev:BAh5", elev.sep.int5)
eh <- as.data.frame(ef)

con_elev <- ggplot(ec, aes(x=BAc5, y=fit)) +
  scale_y_continuous(name="", limits=c(0, 1)) +
  scale_x_continuous(name="", limits=c(-0.7, 8), breaks=seq(0, 8, 2)) +
  coord_cartesian(ylim=c(0, 1)) +
  coord_cartesian(xlim=c(-0.7, 8)) +
  
  geom_ribbon(data=ec[ec$elev==-3, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAc5),
              alpha=0.2, linetype=3, size=1, color="gray60", fill="gray70") +
  geom_smooth(data=ec[ec$elev==-3, ], inherit.aes=FALSE, se = FALSE,
              aes(x=BAc5, y=fit), size=1.5, color="gray60", method="lm") +
  
  geom_ribbon(data=ec[ec$elev==2, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAc5),
              alpha=0.2, linetype=5, size=1, color="gray10", fill="white") +
  geom_smooth(data=ec[ec$elev==2, ], inherit.aes=FALSE, se = FALSE,
              aes(x=BAc5, y=fit), size=1.5, color="gray10", method="lm") +
  
  theme_classic() +
  theme(
    axis.text=element_text(size=20),
    axis.title=element_text(size=20),
    plot.margin=margin(t=1, r=15, b=1, l=1))


het_elev <- ggplot(ec, aes(x=BAh5, y=fit)) +
  scale_y_continuous(name="", limits=c(0, 1)) +
  scale_x_continuous(name="", limits=c(-1, 5), breaks = seq(-1, 5, 1)) +
  coord_cartesian(ylim=c(0, 1)) +
  coord_cartesian(xlim=c(-1, 5)) +
  
  geom_ribbon(data=eh[eh$elev==-3, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh5),
              alpha=0.2, linetype=3, size=1, color="gray60", fill="gray70") +
  geom_smooth(data=eh[eh$elev==-3, ], inherit.aes=FALSE, se = FALSE,
              aes(x=BAh5, y=fit), size=1.5, color="gray60", method="lm") +
  
  geom_ribbon(data=eh[eh$elev==2, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh5),
              alpha=0.2, linetype=5, size=1, color="gray10", fill="white") +
  geom_smooth(data=eh[eh$elev==2, ], inherit.aes=FALSE, se = FALSE,
              aes(x=BAh5, y=fit), size=1.5, color="gray10", method="lm") +
  
  theme_classic() +
  theme(
    axis.text=element_text(size=20),
    axis.title=element_text(size=20),
    plot.margin=margin(t=1, r=15, b=1, l=1))

grid.arrange(con_elev, het_elev, ncol=2, nrow=1)


 
