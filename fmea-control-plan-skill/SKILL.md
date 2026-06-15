---
name: fmea-control-plan-skill
description: FMEA and control plan support for quality engineering. Use for AMEF, PFMEA, DFMEA, failure modes, effects, causes, prevention and detection controls, severity, occurrence, detection, action priority, RPN, special characteristics, control method, reaction plan, and control plan linkage.
---

# FMEA Control Plan

## Workflow

Use `qa-r-analysis-core-skill` when working with FMEA tables, defect history, occurrence evidence, detection evidence, or R-based prioritization.

1. Define scope: product/process, boundary, function, step, customer, and intended FMEA type.
2. Structure the FMEA: function, requirement, failure mode, effect, severity, cause, occurrence, prevention control, detection control, detection rating, and action priority or RPN.
3. Validate logic chains: every effect must tie to a failure mode, every cause must tie to a failure mode, and every control must address either cause prevention or failure detection.
4. Prioritize using the chosen method. Prefer AIAG-VDA style action priority if the organization uses it; otherwise calculate RPN with limitations clearly stated.
5. Convert high-priority risks into control plan entries: characteristic, spec, method, sample size/frequency, responsibility, reaction, record, and escalation.
6. Check that the control plan is actionable on the shop floor and that reaction plans are not vague.

## Deliverables

Return gaps, ranking, recommended actions, control plan linkage, missing controls, unclear reaction plans, and a concise risk summary. Do not invent severity tables; ask for the organization standard when ratings are missing.

## Resources

- `references/fmea-control-plan-guide.md`: FMEA and control-plan logic checks.
- `scripts/fmea_priority_template.R`: R template to calculate RPN and simple priority bands from a CSV.
