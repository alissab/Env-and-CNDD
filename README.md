# How the environment can modify conspecific negative density dependence
This repo contains R code used to analyze a large mapped forest plot in the Duke Forest for A. Brown's PhD dissertation.

### R code:
- **curvature** Code to calculate surface curvature of plot topography for use in growth and survival models.
- **mods_growth** R markdown file. Performs model selection for growth models for all spatial scales; tests for spatial autocorrelation; constructs summary tables of parameter estimates of best fit models.
- **mods_survival** R markdown file. Performs model selection for survival models for all spatial scales; tests for spatial autocorrelation; constructs summary tables of parameter estimates of best fit models.
- **plot_results_2020** Code to create 'raw' figures. Some post-processing occurred in Inkscape to create final figures for publication.
- **soil_topography_kriging** Code to perform spatial interpolation on soil data across mapped forest plot.

### Background

**Brown, AJ, PS White, and RK Peet. 2021. Environmental context alters the magnitude of conspecific negativedensity dependence in a temperate forest. *Ecosphere* [available here](https://esajournals.onlinelibrary.wiley.com/doi/pdfdirect/10.1002/ecs2.3406)**

Manuscript abstract:
Conspecific negative density dependence (CNDD) is an important driver of stand-level tree diversity in temperate forests. CNDD can occur via two main processes. First, soil pathogens and herbivores form a halo of high enemy density surrounding established trees at local spatial scales. As a result, seedlings and saplings residing within this halo experience reduced growth and survival. Second, intraspecific competition can lead to local depletion of resources, reducing the performance of conspecific seedlings and saplings, and encouraging spatial mixing of tree species.

While seedlings and saplings respond to nearby conspecific adults, they are simultaneously responding to local environmental conditions. Solar radiation, soil moisture, and soil nutrients can all influence tree recruitment patterns. Furthermore, these environmental factors can influence densities and activities of soil pathogens, as well as seedling and sapling carbon balance. As a result, we expect small-scale variation in the abiotic environment to influence the magnitude of CNDD, although this expectation has thus far received little attention.

We combined tree stem and environmental data from a mapped oak-hickory forest plot to evaluate whether the local environment modulates the direction or magnitude of negative density dependence. We tested for the interaction between conspecific and heterospecific basal area within a sapling's neighborhood and each of five environmental covariates: index of canopy gaps, soil organic matter, soil cations, topographic curvature, and topographic slope/aspect.

We found that increasing local conspecific and heterospecific basal areas reduced sapling growth, and that the conspecific basal area reduced sapling growth more so than did heterospecific basal area. Furthermore, we observed significant interactions between adult tree density and all environmental covariates that differed depending on the category of nearby adults (i.e., conspecific vs. heterospecific), and this effect was most important with variations in soil organic matter, soil cations, and topographic slope/aspect.

We conclude that tree basal area not only interacts with environmental conditions to influence sapling growth, but more importantly, that small-scale environmental conditions interact with the density of nearby conspecifics to modulate sapling growth. Thus, if this result proves general, a central mechanism underlying the maintenance of diversity can be modified by small-scale environmental conditions.

