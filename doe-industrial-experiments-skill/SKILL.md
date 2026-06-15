---
name: doe-industrial-experiments-skill
description: Industrial design of experiments in R from planning through confirmation. Use for DOE planning, factor and level selection, randomization, blocking, screening, full factorial, fractional factorial, Plackett-Burman, optimal designs, model selection, ANOVA, interactions, residual diagnostics, response surface methodology, RSM, CCD, Box-Behnken, optimization, and confirmation runs.
---

# DOE Industrial Experiments

## Workflow

Start automatically with the `qa-r-analysis-core-skill` preflight for data contract, package selection, installed package checks, and current documentation checks. Do not wait for the user to request those checks; outline the DOE plan before final code or run-table generation.

1. Plan the experiment before coding. Define objective, response, CTQ, unit, factor list, levels, constraints, noise factors, blocking, randomization, replication, and success criteria.
2. Confirm measurement system readiness. If MSA is weak, warn that DOE conclusions may be unreliable.
3. Select the design from `references/doe-workflow-guide.md`. Match design to phase: screening, characterization, optimization, robustness, or confirmation.
4. Select the model from `references/doe-model-selection.md`. Preserve hierarchy and check aliasing before interpreting effects.
5. Generate the run table in R with randomization and blocking as appropriate.
6. Analyze results: ANOVA, effect estimates, main effects, interactions, residual diagnostics, lack-of-fit when possible, and practical effect size.
7. Use `references/rsm-guide.md` when curvature or optimization is relevant.
8. Recommend confirmation runs and transfer learnings into process settings, control plan, SPC, or capability follow-up.

## Deliverables

Return a DOE plan, selected design and rationale, run table or R code, model formula, analysis output, diagnostic interpretation, practical recommendation, confirmation plan, and risks.

## Resources

- `references/doe-workflow-guide.md`: full lifecycle and design selection.
- `references/doe-model-selection.md`: model, aliasing, ANOVA, diagnostics.
- `references/rsm-guide.md`: response surface methodology and optimization.
- `scripts/doe_template.R`: R helpers for common DOE setup and analysis.
