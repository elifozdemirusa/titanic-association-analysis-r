# Titanic Association Analysis (Apriori in R)

This project demonstrates association rule mining using the Apriori algorithm on the classic Titanic dataset.

The goal is to explore hidden relationships between passenger characteristics (class, sex, age) and survival outcomes, using interpretable rule-based analytics.

## What This Project Shows
- Data transformation from aggregated format to transactional data
- Association rule mining using Apriori
- Rule evaluation using support, confidence, and lift
- Redundant rule pruning
- Rule visualization for interpretability

## Dataset
- Built-in `Titanic` dataset from base R
- Reconstructed so that each row represents an individual passenger

## Tools & Libraries
- R
- `arules`
- `arulesViz`

## Key Insights (Examples)
- Female passengers in higher classes show strong association with survival
- Male passengers in lower classes are strongly associated with non-survival
- Lift-based ranking highlights the most meaningful survival patterns

## Files
- `titanic_apriori_analysis.R` — complete analysis pipeline

## Author
Elif Ozdemir
