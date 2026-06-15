#!/usr/bin/env Rscript

# CAPA effectiveness template.
# Input CSV can contain either:
# group,value for numeric before-after comparison, or
# group,defects,total for rate comparison.

input_path <- "capa_effectiveness.csv"
before_label <- "before"
after_label <- "after"

data <- read.csv(input_path, stringsAsFactors = FALSE)

if (all(c("group", "value") %in% names(data))) {
  before <- data$value[data$group == before_label]
  after <- data$value[data$group == after_label]
  cat("Numeric before-after summary:\n")
  print(aggregate(value ~ group, data, function(x) c(n = length(x), mean = mean(x), sd = sd(x))))
  if (length(before) >= 2 && length(after) >= 2) {
    print(t.test(before, after))
  } else {
    cat("Not enough observations for t-test.\n")
  }
} else if (all(c("group", "defects", "total") %in% names(data))) {
  by_group <- aggregate(cbind(defects, total) ~ group, data, sum)
  print(by_group)
  before <- by_group[by_group$group == before_label, ]
  after <- by_group[by_group$group == after_label, ]
  if (nrow(before) == 1 && nrow(after) == 1) {
    print(prop.test(c(before$defects, after$defects), c(before$total, after$total)))
  } else {
    cat("Need exactly one before and one after group after aggregation.\n")
  }
} else {
  stop("Expected columns group,value or group,defects,total.")
}

cat("\nInterpretation must consider process changes, inspection changes, and exposure volume.\n")
