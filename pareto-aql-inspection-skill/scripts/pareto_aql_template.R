#!/usr/bin/env Rscript

# Pareto and simple acceptance sampling helpers using base R.

pareto_table <- function(data, category_col, count_col = NULL) {
  if (is.null(count_col)) {
    counts <- as.data.frame(table(data[[category_col]]), stringsAsFactors = FALSE)
    names(counts) <- c("category", "count")
  } else {
    counts <- aggregate(data[[count_col]], list(category = data[[category_col]]), sum)
    names(counts)[2] <- "count"
  }
  counts <- counts[order(-counts$count), ]
  counts$percent <- counts$count / sum(counts$count)
  counts$cum_percent <- cumsum(counts$percent)
  counts
}

oc_single_binomial <- function(n, c, p_values = seq(0, 0.20, by = 0.005)) {
  data.frame(
    defect_rate = p_values,
    probability_accept = pbinom(c, size = n, prob = p_values)
  )
}

# Example use:
# defects <- read.csv("defects.csv")
# print(pareto_table(defects, "defect_type"))
# print(oc_single_binomial(n = 80, c = 2))

cat("Load this script with source() and call pareto_table() or oc_single_binomial().\n")
