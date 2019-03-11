
require(effects)
require(ggplot2)
require(gridExtra)

# BAc vs. BAh using gap at 10m
ef <- effect("BAc10_d", gap.int.all.REML10)
x <- as.data.frame(ef)

ef <- effect("BAh10_d", gap.int.all.REML10)
y <- as.data.frame(ef)

xplot <- ggplot(x, aes(x=BAc10_d, y=fit)) + 
  scale_y_continuous(name="",
                     limits=c(-0.085, 0.13)) +
  scale_x_continuous(name="") +
  coord_cartesian(ylim=c(-0.085, 0.13)) +

  geom_ribbon(data=x, inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAc10_d),
              alpha=0.2, linetype=3, size=1, color="gray60", fill="gray70") +
  geom_smooth(data=x, inherit.aes=FALSE,
              aes(x=BAc10_d, y=fit), size=1.5, color="gray60", method="lm") +
  theme_classic() + 
  theme(
    axis.text=element_text(size=20),
    plot.margin=margin(t=1, r=15, b=1, l=1))


yplot <- ggplot(y, aes(x=BAh10_d, y=fit)) + 
  scale_y_continuous(name="",
                     limits=c(-0.085, 0.13)) +
  scale_x_continuous(name="") +
  coord_cartesian(ylim=c(-0.085, 0.13)) +
  
  geom_ribbon(data=y, inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh10_d),
              alpha=0.2, linetype=5, size=1, color="gray10", fill="gray70") +
  geom_smooth(data=y, inherit.aes=FALSE,
              aes(x=BAh10_d, y=fit), size=1.5, color="gray10", method="lm") +
  theme_classic() + 
  theme(
    axis.text=element_text(size=20),
    plot.margin=margin(t=1, r=15, b=1, l=1))

grid.arrange(xplot, yplot, ncol=1, nrow=2)


# BAc * CATIONS x growth (15m scale)
# as compared to BAh * cations x growth
ef <- effect("cations:BAc15_d", cations.int.all.REML15)
a <- as.data.frame(ef)

con_cat_plot <- ggplot(a, aes(x=BAc15_d, y=fit)) +
  scale_y_continuous(name="", limits=c(-0.55, 0.2)) +
  scale_x_continuous(name="", limits=c(0, 40)) +
  coord_cartesian(ylim=c(-0.55, 0.2)) +
  coord_cartesian(xlim=c(0, 40)) +
  
  geom_ribbon(data=a[a$cations==-0.08, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAc15_d),
              alpha=0.2, linetype=3, size=1, color="gray60", fill="gray70") +
  geom_ribbon(data=a[a$cations==0.06, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAc15_d),
              alpha=0.2, linetype=5, size=1, color="gray10", fill="gray70") +
  
  geom_smooth(data=a[a$cations==-0.08, ], inherit.aes=FALSE,
              aes(x=BAc15_d, y=fit), size=1.5, color="gray60", method="lm") +
  geom_smooth(data=a[a$cations==0.06, ], inherit.aes=FALSE,
              aes(x=BAc15_d, y=fit), size=1.5, color="gray10", method="lm") +
  
  theme_classic() +
  theme(
    axis.text=element_text(size=20),
    axis.title=element_text(size=20),
    plot.margin=margin(t=1, r=15, b=1, l=1))


ef <- effect("cations:BAh15_d", cations.int.all.REML15)
f <- as.data.frame(ef)

het_cat_plot <- ggplot(f, aes(x=BAh15_d, y=fit)) +
  scale_y_continuous(name="", limits=c(-0.55, 0.2)) +
  scale_x_continuous(name="", limits=c(0, 40)) +
  coord_cartesian(ylim=c(-0.55, 0.2)) +
  coord_cartesian(xlim=c(0, 40)) +
  
  geom_ribbon(data=f[f$cations==-0.08, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh15_d),
              alpha=0.2, linetype=3, size=1, color="gray60", fill="gray70") +
  geom_ribbon(data=f[f$cations==0.06, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh15_d),
              alpha=0.2, linetype=5, size=1, color="gray10", fill="gray70") +
  
  geom_smooth(data=f[f$cations==-0.08, ], inherit.aes=FALSE,
              aes(x=BAh15_d, y=fit), size=1.5, color="gray60", method="lm") +
  geom_smooth(data=f[f$cations==0.06, ], inherit.aes=FALSE,
              aes(x=BAh15_d, y=fit), size=1.5, color="gray10", method="lm") +
  
  theme_classic() +
  theme(
    axis.text=element_text(size=20),
    axis.title=element_text(size=20),
    plot.margin=margin(t=1, r=15, b=1, l=1))



