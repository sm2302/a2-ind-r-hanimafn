# Load libraries ---------------------------------------------------------------
library(tidyverse)

##### Pareto Distribution
### goal : to use this distribution to find the 
### quantiles from the data set given

# Q1 ---------------------------------------------------------------------------

## This function returns the value of pdf of f

pareto_pdf <- function(x, alpha, beta) {
  if (alpha <= 0 | beta <= 0){
    stop("'alpha' or/and 'beta' is 'less than or equal to 0'")
  }
  if (x >= beta){
    pdf_of_f <- (alpha * beta^alpha)/x^(alpha + 1)
  }
  else if (x < beta){
    pdf_of_f <- 0
  }
  pdf_of_f
} 

# Q2 ---------------------------------------------------------------------------

## This function returns the value of the deviance function

pareto_dev <- function(alpha, beta, x){
  sum_of_log <- 0
  
  for (i in x){
    log_f <- log(pareto_pdf(i, alpha, beta))
    sum_of_log <- sum_of_log + log_f
  }
  dev_func <- -2 * sum_of_log
  dev_func
}

# Q3 ---------------------------------------------------------------------------

## This part of question focus on finding the MLE of:
# 'alpha_hat', which is the 'argmin of the deviance function' 
# 'beta_hat', which is the 'min of sample X'

X <- scan("19b2052.txt") 
n <- length(X) # The length of X 

beta_hat <- min(X)
alpha_hat <-n/( sum(log(X / beta_hat)) )

# Q4 ---------------------------------------------------------------------------

## This function returns the value of the cdf of F

pareto_cdf <- function(x, alpha, beta){
  cdf_of_F <- 1 - (beta / x)^alpha
  cdf_of_F
}

# Q5 ---------------------------------------------------------------------------

## This part of question is focusing on finding the values
## of the quantiles using the functions and values created 
## from the previous questions

B <- sample(5:n, 1) # generate a random number for length B
B                   # display the value of B  
 
# x is sampled randomly from X with length B
x_vals <- X %>%           
  sample(size = B) %>%  
  sort             

cdf_vals <- pareto_cdf(x_vals, alpha_hat, beta_hat)

# Find the values of q_i
#...............................................................................
i_1 <- which.min(abs(0.05 - cdf_vals))
q1 <- x_vals[i_1]

i_2 <- which.min(abs(0.25 - cdf_vals))
q2 <- x_vals[i_2]

i_3 <- which.min(abs(0.50 - cdf_vals))
q3 <- x_vals[i_3]

i_4 <- which.min(abs(0.75 - cdf_vals))
q4 <- x_vals[i_4]

i_5 <- which.min(abs(0.95 - cdf_vals))
q5 <- x_vals[i_5]
#...............................................................................

qvals <- c(q1, q2, q3, q4, q5)
qvals

################################################################################