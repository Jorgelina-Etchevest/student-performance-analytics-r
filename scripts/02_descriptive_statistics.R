# ============================================================
# Student Performance Analytics with R
# Script 02 - Descriptive Statistics
# Author: Jorgelina Etchevest
# ============================================================

# ------------------------------------------------------------
# Load project data
# ------------------------------------------------------------

source(here::here("scripts", "01_data_import.R"))

# ------------------------------------------------------------
# Variables used in this analysis
# ------------------------------------------------------------

study_hours <- student_data$`TIEMPO SEMANAL en HS. DEDIC. EST.`
satisfaction <- student_data$`SATISFACCIÓN CON LA CARRERA`

# ------------------------------------------------------------
# Continuous Variable:
# Weekly Study Hours
# ------------------------------------------------------------

# Number of classes (Sturges' Rule)
n <- length(study_hours)

num_classes <- ceiling(1 + 3.322 * log10(n))

# Range and class width
value_range <- range(study_hours)

class_width <- ceiling(
  (value_range[2] - value_range[1]) / num_classes
)

# Class intervals
breaks <- seq(
  floor(value_range[1]),
  ceiling(value_range[2]) + class_width,
  by = class_width
)

classes <- cut(
  study_hours,
  breaks = breaks,
  right = FALSE
)

class_midpoints <- (
  head(breaks, -1) +
    tail(breaks, -1)
) / 2

# Frequency table
frequency_table <- table(classes)

cumulative_frequency <- cumsum(frequency_table)

relative_frequency <- prop.table(frequency_table)

cumulative_relative_frequency <- cumsum(relative_frequency)

continuous_frequency_table <- data.frame(
  Interval = levels(classes),
  Midpoint = class_midpoints,
  Frequency = as.vector(frequency_table),
  Cumulative_Frequency = as.vector(cumulative_frequency),
  Relative_Frequency = round(as.vector(relative_frequency),4),
  Cumulative_Relative_Frequency = round(as.vector(cumulative_relative_frequency),4)
)

continuous_frequency_table

# ------------------------------------------------------------
# Ordinal Categorical Variable:
# Career Satisfaction Level
# ------------------------------------------------------------

satisfaction_frequency <- table(satisfaction)

satisfaction_relative_frequency <- prop.table(satisfaction_frequency)

satisfaction_cumulative_frequency <- cumsum(satisfaction_frequency)

satisfaction_cumulative_relative_frequency <- cumsum(satisfaction_relative_frequency)

satisfaction_frequency_table <- data.frame(
  Category = names(satisfaction_frequency),
  Frequency = as.vector(satisfaction_frequency),
  Cumulative_Frequency = as.vector(satisfaction_cumulative_frequency),
  Relative_Frequency = round(as.vector(satisfaction_relative_frequency), 4),
  Cumulative_Relative_Frequency = round(as.vector(satisfaction_cumulative_relative_frequency), 4)
)

satisfaction_frequency_table

# ------------------------------------------------------------
# Export frequency tables
# ------------------------------------------------------------

write.csv(
  continuous_frequency_table,
  here("reports", "continuous_frequency_table.csv"),
  row.names = FALSE
)

write.csv(
  satisfaction_frequency_table,
  here("reports", "career_satisfaction_frequency_table.csv"),
  row.names = FALSE
)

# ------------------------------------------------------------
# Measures of Central Tendency
# ------------------------------------------------------------

frequencies <- as.vector(frequency_table)

mean_study_hours <-
  sum(class_midpoints * frequencies) /
  sum(frequencies)

# Mode

modal_class <- which.max(frequencies)

lower_limit_modal <- breaks[modal_class]

modal_frequency <- frequencies[modal_class]

previous_frequency <-
  ifelse(
    modal_class == 1,
    0,
    frequencies[modal_class - 1]
  )

next_frequency <-
  ifelse(
    modal_class == length(frequencies),
    0,
    frequencies[modal_class + 1]
  )

mode_study_hours <-
  lower_limit_modal +
  (
    (modal_frequency - previous_frequency) /
      (
        (modal_frequency - previous_frequency) +
          (modal_frequency - next_frequency)
      )
  ) *
  class_width

# Median

total_observations <- sum(frequencies)

median_position <- total_observations / 2

median_class <-
  which(cumulative_frequency >= median_position)[1]

lower_limit_median <- breaks[median_class]

previous_cumulative_frequency <-
  ifelse(
    median_class == 1,
    0,
    cumulative_frequency[median_class - 1]
  )

median_frequency <- frequencies[median_class]

median_study_hours <-
  lower_limit_median +
  (
    (median_position -
       previous_cumulative_frequency) /
      median_frequency
  ) *
  class_width
# ------------------------------------------------------------
# Measures of Dispersion
# ------------------------------------------------------------

variance_study_hours <-
  sum(
    frequencies *
      (class_midpoints - mean_study_hours)^2
  ) /
  (total_observations - 1)

standard_deviation <-
  sqrt(variance_study_hours)

coefficient_variation <-
  (
    standard_deviation /
      mean_study_hours
  ) * 100

# ------------------------------------------------------------
# Summary Statistics
# ------------------------------------------------------------

descriptive_statistics <- data.frame(
  
  Mean = round(mean_study_hours,2),
  
  Median = round(median_study_hours,2),
  
  Mode = round(mode_study_hours,2),
  
  Variance = round(variance_study_hours,2),
  
  Standard_Deviation = round(standard_deviation,2),
  
  Coefficient_of_Variation = round(coefficient_variation,2)
  
)

descriptive_statistics

# ------------------------------------------------------------
# Export Summary Statistics
# ------------------------------------------------------------

write.csv(
  descriptive_statistics,
  here("reports",
       "descriptive_statistics.csv"),
  row.names = FALSE
)

# ------------------------------------------------------------
# Key Statistical Insights
# ------------------------------------------------------------

cat("\n")
cat("=========================================\n")
cat("KEY STATISTICAL INSIGHTS\n")
cat("=========================================\n\n")

cat(
  "Average weekly study hours:",
  round(mean_study_hours,2),
  "\n"
)

cat(
  "Median weekly study hours:",
  round(median_study_hours,2),
  "\n"
)

cat(
  "Coefficient of variation:",
  round(coefficient_variation,2),
  "%\n"
)


