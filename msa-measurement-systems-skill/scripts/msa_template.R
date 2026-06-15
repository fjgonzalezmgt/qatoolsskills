#!/usr/bin/env Rscript

# Balanced crossed continuous Gage R&R template using base R.
# Edit the input section before use.

input_path <- "msa_data.csv"
part_col <- "part"
operator_col <- "operator"
trial_col <- "trial"
value_col <- "value"
tolerance <- NA_real_

data <- read.csv(input_path, stringsAsFactors = FALSE)
data[[part_col]] <- factor(data[[part_col]])
data[[operator_col]] <- factor(data[[operator_col]])
data[[trial_col]] <- factor(data[[trial_col]])

formula_text <- sprintf(
  "%s ~ %s * %s",
  value_col, part_col, operator_col
)

fit <- aov(as.formula(formula_text), data = data)
print(summary(fit))

means_by_part <- aggregate(data[[value_col]], list(part = data[[part_col]]), mean)
names(means_by_part)[2] <- "mean"

means_by_operator <- aggregate(data[[value_col]], list(operator = data[[operator_col]]), mean)
names(means_by_operator)[2] <- "mean"

cat("\nPart means:\n")
print(means_by_part)
cat("\nOperator means:\n")
print(means_by_operator)

cat("\nNotes:\n")
cat("- Use a dedicated MSA package or variance-component model for final AIAG-style GRR metrics.\n")
cat("- Inspect part:operator interaction before accepting the system.\n")
if (!is.na(tolerance)) {
  cat(sprintf("- Tolerance supplied: %s\n", tolerance))
}
