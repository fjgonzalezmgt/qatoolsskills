# R Package Selection For QA

Use this reference when choosing or justifying R packages for quality analysis. Prefer active packages with official documentation. If the task is current or package APIs may have changed, verify with CRAN, the package manual, vignettes, or pkgdown before writing final code.

## Baseline Packages

- Data import: `readr`, `readxl`, `openxlsx`, `data.table`.
- Data cleaning: `dplyr`, `tidyr`, `janitor`.
- Modeling and summaries: `stats`, `broom`, `emmeans`.
- Visualization: `ggplot2`, `patchwork`, `scales`.
- Reporting: `gt`, `knitr`, `rmarkdown`, `quarto`.

## QA Method Packages

- SPC and basic quality tools: `qcc`, `SixSigma`.
- Capability: `qcc`, `SixSigma`, plus distribution-specific packages only after checking documentation.
- MSA: `SixSigma` for continuous studies; use active agreement packages only after verifying current documentation for attribute studies.
- Acceptance sampling and AQL: `AcceptanceSampling`.
- DOE: `stats`, `DoE.base`, `FrF2`, `rsm`, `AlgDesign`, `skpr`, and selected CRAN Task View packages.
- FMEA, control plans, CAPA: prefer tidy data workflows with `dplyr`, `ggplot2`, and reporting packages; do not force a weak specialty package.

## Avoid Or Escalate

- Treat archived packages as risky. Do not use `qualityTools` as a default because it has been archived on CRAN.
- If a package has not been updated recently but still passes CRAN checks and has stable API, it may be acceptable for mature methods. Say so.
- If package installation is needed, ask for approval before installing.
- If internet access is blocked, use installed help pages and disclose that current documentation was not verified.

## Selection Output

When choosing packages, state:

1. selected package or packages;
2. why they fit the analysis;
3. current-source check performed or limitation;
4. fallback if the package is unavailable.
