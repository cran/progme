## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----setup--------------------------------------------------------------------
library(progme)
data(parkinsons_simulated)

fit <- tryCatch(
  pmrm_joint(updrs ~ time * trt,
             Surv(time_to_dropout, dropout) ~ trt,
             data = parkinsons_simulated,
             association = "current_value",
             surv_model = "weibull"),
  error = function(e) e
)
if (!inherits(fit, "error")) {
  s <- summary(fit)
  str(s$association_coefficients)
} else {
  message("Demo fit skipped: ", conditionMessage(fit))
}

