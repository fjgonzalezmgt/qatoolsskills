---
name: process-capability-skill
description: Process capability analysis in R for specifications, normality, stability, Cp, Cpk, Pp, Ppk, Cpm, PPM, unilateral or bilateral specs, nonnormal data, transformation decisions, and QA risk interpretation. Use when evaluating whether a process meets customer or engineering specification limits.
---

# Process Capability

## Workflow

Use `qa-r-analysis-core-skill` first when package selection, data readiness, or documentation checks are needed.

1. Confirm response variable, units, LSL, USL, target, and whether specs are bilateral or unilateral.
2. Check data readiness: missing values, rounding, outliers, mixed populations, sample size, and stratification columns.
3. Verify observed spec compliance: counts outside limits, percent outside, PPM, min, max, mean, median, and process centering.
4. Check stability before capability. If time order exists, use an SPC chart. If stability is unknown, flag capability as exploratory.
5. Check distribution shape and normality using plots and tests. Treat tests carefully for very small or very large samples.
6. Select method from `references/capability-decision-guide.md`.
7. Calculate capability or performance indices and interpret risk.

## Deliverables

Return spec compliance, stability status, normality/distribution decision, indices, observed and estimated PPM where appropriate, charts or code, QA interpretation, and recommended action.

## Resources

- `references/capability-decision-guide.md`: capability decision tree and interpretation.
- `scripts/capability_template.R`: base R capability summary for normal exploratory analysis.
