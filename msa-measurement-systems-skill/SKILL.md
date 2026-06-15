---
name: msa-measurement-systems-skill
description: Measurement systems analysis in R for continuous and attribute data. Use for Gage R&R, crossed or nested studies, repeatability, reproducibility, part-to-part variation, operator effects, bias, linearity, stability, attribute agreement, kappa, false accept risk, and false reject risk.
---

# MSA Measurement Systems

## Workflow

Start automatically with the `qa-r-analysis-core-skill` preflight when data or R output is involved: validate data readiness, check installed packages, verify current documentation if needed, select the package/workflow, and outline the analysis plan before final code.

1. Identify study type: continuous Gage R&R, attribute agreement, bias, linearity, or stability.
2. Validate design: parts, operators/appraisers, trials, reference values, randomization, range coverage, and whether the study is crossed or nested.
3. Select method from `references/msa-decision-guide.md`.
4. For continuous Gage R&R, evaluate ANOVA components, percent contribution, percent study variation, ndc, part-by-operator interaction, and practical adequacy.
5. For bias, linearity, and stability, compare observed measurement error against reference values and time.
6. For attributes, evaluate within-appraiser agreement, between-appraiser agreement, agreement against standard, kappa when appropriate, and false accept or false reject risk.
7. Report whether the measurement system is acceptable for the intended QA decision.

## Deliverables

Return the study type, design adequacy, R method or package selected, numeric results, plots when helpful, interpretation, and recommendation. If the measurement system is not adequate, warn before any SPC, capability, or DOE interpretation.

## Resources

- `references/msa-decision-guide.md`: study selection and interpretation checks.
- `scripts/msa_template.R`: base R ANOVA template for balanced crossed continuous Gage R&R.
