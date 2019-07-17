
require(effects)
require(ggplot2)
require(gridExtra)

# get attributes for scaled basal areas so you can back-transform for plotting
# redefine dataframe
sc_dat <- read.csv("dat_with_soil_updated.csv", stringsAsFactors = FALSE)
colnames(sc_dat)[colnames(sc_dat) == "alt"] <- "elev"
sc_dat <- sc_dat[!is.na(sc_dat$growth),]  
sc_dat <- sc_dat[sc_dat$growth<=1,]  
sc_dat$sc_dat <- ifelse(sc_dat$growth<0, 0, sc_dat$growth)
sc_dat$BAc15scale <- scale(sc_dat$BAc15)
sc_dat$BAh15scale <- scale(sc_dat$BAh15)
sc_dat$BAc5scale <- scale(sc_dat$BAc5)
sc_dat$BAh5scale <- scale(sc_dat$BAh5)


# BAc vs. BAh using cations model at 15m scale

# for plotting SCALED basal areas
ef <- effect("BAc15", cations.sep.int15.REML)
x <- as.data.frame(ef)
x$raw <- (x$BAc15 * attr(sc_dat$BAc15scale, 'scaled:scale')) + attr(sc_dat$BAc15scale, 'scaled:center')

ef <- effect("BAh15", cations.sep.int15.REML)
y <- as.data.frame(ef)
y$raw <- (y$BAh15 * attr(sc_dat$BAh15scale, 'scaled:scale')) + attr(sc_dat$BAh15scale, 'scaled:center')


# GRAPH EFFECTS
png("BAc15_x_cations.png", width = 3, height = 2, units = "in", res = 600)
ggplot(x, aes(x=raw, y=fit)) + 
  scale_y_continuous(name="", limits=c(-0.16, 0.13)) +
  scale_x_continuous(name="") +
  coord_cartesian(ylim=c(-0.16, 0.13)) +

  geom_ribbon(data=x, inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=raw),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=x, inherit.aes=FALSE,
              aes(x=raw, y=fit), size=1, color="gray60", method="lm") +
  theme_classic() + 
  theme(
    axis.text=element_text(size=10),
    plot.margin=margin(t=1, r=15, b=1, l=1))
dev.off()

png("BAh15_x_cations.png", width = 3, height = 2, units = "in", res = 600)
ggplot(y, aes(x=raw, y=fit)) + 
  scale_y_continuous(name="", limits=c(-0.16, 0.13)) +
  scale_x_continuous(name="") +
  coord_cartesian(ylim=c(-0.16, 0.13)) +

  geom_ribbon(data=y, inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=raw),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=y, inherit.aes=FALSE,
              aes(x=raw, y=fit), size=1, color="gray10", method="lm") +
  theme_classic() + 
  theme(
    axis.text=element_text(size=10),
    plot.margin=margin(t=1, r=15, b=1, l=1))
dev.off()





# ORG - HIGH VS. LOW, CON VS. HET

ef <- effect("org:BAc5", org.sep.int5.REML, 
             xlevels = list(BAc5 = seq(min(growth$BAc5, na.rm = TRUE), 
                                       quantile(growth$BAc5, 0.9), length.out = 5)))
o <- as.data.frame(ef)
o$raw <- (o$BAc5 * attr(sc_dat$BAc5scale, 'scaled:scale')) + attr(sc_dat$BAc5scale, 'scaled:center')

ef <- effect("org:BAh5", org.sep.int5.REML,
             xlevels = list(BAh5 = seq(min(growth$BAh5, na.rm = TRUE), 
                                       quantile(growth$BAh5, 0.9), length.out = 5)))
oh <- as.data.frame(ef)
oh$raw <- (oh$BAh5 * attr(sc_dat$BAh5scale, 'scaled:scale')) + attr(sc_dat$BAh5scale, 'scaled:center')

png("BAc5_low_org.png", width = 3, height = 2.3, units = "in", res = 600)
ggplot(o, aes(x = raw, y=fit)) +
  scale_y_continuous(name="", limits=c(0.05, 0.15)) +
  scale_x_continuous(name="") +
  # coord_cartesian(ylim=c(-0.21, 0.15)) +
  geom_ribbon(data=o[o$org==-1, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x = raw),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=o[o$org==-1, ], inherit.aes=FALSE,
              aes(x = raw, y=fit), size=1, color="gray60", method="lm") +
  theme_classic() +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10),
        # axis.ticks.x=element_blank(),
        # axis.line.x=element_blank(),
        plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("BAc5_high_org.png", width = 3, height = 2.3, units = "in", res = 600)
