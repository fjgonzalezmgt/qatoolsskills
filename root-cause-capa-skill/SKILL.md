---
name: root-cause-capa-skill
description: Root cause and CAPA workflow for quality issues. Use for problem definition, containment, 5 Why, Ishikawa, cause verification, corrective action, preventive action, effectiveness checks, recurrence analysis, before-after data, and CAPA closure evidence.
---

# Root Cause CAPA

## Workflow

Use `qa-r-analysis-core-skill` when defect, complaint, nonconformance, audit, or process data must be analyzed in R.

1. Define the problem with evidence: what, where, when, how much, trend, customer impact, and detection point.
2. Separate containment from corrective action.
3. Build the cause model using 5 Why, Ishikawa, process map, stratification, Pareto, trend, or hypothesis testing.
4. Verify root cause with evidence. Do not accept an untested story as root cause.
5. Define CAPA: action, owner, due date, affected scope, documentation update, training need, and residual risk.
6. Define effectiveness criteria before closure: metric, baseline, target, period, sample size, and review date.
7. Verify effectiveness using data when possible.

## Deliverables

Return problem statement, containment, suspected causes, verified root cause evidence, CAPA plan, effectiveness test, closure risks, and follow-up recommendation.

## Resources

- `references/root-cause-capa-guide.md`: root-cause and CAPA quality checks.
- `scripts/capa_effectiveness_template.R`: before-after effectiveness template for numeric or defect-rate data.
