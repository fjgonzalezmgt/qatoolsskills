# SPC Decision Guide

## Chart Selection

| Data situation | Preferred chart |
| --- | --- |
| Individual continuous values, time ordered | I-MR |
| Continuous data in rational subgroups, n 2 to 10 | Xbar-R |
| Continuous data in rational subgroups, n greater than 10 | Xbar-S |
| Fraction defective with varying subgroup size | p |
| Number defective with constant subgroup size | np |
| Defect counts with constant opportunity area | c |
| Defect rate with varying opportunity area | u |
| Small sustained shifts matter | CUSUM or EWMA |

## Required Checks

- Confirm chronological or production order.
- Confirm rational subgroups: within-subgroup variation should represent short-term/common variation.
- Separate phase I baseline creation from phase II monitoring.
- Check whether known special-cause points should be investigated before finalizing baseline limits.
- Keep specification limits separate from control limits.

## Interpretation Rules

- A point outside control limits is a special-cause signal until proven otherwise.
- Runs, trends, cycles, hugging the centerline, or stratification patterns can signal nonrandom behavior.
- Do not recalculate limits just to make signals disappear.
- Recalculate limits only after a verified process change or after removing justified special-cause baseline points.
- If process stability is not demonstrated, report instability before discussing capability.

## Operational Response

For each signal, ask for or infer:

1. time or lot of occurrence;
2. product, line, tool, cavity, operator, material, setup, or shift context;
3. containment need;
4. root-cause investigation owner;
5. whether the control plan needs a reaction update.
