# Bernoulli Estimation: Random Simulation & Analysis in R

### Project Overview
This project simulates a random variable from a Bernoulli distribution and performs detailed inferential statistical analysis in R. Key techniques include Maximum Likelihood Estimation (MLE) and Method of Moments Estimation (MME) for estimating the probability of success. Additionally, the study explores characteristics of the distribution, verifies properties of good estimators, and assesses mean square error and bias across different sample sizes.

### Problem Statement
The objectives of this analysis include:
- Estimating parameters of a simulated Bernoulli distribution using MLE and MME.
- Exploring distribution characteristics such as skewness, kurtosis, density, and cumulative distribution functions.
- Verifying the estimators' unbiasedness, efficiency, and consistency.
- Calculating mean square estimate and bias.
- Analyzing the behavior of mean square error and bias as sample size increases.

### Methodology
- **Data Generation**: Simulated observations from a Bernoulli distribution using `rbinom` in R.
- **Parameter Estimation**: Probability of success estimated via MLE and MME.
- **Distribution Characteristics**: Analysis of skewness, kurtosis, histogram, density, and distribution functions.
- **Estimator Properties**: Validating the estimates' unbiasedness, efficiency, and consistency.
- **Mean Square Estimate and Bias**: Calculation of bias and error.
- **Effect of Sample Size**: Evaluation of how mean square error and bias evolve with increasing sample size.

### Code and Analysis
The R code for this analysis includes functions for:
1. Simulating Bernoulli variables.
2. Calculating MLE and MME estimates.
3. Plotting distribution characteristics.
4. Computing and visualizing mean square error and bias variations.

### Results & Conclusion
Key findings include:
- Accurate parameter estimation using MLE and MME.
- Characteristics and properties of the Bernoulli distribution displayed through statistical metrics and plots.
- Insights into the decrease of mean square error and bias with increasing sample sizes, supporting the efficiency and consistency of the estimators.

---
