#!/usr/bin/env Rscript

# Template for SPC analysis. Edit the input section before use.

input_path <- "data.csv"
value_col <- "value"
time_col <- NULL
subgroup_col <- NULL
chart_type <- "auto"

require_package <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    stop(sprintf("Package '%s' is required. Ask for approval before installing it.", pkg))
  }
}

select_chart <- function(data, value_col, subgroup_col = NULL, chart_type = "auto") {
  if (chart_type != "auto") return(chart_type)
  if (is.null(subgroup_col)) return("xbar.one")
  subgroup_sizes <- table(data[[subgroup_col]])
  if (all(subgroup_sizes == 1)) return("xbar.one")
  if (max(subgroup_sizes) <= 10) return("xbar")
  "xbar"
}

run_spc <- function(data, value_col, subgroup_col = NULL, chart_type = "auto") {
  require_package("qcc")
  selected <- select_chart(data, value_col, subgroup_col, chart_type)
  values <- data[[value_col]]

  if (selected == "xbar.one") {
    chart <- qcc::qcc(values, type = "xbar.one", plot = TRUE)
  } else {
    groups <- qcc::qcc.groups(values, data[[subgroup_col]])
    chart <- qcc::qcc(groups, type = selected, plot = TRUE)
  }

  list(
    chart_type = selected,
    center = chart$center,
    limits = chart$limits,
    violations = chart$violations
  )
}

data <- read.csv(input_path, stringsAsFactors = FALSE)
result <- run_spc(data, value_col, subgroup_col, chart_type)
print(result)
