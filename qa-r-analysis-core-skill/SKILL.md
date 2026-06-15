---
name: qa-r-analysis-core-skill
description: Shared QA analysis workflow for R. Use when Codex must run or design quality analysis in R, choose current packages, validate data, check installed libraries, search official documentation, and produce reproducible QA outputs for SPC, MSA, capability, FMEA, CAPA, Pareto, AQL, inspection, or DOE tasks.
---

# QA R Analysis Core

## Purpose

Use this skill as the shared foundation for QA analyses in R. Pair it with the specialist skill for the actual method, then use this skill to choose packages, validate data, keep code reproducible, and avoid stale documentation.

## Automatic Preflight

Run this preflight by default for QA analysis requests that involve data, R code, package choice, or a deliverable report. Do not wait for the user to explicitly ask for package checks, documentation checks, method selection, or an execution plan.

Automatically:

1. Inspect available data and infer the likely QA analysis family.
2. Check whether required R packages are installed when local R execution is available.
3. Verify current official documentation when package choice, function syntax, or analysis method may have changed.
4. Select the most appropriate active package or base R workflow and identify a fallback.
5. Draft the analysis plan before writing final code unless the user asks for code-only output.
6. Ask only for missing information that blocks the decision, such as absent spec limits, missing response variable, or unclear study design.

## Core Workflow

1. Clarify the QA question, response variable, process context, unit of analysis, available stratification columns, and required decision.
2. Inspect the data structure before running any method. Check missing values, duplicates, impossible values, sample size, units, timestamps, subgroups, lot boundaries, and mixed populations.
3. Select R packages from current official sources. Prefer CRAN pages, CRAN Task Views, package reference manuals, pkgdown sites, and vignettes. Avoid archived packages unless the user explicitly accepts the risk.
4. Check installed packages locally before proposing installation. Use `scripts/qa_r_package_check.R` when helpful.
5. Write R code that is reproducible from a clean session: load packages, declare inputs, validate assumptions, run the analysis, save tables/plots if requested, and print a concise QA interpretation.
6. When the user asks for a deliverable report, invoke `qa-quarto-report-skill` to create a Quarto `.qmd` and render HTML, Word, or PDF.
7. Separate statistical evidence from operational judgment. State assumptions, limitations, risks, and recommended actions.

## Package Selection Rules

Read `references/package-selection.md` when the package choice matters, when documentation may have changed, or when several R packages could fit the task.

Use this order:

1. Official package documentation and vignettes.
2. Active CRAN packages and CRAN Task Views.
3. Installed package help pages when internet access is not available.
4. User-approved legacy or archived packages only when no active option exists.

Do not hard-code a package choice when the task is ambiguous. Explain the selection briefly and mention the fallback.

## Data Contract

Read `references/qa-analysis-contract.md` before building analysis code for user-provided data, especially if column names, specs, subgrouping, or lot structure are unclear.

The final answer should normally include:

- data checks performed;
- package and method selected;
- R code or created script path;
- Quarto report path when requested;
- key numeric results;
- QA interpretation;
- assumptions and recommended next action.

## Reusable Script

Use `scripts/qa_r_package_check.R` to inspect whether common QA packages are installed and report their versions. The script uses base R only.
