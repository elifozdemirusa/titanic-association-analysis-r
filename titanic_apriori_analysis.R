############################################################
# Titanic Association Analysis (Apriori) - Full Script
# Author: Elif Ozdemir
############################################################

# -----------------------------
# Step 0: Install & load packages
# -----------------------------
if (!require(arules)) install.packages("arules")
if (!require(arulesViz)) install.packages("arulesViz")

library(arules)
library(arulesViz)

# -----------------------------
# Step 2a 
# -----------------------------
# NOTE:
# The Titanic dataset is built into base R.
# No external or private data sources are used.

# -----------------------------
# Step 3a: Reconstruct Titanic data (one row per person)
# -----------------------------
df <- as.data.frame(Titanic)

titanic.raw <- NULL
for (i in 1:4) {
  titanic.raw <- cbind(titanic.raw, rep(as.character(df[, i]), df$Freq))
}

titanic.raw <- as.data.frame(titanic.raw)
names(titanic.raw) <- names(df)[1:4]

# -----------------------------
# Step 4a: Dimensions
# -----------------------------
dim(titanic.raw)

# -----------------------------
# Step 5a: Random sample of 5 records
# -----------------------------
set.seed(123)
idx <- sample(1:nrow(titanic.raw), 5)
titanic.raw[idx, ]

# -----------------------------
# Step 6a: Convert ALL columns to factor + summary
# -----------------------------
titanic.raw[, 1] <- as.factor(titanic.raw[, 1])  # Class
titanic.raw[, 2] <- as.factor(titanic.raw[, 2])  # Sex
titanic.raw[, 3] <- as.factor(titanic.raw[, 3])  # Age
titanic.raw[, 4] <- as.factor(titanic.raw[, 4])  # Survived

summary(titanic.raw)

# -----------------------------
# Step 7a: Apriori default rules
# -----------------------------
rules.all <- apriori(titanic.raw)

# -----------------------------
# Step 8a: Inspect default rules
# -----------------------------
inspect(rules.all)

# -----------------------------
# Step 9a: Restricted rules (RHS only Survived=Yes/No), then sort by lift
# -----------------------------
rules <- apriori(
  titanic.raw,
  parameter  = list(minlen = 2, supp = 0.005, conf = 0.8),
  appearance = list(rhs = c("Survived=No", "Survived=Yes"), default = "lhs"),
  control    = list(verbose = FALSE)
)

rules.sorted <- sort(rules, by = "lift")

# -----------------------------
# Step 10a: Inspect sorted rules
# -----------------------------
inspect(rules.sorted)

# -----------------------------
# Step 11a: Inspect first 2 rules
# -----------------------------
inspect(rules.sorted[1:2])

# -----------------------------
# Step 11c: Inspect redundant rules
# -----------------------------
inspect(rules.sorted[is.redundant(rules.sorted)])

# -----------------------------
# Step 12a: Prune redundant rules and inspect
# -----------------------------
rules.pruned <- rules.sorted[!is.redundant(rules.sorted)]
inspect(rules.pruned)

# -----------------------------
# Step 14a: Scatter plot (rules.all)
# -----------------------------
cat("\nScatter Plot: Elif Ozdemir\n")
plot(rules.all, control = list(jitter = 0.2))

# -----------------------------
# Step 15a: Balloon plot (rules.sorted)
# -----------------------------
cat("\nBalloon Plot: Elif Ozdemir\n")
plot(rules.sorted, measure = "lift", shading = "confidence", method = "grouped")

# -----------------------------
# Step 16a: Graph plot (rules.pruned)
# -----------------------------
cat("\nGraph - Pruned Rules: Elif Ozdemir\n")
plot(rules.pruned, method = "graph", measure = "lift", shading = "support", control = list(max = 100))