ggplot(o, aes(x = raw, y=fit)) +
  scale_y_continuous(name="", limits=c(0.05, 0.15)) +
  scale_x_continuous(name="") +
  # coord_cartesian(ylim=c(-0.21, 0.15)) +

  geom_ribbon(data=o[o$org==3, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x = raw),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=o[o$org==3, ], inherit.aes=FALSE,
              aes(x = raw, y=fit), size=1, color="gray60", method="lm") +
  theme_classic() +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10),
        # axis.ticks.x=element_blank(),
        # axis.line.x=element_blank(),
        plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()


png("BAh5_low_org.png", width = 3, height = 2.3, units = "in", res = 600)
ggplot(oh, aes(x = raw, y=fit)) +
  scale_y_continuous(name="", limits=c(0.05, 0.15)) +
  scale_x_continuous(name="") +
  # coord_cartesian(ylim=c(-0.21, 0.15)) +
  geom_ribbon(data=oh[oh$org==-1, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x = raw),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=oh[oh$org==-1, ], inherit.aes=FALSE,
              aes(x = raw, y=fit), size=1, color="gray10", method="lm") +
  theme_classic() +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10),
        # axis.ticks.x=element_blank(),
        # axis.line.x=element_blank(),
        plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("BAh5_high_org.png", width = 3, height = 2.3, units = "in", res = 600)
ggplot(oh, aes(x = raw, y=fit)) +
  scale_y_continuous(name="", limits=c(0.05, 0.15)) +
  scale_x_continuous(name="") +
  # coord_cartesian(ylim=c(-0.21, 0.15)) +
  geom_ribbon(data=oh[oh$org==3, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x = raw),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=oh[oh$org==3, ], inherit.aes=FALSE,
              aes(x = raw, y=fit), size=1, color="gray10", method="lm") +
  theme_classic() +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10),
        # axis.ticks.x=element_blank(),
        # axis.line.x=element_blank(),
        plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()




# GAP - LOW VS. HIGH, CON VS. HET
ef <- effect("gap:BAc5", gap.sep.int5.REML, 
             xlevels = list(BAc5 = seq(min(growth$BAc5, na.rm = TRUE),
                                       quantile(growth$BAc5, 0.9), length.out = 5)))
b <- as.data.frame(ef)
b$raw <- (b$BAc5 * attr(sc_dat$BAc5scale, 'scaled:scale')) + attr(sc_dat$BAc5scale, 'scaled:center')

ef <- effect("gap:BAh5", gap.sep.int5.REML,
             xlevels = list(BAh5 = seq(min(growth$BAh5, na.rm = TRUE),
                                       quantile(growth$BAh5, 0.9), length.out = 5)))
h <- as.data.frame(ef)
h$raw <- (h$BAh5 * attr(sc_dat$BAh5scale, 'scaled:scale')) + attr(sc_dat$BAh5scale, 'scaled:center')

