# ============================================================
# Student Performance Analytics with R
# Script 04 - Sampling Analysis
# Author: Jorgelina Etchevest
# ============================================================

# ------------------------------------------------------------
# Load project data
# ------------------------------------------------------------

source(here::here("scripts", "01_data_import.R"))

# ------------------------------------------------------------
# Variable used in this analysis
# ------------------------------------------------------------

weight_kg <- student_data$`PESO KG.`

# ------------------------------------------------------------
# Population Statistics
# ------------------------------------------------------------

population_mean <- mean(weight_kg, na.rm = TRUE)

population_sd <- sd(weight_kg, na.rm = TRUE)

population_size <- length(weight_kg)

# ------------------------------------------------------------
# Sampling Configuration
# ------------------------------------------------------------

set.seed(123)

number_of_samples <- 6

sample_size <- 20

# ------------------------------------------------------------
# Generate Random Samples
# ------------------------------------------------------------

sample_means <- replicate(
  
  number_of_samples,
  
  {
    
    sample_data <- sample(
      
      weight_kg,
      
      size = sample_size,
      
      replace = FALSE
      
    )
    
    mean(sample_data)
    
  }
  
)
# ------------------------------------------------------------
# Sampling Summary
# ------------------------------------------------------------

mean_of_sample_means <- mean(sample_means)

sd_sample_means <- sd(sample_means)

# ------------------------------------------------------------
# Sampling Results
# ------------------------------------------------------------

sampling_results <- data.frame(
  
  Sample = paste(
    
    "Sample",
    
    1:number_of_samples
    
  ),
  
  Mean = round(sample_means,3)
  
)

sampling_results

summary_sampling <- data.frame(
  
  Statistic = c(
    
    "Population Mean",
    
    "Mean of Sample Means",
    
    "Difference",
    
    "Standard Deviation of Sample Means"
    
  ),
  
  Value = round(
    
    c(
      
      population_mean,
      
      mean_of_sample_means,
      
      abs(
        
        population_mean -
          
          mean_of_sample_means
        
      ),
      
      sd_sample_means
      
    ),
    
    3
    
  )
  
)

summary_sampling

write.csv(
  
  sampling_results,
  
  here(
    
    "reports",
    
    "sampling_results.csv"
    
  ),
  
  row.names = FALSE
  
)

write.csv(
  
  summary_sampling,
  
  here(
    
    "reports",
    
    "sampling_summary.csv"
    
  ),
  
  row.names = FALSE
  
)

cat("\n")

cat("=========================================\n")

cat("SAMPLING ANALYSIS\n")

cat("=========================================\n\n")

cat(
  
  "Population mean:",
  
  round(population_mean,3),
  
  "\n"
  
)

cat(
  
  "Average of sample means:",
  
  round(mean_of_sample_means,3),
  
  "\n"
  
)

cat(
  
  "Absolute difference:",
  
  round(
    
    abs(
      
      population_mean -
        
        mean_of_sample_means
      
    ),
    
    3
    
  ),
  
  "\n"
  
)

