# DOE Workflow Guide

## Planning Questions

- What decision will the DOE support?
- What response variables will be measured and in what units?
- What is the experimental unit?
- Which factors are controllable, hard-to-change, noise, nuisance, or blocking factors?
- Are factor ranges safe and practically achievable?
- What interactions are technically plausible?
- What budget, run count, material, time, and shutdown constraints exist?
- Is the measurement system adequate?
- What confirmation evidence will be required?

## Design Selection

| Situation | Candidate design |
| --- | --- |
| Few factors and full interaction learning is needed | Full factorial |
| Many factors, early screening | Fractional factorial or Plackett-Burman |
| Two-level industrial screening | `FrF2` regular fractional factorial |
| Mixed-level factors or orthogonal arrays | `DoE.base` |
| Constraints or custom candidate set | `AlgDesign` or `skpr` |
| Curvature suspected | Add center points or move to RSM |
| Optimization with quantitative factors | CCD, Box-Behnken, or RSM design |
| Hard-to-change factors | Split-plot or restricted randomization |
| Known nuisance source | Blocking |

## Run Table Rules

- Randomize run order unless physical or safety constraints prevent it.
- Record actual factor settings, not only coded settings.
- Include center points when curvature matters.
- Include replication when pure error and lack-of-fit testing matter.
- Preserve blocks and run order in the dataset.
- Capture deviations from planned settings.

## Package Guidance

- Use `stats` for model fitting with `lm()` and `aov()`.
- Use `FrF2` for two-level fractional factorial screening.
- Use `DoE.base` for full factorial and orthogonal arrays.
- Use `rsm` for response surface design and analysis.
- Use `AlgDesign` or `skpr` for optimal designs when constraints dominate.
- Verify current package documentation before relying on detailed API calls.
