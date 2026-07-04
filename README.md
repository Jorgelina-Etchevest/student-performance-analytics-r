# Student Performance Analytics with R

A reproducible R project that applies descriptive and inferential statistical techniques to analyze educational data, identify behavioral patterns, and generate insights that support evidence-based decision-making.

---

<p align="center">
  <img src="images/banner.png" alt="Student Performance Analytics Banner" width="100%">
</p>

---

# Project Overview

Educational institutions collect large volumes of student data every semester. Transforming this information into meaningful insights requires a structured statistical analysis process.

This project presents a complete analytical pipeline developed in **R**, combining descriptive statistics, probability models, sampling techniques, and data visualization to explore a real educational dataset.

Rather than presenting isolated statistical exercises, the project was designed as a complete analytical workflow following professional data analytics practices, ensuring reproducibility, maintainability, and clear project organization.

---

# Business Problem

Educational institutions frequently need reliable statistical evidence to better understand student characteristics, study habits, and overall satisfaction.

Questions such as:

- How much time do students dedicate to studying?
- How satisfied are students with their academic programs?
- How representative are random samples?
- Can statistical models support evidence-based decision-making?

require more than descriptive reports—they require a structured analytical workflow.

The ability to answer these questions enables educational institutions to better understand student behavior and make data-informed decisions.

---

# Project Objectives

- Import and prepare educational data.
- Perform descriptive statistical analysis.
- Apply probability distributions.
- Evaluate sampling techniques.
- Generate automated statistical reports.
- Produce publication-quality visualizations.
- Organize the complete workflow following professional data analytics practices.

---

# Dataset

The analysis uses a dataset containing information from **250 university students**.

| Variable | Description |
|-----------|-------------|
| Age | Student age |
| Gender | Student gender |
| Height | Height (cm) |
| Weight | Weight (kg) |
| Weekly Study Hours | Hours dedicated to studying |
| Weekly Food Expenses | Weekly food expenditure |
| Approved Courses | Number of completed courses |
| Career Satisfaction | Satisfaction level |
| Employment Status | Whether the student is employed |
| Smoking Habits | Smoking status |
| Number of Siblings | Household information |

---

# Analytical Workflow

<p align="center">
  <img src="images/workflow.png" alt="Project Workflow" width="90%">
</p>

The project follows a modular workflow where every stage of the analysis is implemented as an independent R script.

Executing the scripts sequentially automatically reproduces the complete analytical process, generating statistical reports and visualizations without requiring manual intervention.

---

# Repository Structure

```text
student-performance-analytics-r/

│
├── data/
│     student_survey.xlsx
│
├── scripts/
│     01_data_import.R
│     02_descriptive_statistics.R
│     03_probability_models.R
│     04_sampling_analysis.R
│     05_visualizations.R
│
├── reports/
│     Automatically generated CSV reports
│
├── images/
│     Banner
│     Workflow
│     Charts
│
└── README.md
```

---

# Statistical Methods

## Descriptive Statistics

- Frequency distributions
- Measures of central tendency
- Measures of dispersion
- Quartiles

---

## Probability Models

The project applies three fundamental probability distributions:

- Binomial Distribution
- Poisson Distribution
- Normal Distribution

These models demonstrate practical applications of statistical inference using educational data.

---

## Sampling Analysis

A Simple Random Sampling (SRS) approach is used to evaluate how accurately sample statistics estimate population parameters.

The analysis compares:

- Population Mean
- Sample Means
- Sampling Variability

This section demonstrates one of the core concepts of statistical inference.

---

## Data Visualization

The project automatically generates publication-ready visualizations, including:

- Histogram
- Bar Chart
- Boxplot

All figures are exported automatically to the **images** directory.

---

# Key Findings

The statistical analysis revealed several relevant patterns:

- Most students dedicate between **9 and 13 hours per week** to studying.
- Career satisfaction is predominantly classified as **Very Satisfied**.
- Sample means closely approximate the population mean, demonstrating the effectiveness of random sampling.
- Probability distributions provide a practical framework for modeling uncertainty in educational datasets.

---

# Generated Reports

Executing the analytical pipeline automatically generates statistical outputs in CSV format.

Generated reports include:

- Continuous Frequency Table
- Career Satisfaction Frequency Table
- Descriptive Statistics
- Binomial Distribution Results
- Poisson Distribution Results
- Normal Distribution Results
- Sampling Results
- Sampling Summary

All reports are generated automatically during project execution.

---

# Project Outputs

Executing the analytical pipeline automatically produces the following deliverables.

## Statistical Reports

- Frequency Tables
- Descriptive Statistics
- Probability Model Results
- Sampling Analysis Summaries

## Visual Assets

- Project Banner
- Analytical Workflow
- Histogram
- Bar Chart
- Boxplot

## Reproducible Analysis

The project is organized as a modular analytical pipeline where each script performs a specific stage of the statistical workflow.

Running the scripts sequentially reproduces the complete analysis, including data preparation, statistical calculations, report generation, and visualization outputs.

---

# Visualizations

## Weekly Study Hours Distribution

<p align="center">
<img src="images/study_hours_histogram.png" width="75%">
</p>

---

## Career Satisfaction

<p align="center">
<img src="images/career_satisfaction_bar_chart.png" width="75%">
</p>

---

## Weekly Study Hours Boxplot

<p align="center">
<img src="images/study_hours_boxplot.png" width="60%">
</p>

---

# Technologies

| Category | Technologies |
|-----------|--------------|
| Programming Language | R |
| Libraries | readxl, here |
| Statistical Methods | Descriptive Statistics, Inferential Statistics, Probability Theory, Sampling Theory |
| Data Visualization | Base R Graphics |

---

# Project Reproducibility

The project follows a modular structure to ensure reproducibility.

Executing the scripts sequentially automatically generates:

- Statistical summaries
- Frequency tables
- Probability analyses
- Sampling results
- Visualizations

No manual modification of intermediate files is required.

---

# How to Run

Clone the repository.

Open the project using **RStudio**.

Run the scripts in the following order:

```text
01_data_import.R

02_descriptive_statistics.R

03_probability_models.R

04_sampling_analysis.R

05_visualizations.R
```

The complete analytical workflow will automatically generate all reports and visualizations.

---

# Future Improvements

Potential future enhancements include:

- Interactive dashboards using Shiny
- Automated reports with R Markdown
- Additional statistical methods
- Enhanced exploratory visualizations

---

# Skills Demonstrated

This project demonstrates practical experience in:

- Data Cleaning
- Exploratory Data Analysis (EDA)
- Descriptive Statistics
- Inferential Statistics
- Probability Distributions
- Sampling Techniques
- Data Visualization
- Reproducible Research
- R Project Organization

---

# About the Author

**Jorgelina Etchevest**

Economist | Data Analytics 

Current areas of interest include:

- Data Analytics
- Business Intelligence
- Statistical Analysis
- Machine Learning

Explore additional projects on my GitHub profile.
