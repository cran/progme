## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----setup--------------------------------------------------------------------
library(progme)

## -----------------------------------------------------------------------------
p <- power_pmrm(n_per_arm = 100, effect_size = -0.5, delay = 6,
                n_sims = 50, seed = 1)
p[c("power", "bias", "non_convergence_rate")]

## -----------------------------------------------------------------------------
ss <- find_sample_size(target_power = 0.8, n_grid = c(80, 120),
                       effect_size = -0.5, delay = 6,
                       n_sims = 30, seed = 2)
ss$power_curve

