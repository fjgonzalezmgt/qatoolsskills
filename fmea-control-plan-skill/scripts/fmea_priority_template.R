#!/usr/bin/env Rscript

# FMEA priority template. Input CSV columns expected:
# failure_mode, effect, cause, severity, occurrence, detection

input_path <- "fmea.csv"

fmea <- read.csv(input_path, stringsAsFactors = FALSE)
required <- c("failure_mode", "effect", "cause", "severity", "occurrence", "detection")
missing_cols <- setdiff(required, names(fmea))
if (length(missing_cols) > 0) {
  stop(sprintf("Missing required columns: %s", paste(missing_cols, collapse = ", ")))
}

fmea$rpn <- with(fmea, severity * occurrence * detection)
fmea$priority_band <- cut(
  fmea$rpn,
  breaks = c(-Inf, 99, 299, Inf),
  labels = c("monitor", "improve", "urgent")
)

fmea <- fmea[order(-fmea$severity, -fmea$rpn), ]
print(fmea[, c(required, "rpn", "priority_band")], row.names = FALSE)

cat("\nNotes:\n")
cat("- Use the organization's rating manual for final decisions.\n")
cat("- High severity items may require action even with moderate RPN.\n")
cat("- If AIAG-VDA action priority is required, use that table instead of these bands.\n")
