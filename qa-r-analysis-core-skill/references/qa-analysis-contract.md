# QA Analysis Data Contract

Use this checklist before generating R code for QA analyses.

## Required Context

- Business question and decision to make.
- Product, process, line, station, lot, supplier, or family.
- Response variable and units.
- Spec limits, target, or acceptance criteria when relevant.
- Data granularity: part, measurement, subgroup, lot, defect, run, trial, operator, inspector.
- Time order or run order when stability or DOE matters.
- Stratification columns such as line, shift, cavity, machine, operator, material batch, supplier, or lot.

## Data Checks

- Confirm column names and data types.
- Count rows and unique observational units.
- Check missing, duplicated, impossible, censored, rounded, or manually entered values.
- Separate numeric measurements from attribute defects.
- Check whether multiple populations have been pooled.
- Keep original data unchanged and create an analysis-ready object.

## Output Contract

Return a concise structure:

- `Data readiness`: what was checked and what could bias the result.
- `Method`: package, function family, and why selected.
- `Results`: key tables, charts, models, or indices.
- `QA interpretation`: pass/fail, stable/unstable, capable/not capable, priority/risk, or action.
- `Limitations`: missing context, assumption failures, sample size issues.
- `Next action`: containment, more data, stratification, confirmation, or control update.