# BAc * gap x growth (10m scale)
# compared to BAh * gap x growth
ef <- effect("gap:BAc10_d", gap.int.all.REML10)
b <- as.data.frame(ef)

conplot <- ggplot(b, aes(x=BAc10_d, y=fit)) +
  scale_y_continuous(name="") +
  scale_x_continuous(name="") +
  coord_cartesian(ylim=c(-0.22, 0.4)) +
  # coord_cartesian(xlim=c(0, 30)) +

  geom_ribbon(data=b[b$gap==10, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAc10_d),
              alpha=0.2, linetype=3, size=1, color="gray60", fill="gray70") +
  geom_ribbon(data=b[b$gap==70, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAc10_d),
              alpha=0.2, linetype=5, size=1, color="gray10", fill="gray70") +
  
  geom_smooth(data=b[b$gap==10, ], inherit.aes=FALSE,
              aes(x=BAc10_d, y=fit), size=1.5, color="gray60", method="lm") +
  geom_smooth(data=b[b$gap==70, ], inherit.aes=FALSE,
              aes(x=BAc10_d, y=fit), size=1.5, color="gray10", method="lm") +
  
  theme_classic() +
  theme(
    axis.text=element_text(size=20),
    axis.title=element_text(size=20),
    plot.margin=margin(t=1, r=15, b=1, l=1))


ef <- effect("gap:BAh10_d", gap.int.all.REML10)
h <- as.data.frame(ef)

hetplot <- ggplot(h, aes(x=BAh10_d, y=fit)) +
  scale_y_continuous(name="") +
  scale_x_continuous(name="") +
  coord_cartesian(ylim=c(-0.22, 0.4)) +
  # coord_cartesian(xlim=c(0, 30)) +
  
  geom_ribbon(data=h[h$gap==10, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh10_d),
              alpha=0.2, linetype=3, size=1, color="gray60", fill="gray70") +
  geom_ribbon(data=h[h$gap==70, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh10_d),
              alpha=0.2, linetype=5, size=1, color="gray10", fill="gray70") +
  
  geom_smooth(data=h[h$gap==10, ], inherit.aes=FALSE,
              aes(x=BAh10_d, y=fit), size=1.5, color="gray60", method="lm") +
  geom_smooth(data=h[h$gap==70, ], inherit.aes=FALSE,
              aes(x=BAh10_d, y=fit), size=1.5, color="gray10", method="lm") +
  
  theme_classic() +
  theme(
    axis.text=element_text(size=20),
    axis.title=element_text(size=20),
    plot.margin=margin(t=1, r=15, b=1, l=1))

grid.arrange(conplot, hetplot, ncol=2, nrow=1)





# BAh * gap, org x growth (all at 5m scale)
ef <- effect("org:BAh5_d", org.int.het.REML5)
o <- as.data.frame(ef)

ef <- effect("gap:BAh5_d", gap.int.het.REML5)
g <- as.data.frame(ef)

