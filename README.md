# Statistical Tests in R

This project implements statistical tests in R to compare two numerical datasets. The script automatically selects the appropriate statistical test based on normality, variance, and pairing checks.

## Table of Contents
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Output](#output)
- [Example](#example)


## Features
- **Normality Check**: Uses the Shapiro-Wilk test.
- **Variance Equality Check**: Uses Levene's test (if normality holds).
- **Paired Data Check**: Determines whether the datasets are paired.
- **Statistical Tests**:
  - **Paired T-test** (if data is paired and normal)
  - **Student’s T-test** (if data is independent, normal, and variances are equal)
  - **Welch’s T-test** (if data is independent, normal, but variances are unequal)
  - **Mann-Whitney U Test** (if data is not normal)

## Requirements
- R (latest version)
- Required packages: `car`

## Installation
Install the required package before running the script:
```r
install.packages("car")
```

## Usage
Run the script in R:
```r
source("P6.R")
```

## Output
The script prints:
- Shapiro-Wilk test results
- Levene’s test result (if applicable)
- Pairing check result
- Final test result (T-test, Paired T-test, or Mann-Whitney U)

## Example
Sample datasets used in the script:
```r
A <- c(7, 8, 5, 16, 1, 14, 17, 15, 1, 16, 4, 7, 5, 12, 2)
B <- c(18, 5, 2, 5, 17, 1, 18, 1, 2, 7, 16, 11, 5, 15, 3)
```

The script automatically determines and executes the appropriate test based on these datasets.



