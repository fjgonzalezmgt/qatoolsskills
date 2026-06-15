# Capability Decision Guide

## Precondition

Capability requires a reasonably stable process. If the process is unstable, report performance as exploratory and investigate special causes before making durable capability claims.

## Decision Tree

1. Specs missing: do not compute capability; summarize distribution and request LSL/USL.
2. Time order available: run SPC first and flag special causes.
3. Bilateral specs: compute Cp/Cpk for short-term capability and Pp/Ppk for overall performance when assumptions fit.
4. Unilateral specs: compute Cpu or Cpl and report the absent side clearly.
5. Target exists and loss around target matters: consider Cpm.
6. Non-normal or strongly skewed data: do not force normal Cp/Cpk. Consider transformation, distribution fit, percentile capability, or stratification.
7. Multimodal data: stratify before capability.

## Interpretation

- Low Cp with low Cpk: variation and centering are both concerns.
- High Cp with low Cpk: process spread may be acceptable but the mean is off target.
- Good observed conformance with poor stability: risk is hidden by temporary conditions.
- Very small sample size: avoid strong pass/fail claims.

## Reporting

Report:

- n and date or lot range;
- LSL, USL, target;
- observed out-of-spec count and PPM;
- normality/distribution evidence;
- stability caveat;
- Cp, Cpk, Pp, Ppk, and Cpm where applicable;
- action recommendation.
