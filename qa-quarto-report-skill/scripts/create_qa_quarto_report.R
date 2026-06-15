#!/usr/bin/env Rscript

usage <- function() {
  cat("Usage:\n")
  cat("  Rscript create_qa_quarto_report.R --template qa-analysis-report --output report.qmd --title \"Title\" --analysis \"Capability\" --author \"QA\" --process \"Line 1\" --data data.csv\n")
}

args <- commandArgs(trailingOnly = TRUE)
if (length(args) == 0 || any(args %in% c("-h", "--help"))) {
  usage()
  quit(status = 0)
}

`%||%` <- function(x, y) {
  if (is.null(x) || length(x) == 0 || is.na(x)) y else x
}

read_arg <- function(flag, default = "") {
  idx <- which(args == flag)
  if (length(idx) == 0 || idx == length(args)) return(default)
  args[[idx + 1]]
}

template_name <- read_arg("--template", "qa-analysis-report")
output_path <- read_arg("--output", "qa_report.qmd")
title <- read_arg("--title", "QA Analysis Report")
analysis <- read_arg("--analysis", "QA Analysis")
author <- read_arg("--author", Sys.info()[["user"]])
process <- read_arg("--process", "Process TBD")
data_path <- read_arg("--data", "")
revision <- read_arg("--revision", "0")
date_value <- read_arg("--date", as.character(Sys.Date()))

cmd_args <- commandArgs(FALSE)
file_arg <- cmd_args[grep("^--file=", cmd_args)]
script_path <- sub("^--file=", "", file_arg[1] %||% "")
script_dir <- if (nzchar(script_path)) {
  dirname(normalizePath(script_path, winslash = "/", mustWork = FALSE))
} else {
  getwd()
}
skill_dir <- normalizePath(file.path(script_dir, ".."), winslash = "/", mustWork = FALSE)
template_path <- file.path(skill_dir, "assets", "templates", paste0(template_name, ".qmd"))

if (!file.exists(template_path)) {
  stop(sprintf("Template not found: %s", template_path))
}

content <- paste(readLines(template_path, warn = FALSE), collapse = "\n")
replacements <- c(
  "{{TITLE}}" = title,
  "{{ANALYSIS_TYPE}}" = analysis,
  "{{AUTHOR}}" = author,
  "{{DATE}}" = date_value,
  "{{PROCESS}}" = process,
  "{{DATA_PATH}}" = data_path,
  "{{REVISION}}" = revision
)

for (key in names(replacements)) {
  content <- gsub(key, replacements[[key]], content, fixed = TRUE)
}

output_dir <- dirname(normalizePath(output_path, winslash = "/", mustWork = FALSE))
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)
writeLines(content, output_path, useBytes = TRUE)

style_source <- file.path(skill_dir, "assets", "styles", "qa-report.css")
style_dir <- file.path(output_dir, "styles")
if (file.exists(style_source)) {
  dir.create(style_dir, recursive = TRUE, showWarnings = FALSE)
  invisible(file.copy(style_source, file.path(style_dir, "qa-report.css"), overwrite = TRUE))
}

cat(sprintf("Created Quarto report: %s\n", normalizePath(output_path, winslash = "/", mustWork = FALSE)))
