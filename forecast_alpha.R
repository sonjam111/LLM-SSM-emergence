#This is the function that produces up to k-step ahead forecasts of the state vector and their mse's
#need the dkf output and the forecast horizon, k>0
#
forecast_alpha <- function(dkf.out, k){
  A <- dkf.out$Alast
  P <- dkf.out$Plast
  TT <- dkf.out$TT
  Z <- dkf.out$Z
  ncA0 <- dkf.out$ncA0
  gamma <- dkf.out$gamma.est
  mse.gamma <- dkf.out$mse.gamma
  sigma2 <- dkf.out$sigma2
  ncolZ <- ncol(Z)
  #
  Agamma <- A[,1:(ncA0-1)]
  alpha_hat <- matrix(-999,ncolZ,k)
  mse_alpha_hat <- matrix(-999,ncolZ,ncolZ*k)
  alpha <- A %*% matrix(c(-gamma, 1), ncA0, 1)
  alpha_hat[,1] <- alpha
  msealpha <- sigma2 * P + Agamma %*% mse.gamma %*% t(Agamma)
  mse_alpha_hat[, 1:ncolZ] <- msealpha
  if (k>1){
    for (i in 2:k){
      alpha_hat[,i] <- TT %*% alpha
      mse_alpha_hat[, ((i-1)*ncolZ+1) : (ncolZ*i) ] <- TT %*% msealpha %*% t(TT)
      TT <- TT %*% TT
    }
  }
  list(alpha_hat = alpha_hat, mse_alpha_hat = mse_alpha_hat)
} 


