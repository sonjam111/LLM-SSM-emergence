# This function estimates the parameters of the local linear model.
# It uses the nlminb function to minimize  minus the log-likelihood with starting points over a grid.
# The starting point that produces the lowest value of minus the log-likelihood is used as a starting point to 
# minimize minus the log-likelihood and obtain the parameter estimates.
# input: ts_data is the time series data
# output: the optimal parameters (maximum likelihood)
#
par_est3 <- function(ts_data){
  YY <<- ts_data
  # define grid
  x1 <- c(0.001, 0.01, 0.1, 0.3)
  x2 <- x1
  x3 <- 0.9
  grid <- expand.grid(x1, x2, x3)
  #
  source("likelihoodLLMvard.R")
  min_out <- apply(grid, 1, lik.llm.vard)
  aux <- which.min(min_out)
  min_out_ts_data <- nlminb(grid[aux[1], ], lik.llm.vard, lower = c(-Inf, -Inf, 0.85), upper = c(0.5, 0.5, 1))$par
  as.numeric(min_out_ts_data)
}