png("BAc5_low_gap.png", width = 3, height = 2.3, units = "in", res = 600)
ggplot(b, aes(x = raw, y=fit)) +
  scale_y_continuous(name="", limits = c(0.05, 0.15)) +
  scale_x_continuous(name="") +
  # coord_cartesian(ylim=c(-0.25, 0.38)) +

  geom_ribbon(data=b[b$gap==-2, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x = raw),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=b[b$gap==-2, ], inherit.aes=FALSE,
              aes(x = raw, y=fit), size=1, color="gray60", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()


png("BAc5_high_gap.png", width = 3, height = 2.3, units = "in", res = 600)
ggplot(b, aes(x = raw, y=fit)) +
  scale_y_continuous(name="", limits = c(0.05, 0.15)) +
  scale_x_continuous(name="") +
  # coord_cartesian(ylim=c(-0.25, 0.38)) +

  geom_ribbon(data=b[b$gap==5, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x = raw),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=b[b$gap==5, ], inherit.aes=FALSE,
              aes(x = raw, y=fit), size=1, color="gray60", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()


png("BAh5_low_gap.png", width = 3, height = 2.3, units = "in", res = 600)
ggplot(h, aes(x = raw, y=fit)) +
  scale_y_continuous(name="", limits = c(0.05, 0.15)) +
  scale_x_continuous(name="") +
  # coord_cartesian(ylim=c(-0.25, 0.38)) +

  geom_ribbon(data=h[h$gap==-2, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x = raw),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=h[h$gap==-2, ], inherit.aes=FALSE,
              aes(x = raw, y=fit), size=1, color="gray10", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("BAh5_high_gap.png", width = 3, height = 2.3, units = "in", res = 600)
ggplot(h, aes(x = raw, y=fit)) +
  scale_y_continuous(name="", limits = c(0.05, 0.15)) +
  scale_x_continuous(name="") +
  # coord_cartesian(ylim=c(-0.25, 0.38)) +

  geom_ribbon(data=h[h$gap==5, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x = raw),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=h[h$gap==5, ], inherit.aes=FALSE,
              aes(x = raw, y=fit), size=1, color="gray10", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()



# CATIONS - LOW VS. HIGH, CON VS. HET
# as compared to BAh * cations
ef <- effect("cations:BAc15", cations.sep.int15.REML,
             xlevels = list(BAc15 = seq(min(growth$BAc15, na.rm = TRUE), 
                                       quantile(growth$BAc15, 0.9), length.out = 5)))
a <- as.data.frame(ef)
a$raw <- (a$BAc15 * attr(sc_dat$BAc15scale, 'scaled:scale')) + attr(sc_dat$BAc15scale, 'scaled:center')

ef <- effect("cations:BAh15", cations.sep.int15.REML,
             xlevels = list(BAh15 = seq(min(growth$BAh15, na.rm = TRUE), 
                                       quantile(growth$BAh15, 0.9), length.out = 5)))
f <- as.data.frame(ef)
f$raw <- (f$BAh15 * attr(sc_dat$BAh15scale, 'scaled:scale')) + attr(sc_dat$BAh15scale, 'scaled:center')

png("BAc15_low_cations.png", width = 3, height = 2.3, units = "in", res = 600)
ggplot(a, aes(x = raw, y=fit)) +
  scale_y_continuous(name="", limits=c(0.05, 0.2)) +
  scale_x_continuous(name="") +
  # coord_cartesian(ylim=c(-0.51, 0.18)) +

  geom_ribbon(data=a[a$cations==-3, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x = raw),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=a[a$cations==-3, ], inherit.aes=FALSE,
              aes(x = raw, y=fit), size=1, color="gray60", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("BAc15_high_cations.png", width = 3, height = 2.3, units = "in", res = 600)
ggplot(a, aes(x = raw, y=fit)) +
  scale_y_continuous(name="", limits=c(0.05, 0.2)) +
  scale_x_continuous(name="") +
  # coord_cartesian(ylim=c(-0.51, 0.18)) +

  geom_ribbon(data=a[a$cations==2, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x = raw),
              alpha=0.2, linetype=3, size=0.75, color="gray60", fill="gray70") +
  geom_smooth(data=a[a$cations==2, ], inherit.aes=FALSE,
              aes(x = raw, y=fit), size=1, color="gray60", method="lm") +
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("BAh15_low_cations.png", width = 3, height = 2.3, units = "in", res = 600)
ggplot(f, aes(x = raw, y=fit)) +
  scale_y_continuous(name="", limits=c(0.05, 0.2)) +
  scale_x_continuous(name="") +
  # coord_cartesian(ylim=c(-0.51, 0.18)) +

  geom_ribbon(data=f[f$cations==-3, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x = raw),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=f[f$cations==-3, ], inherit.aes=FALSE,
              aes(x = raw, y=fit), size=1, color="gray10", method="lm") +
  
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()

png("BAh15_high_cations.png", width = 3, height = 2.3, units = "in", res = 600)
ggplot(f, aes(x = raw, y=fit)) +
  scale_y_continuous(name="", limits=c(0.05, 0.2)) +
  scale_x_continuous(name="") +
  # coord_cartesian(ylim=c(-0.51, 0.18)) +

  geom_ribbon(data=f[f$cations==2, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x = raw),
              alpha=0, linetype=5, size=0.75, color="gray10") +
  geom_smooth(data=f[f$cations==2, ], inherit.aes=FALSE,
              aes(x = raw, y=fit), size=1, color="gray10", method="lm") +
  
  theme_classic() +
  theme(
    axis.text=element_text(size=10),
    axis.title=element_text(size=10),
    plot.margin = unit(c(5,5,5,5), "mm"))
dev.off()








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


 
## OLD CODE
# BAc vs. BAh using gap at 10m
ef <- effect("BAc10", gap.int.all.REML10)
x <- as.data.frame(ef)

ef <- effect("BAh10", gap.int.all.REML10)
y <- as.data.frame(ef)

xplot <- ggplot(x, aes(x=BAc10, y=fit)) + 
  scale_y_continuous(name="",
                     limits=c(-0.085, 0.13)) +
  scale_x_continuous(name="") +
  coord_cartesian(ylim=c(-0.085, 0.13)) +

  geom_ribbon(data=x, inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAc10),
              alpha=0.2, linetype=3, size=1, color="gray60", fill="gray70") +
  geom_smooth(data=x, inherit.aes=FALSE,
              aes(x=BAc10, y=fit), size=1.5, color="gray60", method="lm") +
  theme_classic() + 
  theme(
    axis.text=element_text(size=20),
    plot.margin=margin(t=1, r=15, b=1, l=1))


yplot <- ggplot(y, aes(x=BAh10, y=fit)) + 
  scale_y_continuous(name="",
                     limits=c(-0.085, 0.13)) +
  scale_x_continuous(name="") +
  coord_cartesian(ylim=c(-0.085, 0.13)) +
  
  geom_ribbon(data=y, inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh10),
              alpha=0.2, linetype=5, size=1, color="gray10", fill="gray70") +
  geom_smooth(data=y, inherit.aes=FALSE,
              aes(x=BAh10, y=fit), size=1.5, color="gray10", method="lm") +
  theme_classic() + 
  theme(
    axis.text=element_text(size=20),
    plot.margin=margin(t=1, r=15, b=1, l=1))

grid.arrange(xplot, yplot, ncol=1, nrow=2)




# BAc * CATIONS x growth (15m scale)
# as compared to BAh * cations x growth
ef <- effect("cations:BAc15", cations.int.all.REML15)
a <- as.data.frame(ef)

con_cat_plot <- ggplot(a, aes(x=BAc15, y=fit)) +
  scale_y_continuous(name="", limits=c(-0.55, 0.2)) +
  scale_x_continuous(name="", limits=c(0, 40)) +
  coord_cartesian(ylim=c(-0.55, 0.2)) +
  coord_cartesian(xlim=c(0, 40)) +
  
  geom_ribbon(data=a[a$cations==-0.08, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAc15),
              alpha=0.2, linetype=3, size=1, color="gray60", fill="gray70") +
  geom_ribbon(data=a[a$cations==0.06, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAc15),
              alpha=0.2, linetype=5, size=1, color="gray10", fill="gray70") +
  
  geom_smooth(data=a[a$cations==-0.08, ], inherit.aes=FALSE,
              aes(x=BAc15, y=fit), size=1.5, color="gray60", method="lm") +
  geom_smooth(data=a[a$cations==0.06, ], inherit.aes=FALSE,
              aes(x=BAc15, y=fit), size=1.5, color="gray10", method="lm") +
  
  theme_classic() +
  theme(
    axis.text=element_text(size=20),
    axis.title=element_text(size=20),
    plot.margin=margin(t=1, r=15, b=1, l=1))


ef <- effect("cations:BAh15", cations.int.all.REML15)
f <- as.data.frame(ef)

het_cat_plot <- ggplot(f, aes(x=BAh15, y=fit)) +
  scale_y_continuous(name="", limits=c(-0.55, 0.2)) +
  # scale_x_continuous(name="", limits=c(0, 40)) +
  coord_cartesian(ylim=c(-0.55, 0.2)) +
  # coord_cartesian(xlim=c(0, 40)) +
  
  geom_ribbon(data=f[f$cations==-0.08, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh15),
              alpha=0.2, linetype=3, size=1, color="gray60", fill="gray70") +
  geom_ribbon(data=f[f$cations==0.06, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh15),
              alpha=0.2, linetype=5, size=1, color="gray10", fill="gray70") +
  
  geom_smooth(data=f[f$cations==-0.08, ], inherit.aes=FALSE,
              aes(x=BAh15, y=fit), size=1.5, color="gray60", method="lm") +
  geom_smooth(data=f[f$cations==0.06, ], inherit.aes=FALSE,
              aes(x=BAh15, y=fit), size=1.5, color="gray10", method="lm") +
  
  theme_classic() +
  theme(
    axis.text=element_text(size=20),
    axis.title=element_text(size=20),
    plot.margin=margin(t=1, r=15, b=1, l=1))

grid.arrange(con_cat_plot, het_cat_plot, ncol=2, nrow=1)





# BAh * gap, org x growth (all at 5m scale)
ef <- effect("org:BAh5", org.int.het.REML5)
o <- as.data.frame(ef)

ef <- effect("gap:BAh5", gap.int.het.REML5)
g <- as.data.frame(ef)

# gap
gplot <- ggplot(g, aes(x=BAh5, y=fit)) +
  scale_y_continuous(name="", limits=c(-0.1, 0.25)) +
  scale_x_continuous(name="", breaks=seq(0, 100, 20)) +
  coord_cartesian(ylim=c(-0.1, 0.25)) +
  coord_cartesian(xlim=c(0, 100)) +
  
  geom_ribbon(data=g[g$gap==10, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh5),
              alpha=0.2, linetype=3, size=1, color="gray60", fill="gray70") +
  geom_ribbon(data=g[g$gap==70, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh5),
              alpha=0.2, linetype=5, size=1, color="gray10", fill="gray70") +
  
  geom_smooth(data=g[g$gap==10, ], inherit.aes=FALSE,
              aes(x=BAh5, y=fit), size=1, color="gray60", method="lm") +
  geom_smooth(data=g[g$gap==70, ], inherit.aes=FALSE,
              aes(x=BAh5, y=fit), size=1, color="gray10", method="lm") +
  
  theme_classic() +
  theme(axis.title.x=element_blank(),
    axis.text.x=element_blank(),
    axis.text.y=element_text(size=20),
    axis.ticks.x=element_blank(),
    axis.line.x=element_blank(),
    plot.margin = unit(c(5,5,5,5), "mm"))



# org
oplot <- ggplot(o, aes(x=BAh5, y=fit)) +
  scale_y_continuous(name="", limits=c(-0.1, 0.25)) +
  scale_x_continuous(name="", breaks=seq(0, 100, 20)) +
  coord_cartesian(ylim=c(0, 0.25)) +
  coord_cartesian(xlim=c(0, 100)) +

  geom_ribbon(data=o[o$org==7.5, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh5),
              alpha=0.2, linetype=3, size=1, color="gray60", fill="gray70") +
  geom_ribbon(data=o[o$org==9, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh5),
              alpha=0.2, linetype=5, size=1, color="gray10", fill="gray70") +
  
  geom_smooth(data=o[o$org==7.5, ], inherit.aes=FALSE,
              aes(x=BAh5, y=fit), size=1, color="gray60", method="lm") +
  geom_smooth(data=o[o$org==9, ], inherit.aes=FALSE,
              aes(x=BAh5, y=fit), size=1, color="gray10", method="lm") +
  
  theme_classic() +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_text(size=20),
        axis.text.y=element_text(size=20),
        # axis.ticks.x=element_blank(),
        # axis.line.x=element_blank(),
        plot.margin = unit(c(5,5,5,5), "mm"))


grid.arrange(gplot, oplot, ncol=1, nrow=2)






# TRYING TO PLOT MODEL COEFFICIENTS, DOT AND WHISKER PLOTS
# make all plots below same x-axis scale, so from -2 to 2
# remove y axes from all but leftmost plot?
# re-order covariates if necessary
# align plots horizontally

require(lme4)
require(sjstats)
fert.int.het.REML5 <- lmer(log(growth+1) ~ diam1 +
                           BAh5*fert + BAc5 + 
                           (1|species),
                         REML = TRUE,
                         data = growth)
tabt <- std_beta(fert.int.het.REML5)

dotf <- ggplot(tabt[-1,], aes(x = term, y = std.estimate)) +
  scale_y_continuous(name ="", limits = c(-1.5, 1.5), breaks = seq(-2, 2, 1)) +
  scale_xiscrete(name ="", labels=c("fert" = "Env", "fert:BAh5" = "BAh * Env",
                                     "BAh5" = "BAh", "BAc5" = "BAc")) +
  geom_hline(yintercept = 0, color = "gray50", linetype = "dashed", size = 1) + 
  coord_flip() +
  geom_point(size = 4, shape = 16) + 
  geom_errorbar(aes(ymax = conf.high, ymin = conf.low), width = 0, size = 1) +
  ggtitle("Soil fertility proxy\n ") +
  theme_classic() + 
  theme(
#    axis.line.y = element_blank(),
    plot.title = element_text(hjust = 0.5),
    axis.ticks.y = element_blank(),
    axis.text = element_text(size=18),
    axis.title = element_text(size=18))

  

org.int.het.REML5 <- lmer(log(growth+1) ~ diam1 +
                          BAh5*org + BAc5 + 
                           (1|species),
                        REML = TRUE,
                        data = growth)
tabo <- std_beta(org.int.het.REML5)

doto <- ggplot(tabo[-1,], aes(x = term, y = std.estimate)) +
  scale_y_continuous(name ="", limits = c(-1.5, 1.5), breaks = seq(-2, 2, 1)) +
  scale_xiscrete(name ="", labels=c("org" = "Env", "BAh5:org" = "BAh * Env",
                                      "BAh5" = "BAh", "BAc5" = "BAc")) +
  geom_hline(yintercept = 0, color = "gray50", linetype = "dashed", size = 1) + 
  coord_flip() +
  geom_point(size = 4, shape = 16) + 
  geom_errorbar(aes(ymax = conf.high, ymin = conf.low), width = 0, size = 1) +
  ggtitle("Soil organic matter\n ") +
  theme_classic() + 
  theme(
    #    axis.line.y = element_blank(),
    plot.title = element_text(hjust = 0.5),
    axis.ticks.y = element_blank(),
    axis.text = element_text(size=18),
    axis.title = element_text(size=18))



gap.int.het.REML5 <- lmer(log(growth+1) ~ diam1 +
                          BAh5*gap + BAc5 + 
                           (1|species),
                        REML = TRUE,
                        data = growth)
tabg <- std_beta(gap.int.het.REML5)

dotg <- ggplot(tabg[-1,], aes(x = term, y = std.estimate)) +
  scale_y_continuous(name ="", limits = c(-1.5, 1.5)) +
  scale_xiscrete(name ="", labels=c("gap" = "Env", "BAh5:gap" = "BAh * Env",
                                      "BAh5" = "BAh", "BAc5" = "BAc")) +
  geom_hline(yintercept = 0, color = "gray50", linetype = "dashed", size = 1) + 
  coord_flip() +
  geom_point(size = 4, shape = 16) + 
  geom_errorbar(aes(ymax = conf.high, ymin = conf.low), width = 0, size = 1) +
  ggtitle("Measure of canopy gaps\n ") +
  theme_classic() + 
  theme(
    #    axis.line.y = element_blank(),
    plot.title = element_text(hjust = 0.5),
    axis.ticks.y = element_blank(),
    axis.text = element_text(size=18),
    axis.title = element_text(size=18))





# elev.add.all.REML5 <- lmer(log(growth+1) ~ diam1 + elev +
#                           BAh5 + BAc5 + 
#                            (1|species),
#                         REML = TRUE,
#                         data = growth)
# tabe <- std_beta(elev.add.all.REML5)
# 
# dote <- ggplot(tabe[-1,], aes(x = term, y = std.estimate)) +
#   scale_y_continuous(name ="") +
#   scale_xiscrete(name ="", labels=c("elev" = "Env",
#                                       "BAh5" = "BAh", "BAc5" = "BAc")) +
#   geom_hline(yintercept = 0, color = "gray50", linetype = "dashed", size = 1) + 
#   coord_flip() +
#   geom_point(size = 4, shape = 16) + 
#   geom_errorbar(aes(ymax = conf.high, ymin = conf.low), width = 0, size = 1) +
#   ggtitle("Elevation\n ") +
#   theme_classic() + 
#   theme(
#     #    axis.line.y = element_blank(),
#     plot.title = element_text(hjust = 0.5),
#     axis.ticks.y = element_blank(),
#     axis.text = element_text(size=18),
#     axis.title = element_text(size=18))


grid.arrange(dotg, doto, dotf, ncol=3, nrow=1)

