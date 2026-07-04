# ============================================================
# Student Performance Analytics with R
# Script 01 - Data Import and Preparation
# Author: Jorgelina Etchevest
# ============================================================

# ------------------------------------------------------------
# Load required libraries
# ------------------------------------------------------------

if (!require(readxl)) install.packages("readxl")
if (!require(here)) install.packages("here")

library(readxl)
library(here)

# ------------------------------------------------------------
# Import dataset
# ------------------------------------------------------------

student_data <- read_excel(
  here("data", "student_survey.xlsx")
)

# ------------------------------------------------------------
# Prepare categorical variables
# ------------------------------------------------------------

student_data$`SATISFACCIÓN CON LA CARRERA` <- factor(
  student_data$`SATISFACCIÓN CON LA CARRERA`,
  levels = c(1, 2, 3, 4),
  labels = c(
    "Very satisfied",
    "Satisfied",
    "Dissatisfied",
    "Very dissatisfied"
  ),
  ordered = TRUE
)
# ------------------------------------------------------------
# Dataset overview
# ------------------------------------------------------------

head(student_data)

str(student_data)

summary(student_data)

# ------------------------------------------------------------
# Missing values
# ------------------------------------------------------------

colSums(is.na(student_data))

