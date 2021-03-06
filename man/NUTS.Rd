% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nuts.R
\name{NUTS}
\alias{NUTS}
\title{No-U-Turn sampler}
\usage{
NUTS(theta, f, grad_f, n_iter, M_diag = NULL, M_adapt = 200, delta = 0.5,
  max_treedepth = 15, eps = 1, verbose = TRUE)
}
\arguments{
\item{theta}{Starting parameter vector.}

\item{f}{log posterior function.}

\item{grad_f}{gradient of the log posterior.}

\item{n_iter}{Number of MCMC iterations.}

\item{M_diag}{Diagonal elements of the HMC mass matrix.}

\item{M_adapt}{Parameter M_adapt in algorithm 6 in the NUTS paper.}

\item{delta}{Target acceptance ratio, defaults to 0.5.}

\item{max_treedepth}{Maximum depth of the binary trees constructed by NUTS.}

\item{eps}{Starting guess for epsilon.}

\item{verbose}{Print diagnostic output.}
}
\value{
Returns a matrix where each row is a sample and each column a parameter.
}
\description{
No U-Turn sampler for Hamiltonian Monte Carlo.
}
\details{
This is a pure R implementation of algorithm 6 of Hoffman and
Gelman (2014).  The user must provide a function to evaluate the
log posterior and a function to evaluate the gradient of the log
posterior with respect to the model parameters.  Each must take a
vector of parameters as its only argument.
}
\examples{
## Sample from a bivariate Normal
V <- matrix(c(2,1,1,1),2,2)
VI <- solve(V)
mu <- c(1,2)
## Log posterior and gradient
logp <- function(x) -1/2*drop((x-mu)\%*\%VI\%*\%(x-mu))
logp.gr <- function(x) -as.vector(VI\%*\%(x-mu))
s <- NUTS(c(1,1),logp,logp.gr,1000)
colMeans(s)
cov(s)

}
\references{
Hoffman, M. D., & Gelman, A. (2014). The No-U-turn sampler:
  adaptively setting path lengths in Hamiltonian Monte
  Carlo. Journal of Machine Learning Research, 15(1), 1593-1623.
}
