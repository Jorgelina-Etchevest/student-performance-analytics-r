# ============================================================
# Student Performance Analytics with R
# Script 03 - Probability Models
# Author: Jorgelina Etchevest
# ============================================================

# ------------------------------------------------------------
# Load project data
# ------------------------------------------------------------

source(here::here("scripts", "01_data_import.R"))

# ------------------------------------------------------------
# Variables used in this analysis
# ------------------------------------------------------------

satisfaction <- student_data$`SATISFACCIÓN CON LA CARRERA`
height_cm <- student_data$`ESTATURA CM.`

# ------------------------------------------------------------
# Binomial Distribution
# Student Satisfaction Scenarios
# ------------------------------------------------------------

satisfaction_frequency <- prop.table(table(satisfaction))

p_very_satisfied <- as.numeric(satisfaction_frequency["Very satisfied"])
p_satisfied <- as.numeric(satisfaction_frequency["Satisfied"])
p_dissatisfied <- as.numeric(satisfaction_frequency["Dissatisfied"])
p_very_dissatisfied <- as.numeric(satisfaction_frequency["Very dissatisfied"])

sample_size <- 16

prob_more_than_9_very_satisfied <- pbinom(
  9,
  sample_size,
  p_very_satisfied,
  lower.tail = FALSE
)

prob_between_4_and_8_satisfied <- pbinom(
  8,
  sample_size,
  p_satisfied
) - pbinom(
  3,
  sample_size,
  p_satisfied
)

prob_less_than_5_dissatisfied <- pbinom(
  4,
  sample_size,
  p_dissatisfied
)

prob_exactly_10_very_dissatisfied <- dbinom(
  10,
  sample_size,
  p_very_dissatisfied
)

binomial_results <- data.frame(
  Scenario = c(
    "More than 9 very satisfied students",
    "Between 4 and 8 satisfied students",
    "Less than 5 dissatisfied students",
    "Exactly 10 very dissatisfied students"
  ),
  Probability = round(
    c(
      prob_more_than_9_very_satisfied,
      prob_between_4_and_8_satisfied,
      prob_less_than_5_dissatisfied,
      prob_exactly_10_very_dissatisfied
    ),
    4
  )
)

binomial_results

# ------------------------------------------------------------
# Poisson Distribution
# Academic Support Demand Scenarios
# ------------------------------------------------------------

lambda_20_minutes <- 10
lambda_40_minutes <- 20
lambda_30_minutes <- 15

prob_at_least_6_queries <- ppois(
  5,
  lambda_20_minutes,
  lower.tail = FALSE
)

prob_at_most_12_queries <- ppois(
  12,
  lambda_40_minutes
)

prob_between_8_and_9_queries <- ppois(
  9,
  lambda_30_minutes
) - ppois(
  7,
  lambda_30_minutes
)

poisson_results <- data.frame(
  Scenario = c(
    "At least 6 queries in 20 minutes",
    "At most 12 queries in 40 minutes",
    "More than 7 and less than 10 queries in 30 minutes"
  ),
  Probability = round(
    c(
      prob_at_least_6_queries,
      prob_at_most_12_queries,
      prob_between_8_and_9_queries
    ),
    4
  )
)

poisson_results

# ------------------------------------------------------------
# Normal Distribution
# Student Height Analysis
# ------------------------------------------------------------

mean_height <- mean(height_cm, na.rm = TRUE)
sd_height <- sd(height_cm, na.rm = TRUE)

prob_height_at_least_179 <- pnorm(
  179,
  mean_height,
  sd_height,
  lower.tail = FALSE
)

prob_height_between_147_and_172 <- pnorm(
  172,
  mean_height,
  sd_height
) - pnorm(
  147,
  mean_height,
  sd_height
)

height_percentile_975 <- qnorm(
  0.975,
  mean_height,
  sd_height
)

normal_results <- data.frame(
  Scenario = c(
    "Height greater than or equal to 179 cm",
    "Height between 147 cm and 172 cm",
    "Height value exceeding 97.5% of observations"
  ),
  Result = round(
    c(
      prob_height_at_least_179,
      prob_height_between_147_and_172,
      height_percentile_975
    ),
    4
  )
)

normal_results

# ------------------------------------------------------------
# Export Probability Model Results
# ------------------------------------------------------------

write.csv(
  binomial_results,
  here::here("reports", "binomial_distribution_results.csv"),
  row.names = FALSE
)

write.csv(
  poisson_results,
  here::here("reports", "poisson_distribution_results.csv"),
  row.names = FALSE
)

write.csv(
  normal_results,
  here::here("reports", "normal_distribution_results.csv"),
  row.names = FALSE
)

# ------------------------------------------------------------
# Key Probability Insights
# ------------------------------------------------------------

cat("\n")
cat("=========================================\n")
cat("KEY PROBABILITY INSIGHTS\n")
cat("=========================================\n\n")

cat(
  "Probability of more than 9 very satisfied students:",
  round(prob_more_than_9_very_satisfied, 4),
  "\n"
)

cat(
  "Probability of at least 6 academic support queries in 20 minutes:",
  round(prob_at_least_6_queries, 4),
  "\n"
)

cat(
  "Probability of a student being at least 179 cm tall:",
  round(prob_height_at_least_179, 4),
  "\n"
)