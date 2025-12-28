# Titanic Survival Association Analysis (R)

This project analyzes Titanic passenger survival patterns using
association rule mining (Apriori algorithm) in R.

##  Objective
To discover meaningful relationships between passenger attributes
(Class, Sex, Age) and survival outcomes.

## Tools & Libraries
- R
- arules
- arulesViz

## Dataset
- Titanic dataset (built-in R dataset)

##  Methodology
- Data preprocessing
- Association rule mining (Apriori)
- Rule pruning (removal of redundant rules)
- Visualization of rules

## Key Findings
- Female passengers in 1st class had a very high survival probability  
- Key rule: `{Class=1st, Sex=Female} → {Survived=Yes}`  
  - Confidence ≈ 97%  
  - Lift ≈ 3.0  

##  How to Run
```r
install.packages(c("arules", "arulesViz"))
source("titanic_analysis.R")

Author

Elif Ozdemir
Business Analytics

