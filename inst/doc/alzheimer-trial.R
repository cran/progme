## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----setup--------------------------------------------------------------------
library(progme)
data(adni_simulated)

fit <- tryCatch(
  pmrm_delayed(adas_cog ~ time * trt, data = adni_simulated,
               subject_var = "rid",
               delay_estimation = "profile",
               delay_grid = seq(0, 18, by = 3), lambda = 0.5),
  error = function(e) e
)
if (!inherits(fit, "error")) {
  print(fit)
  s <- summary(fit)
  head(s$t_table)
} else {
  message("Demo fit skipped: ", conditionMessage(fit))
}

