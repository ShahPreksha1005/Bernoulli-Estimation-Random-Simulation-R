# Install and load the 'moments' package if not already installed
if (!requireNamespace("moments", quietly = TRUE)) {
  install.packages("moments")
}
library(moments)

#Random Variable Generation
# Simulate random variable from a Bernoulli distribution
set.seed(123)
sample_size <- 100
data_bernoulli <- rbinom(sample_size, size = 1, prob = 0.3) 


#a.Parameter Estimation:
# Maximum Likelihood Estimation (MLE)
mle_prob_bernoulli <- mean(data_bernoulli)

# Method of Moment Estimation (MME)
mme_prob_bernoulli <- mean(data_bernoulli)


#b. Characteristics of Simulated Random Variable:
# Skewness and Kurtosis
skewness_value <- skewness(data_bernoulli)

kurtosis_value <- kurtosis(data_bernoulli)

# Histogram
hist(data_bernoulli, main = "Histogram of Simulated Random Variable", xlab = "Value", col = "lightblue", border = "black")

# Density Function
curve(dbinom(x, size = 1, prob = mle_prob_bernoulli), col = "red", lwd = 2, add = TRUE)

# Distribution Function
curve(pbinom(x, size = 1, prob = mle_prob_bernoulli), col = "blue", lwd = 2, add = TRUE)


# c. Properties of Estimators

# Unbiasedness
bias_mle_prob <- mle_prob_bernoulli - 0.3  # True probability of success is 0.3
unbiasedness <- abs(bias_mle_prob) < 0.01  # Adjust tolerance as needed

# Efficiency (For MLE, it is asymptotically efficient)

# Consistency
sample_sizes <- seq(10, 1000, by = 10)
consistency <- numeric(length(sample_sizes))

for (i in seq_along(sample_sizes)) {
  subset_data <- rbinom(sample_sizes[i], size = 1, prob = 0.3)
  mle_prob <- mean(subset_data)
  consistency[i] <- abs(mle_prob - 0.3) < 0.01  # Adjust tolerance as needed
}

# Print results
cat("Unbiasedness of MLE Estimate:", unbiasedness, "\n")
cat("Efficiency of MLE Estimate: Asymptotically Efficient\n")

cat("Consistency of MLE Estimate:")
if (all(consistency)) {
  cat(" Consistent across different sample sizes\n")
} else {
  cat(" Not consistent across different sample sizes\n")
}

#d. Mean Square Estimate and Bias:
# Bias
bias_mle_prob <- mle_prob_bernoulli - 0.3  # True probability of success is 0.3

# Mean Square Estimate
mean_square_estimate_prob <- mean((data_bernoulli - mle_prob_bernoulli)^2)


#e. Mean Square Error and Bias with Increasing Sample Size:
# Initialize vectors to store results
sample_sizes <- seq(10, 1000, by = 10)
mse_values <- numeric(length(sample_sizes))
bias_values <- numeric(length(sample_sizes))

# Iterate over sample sizes
for (i in seq_along(sample_sizes)) {
  subset_data <- rbinom(sample_sizes[i], size = 1, prob = 0.3)
  mle_prob <- mean(subset_data)
  mse_values[i] <- mean((subset_data - mle_prob)^2)
  bias_values[i] <- mle_prob - 0.3
}


# Print results
cat("Random Variable Sample generated from a Bernoulli Distribution:",data_bernoulli,"\n")

cat("Maximum Likelihood Estimation (MLE) of Probability of Success:", mle_prob_bernoulli, "\n")
cat("Method of Moment Estimation (MME) of Probability of Success:", mme_prob_bernoulli, "\n\n")

cat("Skewness of Simulated Random Variable:", skewness_value, "\n")
cat("Kurtosis of Simulated Random Variable:", kurtosis_value, "\n\n")

cat("Bias of MLE Estimate:", bias_mle_prob, "\n")
cat("Mean Square Estimate of MLE:", mean_square_estimate_prob, "\n\n")

# e. Mean Square Error and Bias with Increasing Sample Size
plot(sample_sizes, mse_values, type = "l", main = "Mean Square Error vs. Sample Size",
     xlab = "Sample Size", ylab = "Mean Square Error")

plot(sample_sizes, bias_values, type = "l", main = "Bias vs. Sample Size",
     xlab = "Sample Size", ylab = "Bias")