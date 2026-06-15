# DOE Model Selection And Analysis

## Model Building

- Start with the model implied by the design, not every possible term.
- Preserve hierarchy: keep lower-order terms when higher-order interactions are retained.
- Check alias structure before interpreting fractional factorial effects.
- Interpret effects by practical magnitude and engineering plausibility, not only p-values.
- Use coded variables for model interpretation when factor ranges differ materially.

## Common Models

- Screening: main effects plus planned interactions if resolution permits.
- Characterization: main effects and important two-factor interactions.
- RSM first order: linear terms, often with interaction terms.
- RSM second order: linear, two-factor interaction, and pure quadratic terms.
- Blocked design: include block effect.
- Split-plot: use a model that respects restricted randomization; do not treat hard-to-change factors as fully randomized.

## Diagnostics

Check:

- residuals versus fitted values;
- normal QQ plot;
- residuals versus run order;
- residuals versus important factors;
- leverage and influential runs;
- lack-of-fit when pure error is available;
- model hierarchy and aliasing.

## Interpretation

Report:

1. statistically active effects;
2. practically important effects;
3. interactions that change the best setting;
4. residual or lack-of-fit concerns;
5. recommended settings;
6. confirmation plan.
