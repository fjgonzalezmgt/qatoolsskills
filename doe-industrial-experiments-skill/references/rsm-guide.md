# Response Surface Methodology Guide

Use RSM when the goal is optimization, when curvature is suspected, or when a screening/characterization DOE has narrowed the factors to quantitative variables.

## RSM Flow

1. Confirm factors are quantitative or can be meaningfully ordered.
2. Start with a first-order model if far from optimum.
3. Use center points to detect curvature.
4. If curvature exists, plan a second-order design such as CCD or Box-Behnken.
5. Fit a quadratic model with linear, interaction, and squared terms.
6. Inspect residual diagnostics and lack-of-fit.
7. Use contour plots, surface plots, canonical analysis, and desirability or compromise rules for multiple responses.
8. Run confirmation experiments at the proposed setting.

## R Package Guidance

- Prefer `rsm` for coded variables, first-order and second-order models, steepest ascent, contour plots, and canonical analysis.
- Use `DoE.wrapper` only after checking current documentation and package availability.
- Use `stats::lm()` as a transparent fallback for quadratic models.

## Warnings

- Do not extrapolate outside the experimental region.
- Do not optimize a model with poor diagnostics without confirmation.
- If factors are categorical, use factorial modeling rather than RSM.
- If multiple responses conflict, state the tradeoff explicitly.