# gap
gplot <- ggplot(g, aes(x=BAh5_d, y=fit)) +
  scale_y_continuous(name="", limits=c(-0.1, 0.25)) +
  scale_x_continuous(name="", breaks=seq(0, 100, 20)) +
  coord_cartesian(ylim=c(-0.1, 0.25)) +
  coord_cartesian(xlim=c(0, 100)) +
  
  geom_ribbon(data=g[g$gap==10, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh5_d),
              alpha=0.2, linetype=3, size=1, color="gray60", fill="gray70") +
  geom_ribbon(data=g[g$gap==70, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh5_d),
              alpha=0.2, linetype=5, size=1, color="gray10", fill="gray70") +
  
  geom_smooth(data=g[g$gap==10, ], inherit.aes=FALSE,
              aes(x=BAh5_d, y=fit), size=1, color="gray60", method="lm") +
  geom_smooth(data=g[g$gap==70, ], inherit.aes=FALSE,
              aes(x=BAh5_d, y=fit), size=1, color="gray10", method="lm") +
  
  theme_classic() +
  theme(axis.title.x=element_blank(),
    axis.text.x=element_blank(),
    axis.text.y=element_text(size=20),
    axis.ticks.x=element_blank(),
    axis.line.x=element_blank(),
    plot.margin = unit(c(5,5,5,5), "mm"))



# org
oplot <- ggplot(o, aes(x=BAh5_d, y=fit)) +
  scale_y_continuous(name="", limits=c(-0.1, 0.25)) +
  scale_x_continuous(name="", breaks=seq(0, 100, 20)) +
  coord_cartesian(ylim=c(0, 0.25)) +
  coord_cartesian(xlim=c(0, 100)) +

  geom_ribbon(data=o[o$org==7.5, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh5_d),
              alpha=0.2, linetype=3, size=1, color="gray60", fill="gray70") +
  geom_ribbon(data=o[o$org==9, ], inherit.aes=FALSE,
              aes(ymin=lower, ymax=upper, x=BAh5_d),
              alpha=0.2, linetype=5, size=1, color="gray10", fill="gray70") +
  
  geom_smooth(data=o[o$org==7.5, ], inherit.aes=FALSE,
              aes(x=BAh5_d, y=fit), size=1, color="gray60", method="lm") +
  geom_smooth(data=o[o$org==9, ], inherit.aes=FALSE,
              aes(x=BAh5_d, y=fit), size=1, color="gray10", method="lm") +
  
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
                           BAh5_d_d*fert + BAc5_d_d + 
                           (1|species),
                         REML = TRUE,
                         data = growth)
tabt <- std_beta(fert.int.het.REML5)

dotf <- ggplot(tabt[-1,], aes(x = term, y = std.estimate)) +
  scale_y_continuous(name ="", limits = c(-1.5, 1.5), breaks = seq(-2, 2, 1)) +
  scale_x_discrete(name ="", labels=c("fert" = "Env", "fert:BAh5_d_d" = "BAh * Env",
                                     "BAh5_d_d" = "BAh", "BAc5_d_d" = "BAc")) +
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
                          BAh5_d_d*org + BAc5_d_d + 
                           (1|species),
                        REML = TRUE,
                        data = growth)
tabo <- std_beta(org.int.het.REML5)

doto <- ggplot(tabo[-1,], aes(x = term, y = std.estimate)) +
  scale_y_continuous(name ="", limits = c(-1.5, 1.5), breaks = seq(-2, 2, 1)) +
  scale_x_discrete(name ="", labels=c("org" = "Env", "BAh5_d_d:org" = "BAh * Env",
                                      "BAh5_d_d" = "BAh", "BAc5_d_d" = "BAc")) +
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
                          BAh5_d_d*gap + BAc5_d_d + 
                           (1|species),
                        REML = TRUE,
                        data = growth)
tabg <- std_beta(gap.int.het.REML5)

dotg <- ggplot(tabg[-1,], aes(x = term, y = std.estimate)) +
  scale_y_continuous(name ="", limits = c(-1.5, 1.5)) +
  scale_x_discrete(name ="", labels=c("gap" = "Env", "BAh5_d_d:gap" = "BAh * Env",
                                      "BAh5_d_d" = "BAh", "BAc5_d_d" = "BAc")) +
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
#                           BAh5_d_d + BAc5_d_d + 
#                            (1|species),
#                         REML = TRUE,
#                         data = growth)
# tabe <- std_beta(elev.add.all.REML5)
# 
# dote <- ggplot(tabe[-1,], aes(x = term, y = std.estimate)) +
#   scale_y_continuous(name ="") +
#   scale_x_discrete(name ="", labels=c("elev" = "Env",
#                                       "BAh5_d_d" = "BAh", "BAc5_d_d" = "BAc")) +
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

