# ============================================================
# Student Performance Analytics with R
# Script 05 - Data Visualizations
# Author: Jorgelina Etchevest
# ============================================================

# ------------------------------------------------------------
# Load project data
# ------------------------------------------------------------

source(here::here("scripts", "01_data_import.R"))

# ------------------------------------------------------------
# Variable used in this analysis
# ------------------------------------------------------------

study_hours <- student_data$`TIEMPO SEMANAL en HS. DEDIC. EST.`

satisfaction <- student_data$`SATISFACCIÓN CON LA CARRERA`

png(
  filename = here(
    "images",
    "study_hours_histogram.png"
  ),
  width = 1000,
  height = 700,
  res = 150
)

hist(
  
  study_hours,
  
  col = "steelblue",
  
  border = "white",
  
  main = "Distribution of Weekly Study Hours",
  
  xlab = "Hours per Week"
  
)

dev.off()

png(
  filename = here(
    "images",
    "career_satisfaction_bar_chart.png"
  ),
  width = 1000,
  height = 700,
  res = 150
)

barplot(
  
  table(satisfaction),
  
  col = "darkgreen",
  
  main = "Career Satisfaction",
  
  ylab = "Students"
  
)

dev.off()

png(
  filename = here(
    "images",
    "study_hours_boxplot.png"
  ),
  width = 1000,
  height = 700,
  res = 150
)

boxplot(
  
  study_hours,
  
  col = "orange",
  
  main = "Weekly Study Hours"
  
)

dev.off()

cat("\n")
cat("=========================================\n")
cat("VISUALIZATIONS CREATED\n")
cat("=========================================\n\n")

cat("Images saved in the images folder.\n")