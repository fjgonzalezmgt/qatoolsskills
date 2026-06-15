#!/usr/bin/env Rscript

default_packages <- c(
  "qcc", "SixSigma", "AcceptanceSampling",
  "DoE.base", "FrF2", "rsm", "AlgDesign", "skpr",
  "dplyr", "tidyr", "ggplot2", "readr", "readxl",
  "openxlsx", "broom", "emmeans", "gt"
)

args <- commandArgs(trailingOnly = TRUE)
packages <- if (length(args) == 0) default_packages else args

installed <- as.data.frame(installed.packages(), stringsAsFactors = FALSE)

package_status <- do.call(
  rbind,
  lapply(packages, function(pkg) {
    row <- installed[installed$Package == pkg, , drop = FALSE]
    data.frame(
      package = pkg,
      installed = nrow(row) == 1,
      version = if (nrow(row) == 1) row$Version[[1]] else NA_character_,
      cran_url = paste0("https://CRAN.R-project.org/package=", pkg),
      stringsAsFactors = FALSE
    )
  })
)

print(package_status, row.names = FALSE)

missing <- package_status$package[!package_status$installed]
if (length(missing) > 0) {
  message("")
  message("Missing packages:")
  message(paste(missing, collapse = ", "))
  message("Install only after user approval, for example:")
  message("install.packages(c(", paste(sprintf('\"%s\"', missing), collapse = ", "), "))")
}
