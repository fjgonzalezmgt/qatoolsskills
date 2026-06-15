---
name: spc-process-control-skill
description: Statistical process control analysis in R for control charts, process stability, special cause signals, operational reaction, and phase I or phase II monitoring. Use for cartas de control, Shewhart charts, I-MR, Xbar-R, Xbar-S, p, np, c, u, CUSUM, EWMA, stability checks, and control limit interpretation.
---

# SPC Process Control

## Workflow

Start automatically with the `qa-r-analysis-core-skill` preflight when data or R output is involved: validate data readiness, check installed packages, verify current documentation if needed, select the package/workflow, and outline the analysis plan before final code.

1. Identify data type: continuous measurement, proportion defective, defect count, or rate per unit.
2. Confirm sampling structure: individual values, rational subgroups, subgroup size, time order, lot order, and phase I versus phase II use.
3. Select the chart from `references/spc-decision-guide.md`.
4. Validate assumptions: stable measurement system, rational subgrouping, no mixed processes, and enough baseline data.
5. Build the chart using current package documentation. Prefer `qcc` for standard charts and consider `SixSigma` for Six Sigma workflows.
6. Evaluate signals and patterns. Do not use specification limits as control limits.
7. Interpret operationally: stable or unstable, likely special causes, recommended reaction, and whether limits should remain frozen or be recalculated after verified improvement.

## Deliverables

Return the selected chart, R code, control limits, signal summary, excluded or investigated points, and an action-oriented interpretation. If the process is unstable, avoid capability claims unless the user explicitly asks for exploratory capability with a warning.

## Resources

- `references/spc-decision-guide.md`: chart selection and interpretation rules.
- `scripts/spc_template.R`: base template for common SPC chart workflows in R.
