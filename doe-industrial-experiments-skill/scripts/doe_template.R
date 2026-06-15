#!/usr/bin/env Rscript

# DOE helper template. Edit or source this script from an analysis.

require_package <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    stop(sprintf("Package '%s' is required. Ask for approval before installing it.", pkg))
  }
}

make_full_factorial <- function(factors, randomize = TRUE, seed = 123) {
  design <- expand.grid(factors, KEEP.OUT.ATTRS = FALSE, stringsAsFactors = FALSE)
  if (randomize) {
    set.seed(seed)
    design <- design[sample(seq_len(nrow(design))), , drop = FALSE]
  }
  design$run_order <- seq_len(nrow(design))
  design
}

make_two_level_fractional <- function(nruns, nfactors, randomize = TRUE, seed = 123) {
  require_package("FrF2")
  FrF2::FrF2(nruns = nruns, nfactors = nfactors, randomize = randomize, seed = seed)
}

fit_doe_model <- function(data, response, terms) {
  formula_text <- paste(response, "~", terms)
  fit <- lm(as.formula(formula_text), data = data)
  list(
    formula = formula(fit),
    anova = anova(fit),
    coefficients = coef(summary(fit)),
    model = fit
  )
}

diagnostic_plots <- function(fit) {
  old_par <- par(no.readonly = TRUE)
  on.exit(par(old_par))
  par(mfrow = c(2, 2))
  plot(fit)
}

fit_quadratic_rsm_base <- function(data, response, factors) {
  linear <- factors
  interactions <- combn(factors, 2, function(x) paste(x, collapse = ":"), simplify = TRUE)
  quadratics <- paste0("I(", factors, "^2)")
  terms <- paste(c(linear, interactions, quadratics), collapse = " + ")
  fit_doe_model(data, response, terms)
}

# Example:
# factors <- list(temp = c(180, 200), pressure = c(40, 60), speed = c(10, 20))
# design <- make_full_factorial(factors)
# print(design)
