---
name: pareto-aql-inspection-skill
description: Pareto, AQL, sampling, and inspection analysis in R. Use for defect prioritization, Pareto charts, category stratification, inspection planning, acceptance sampling, single or double sampling plans, lot disposition, OC curves, producer risk, customer risk, and inspection recommendations.
---

# Pareto AQL Inspection

## Workflow

Start automatically with the `qa-r-analysis-core-skill` preflight when data or R output is involved: validate data readiness, check installed packages, verify current documentation if needed, select the package/workflow, and outline the analysis plan before final code.

1. Identify whether the task is Pareto prioritization, AQL sampling, or both.
2. For Pareto, validate categories, counts, severity, cost, escape risk, and stratification fields.
3. Build Pareto tables and charts by count, cost, risk, or weighted priority as appropriate.
4. For AQL, confirm lot size, inspection level, AQL, inspection severity, sampling type, defect class, acceptance number, and rejection number.
5. Evaluate sampling risk using OC curves or binomial/hypergeometric approximation when package support is unavailable.
6. Interpret inspection decisions separately from process capability. Passing a sample does not prove the process is capable.

## Deliverables

Return Pareto priority, recommended focus area, sampling plan, acceptance/rejection rule, risk interpretation, and limitations.

## Resources

- `references/pareto-aql-guide.md`: defect prioritization and AQL interpretation rules.
- `scripts/pareto_aql_template.R`: base R Pareto and simple OC curve helpers.
