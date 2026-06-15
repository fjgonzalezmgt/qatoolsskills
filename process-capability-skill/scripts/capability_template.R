#!/usr/bin/env Rscript

# Base R process capability template. Edit the input section before use.

input_path <- "capability_data.csv"
value_col <- "value"
lsl <- NA_real_
usl <- NA_real_
target <- NA_real_

capability_summary <- function(x, lsl = NA_real_, usl = NA_real_, target = NA_real_) {
  x <- x[is.finite(x)]
  n <- length(x)
  if (n < 2) stop("Need at least two finite observations.")

  sigma_overall <- sd(x)
  sigma_within <- if (n >= 2) mean(abs(diff(x))) / 1.128 else NA_real_
  if (!is.finite(sigma_within) || sigma_within == 0) sigma_within <- sigma_overall

  below_lsl <- if (is.na(lsl)) NA_integer_ else sum(x < lsl)
  above_usl <- if (is.na(usl)) NA_integer_ else sum(x > usl)
  out_of_spec <- sum(c(ifelse(is.na(below_lsl), 0, below_lsl), ifelse(is.na(above_usl), 0, above_usl)))

  cp <- if (!is.na(lsl) && !is.na(usl)) (usl - lsl) / (6 * sigma_within) else NA_real_
  cpl <- if (!is.na(lsl)) (mean(x) - lsl) / (3 * sigma_within) else NA_real_
  cpu <- if (!is.na(usl)) (usl - mean(x)) / (3 * sigma_within) else NA_real_
  cpk <- suppressWarnings(min(c(cpl, cpu), na.rm = TRUE))

  pp <- if (!is.na(lsl) && !is.na(usl)) (usl - lsl) / (6 * sigma_overall) else NA_real_
  ppl <- if (!is.na(lsl)) (mean(x) - lsl) / (3 * sigma_overall) else NA_real_
  ppu <- if (!is.na(usl)) (usl - mean(x)) / (3 * sigma_overall) else NA_real_
  ppk <- suppressWarnings(min(c(ppl, ppu), na.rm = TRUE))

  cpm <- if (!is.na(lsl) && !is.na(usl) && !is.na(target)) {
    (usl - lsl) / (6 * sqrt(sigma_overall^2 + (mean(x) - target)^2))
  } else {
    NA_real_
  }

  normality_p <- if (n >= 3 && n <= 5000) stats::shapiro.test(x)$p.value else NA_real_

  data.frame(
    n = n,
    mean = mean(x),
    median = median(x),
    sd_overall = sigma_overall,
    sd_within_mr = sigma_within,
    min = min(x),
    max = max(x),
    lsl = lsl,
    usl = usl,
    target = target,
    below_lsl = below_lsl,
    above_usl = above_usl,
    observed_ppm_out = out_of_spec / n * 1e6,
    shapiro_p = normality_p,
    Cp = cp,
    Cpl = cpl,
    Cpu = cpu,
    Cpk = if (is.infinite(cpk)) NA_real_ else cpk,
    Pp = pp,
    Ppl = ppl,
    Ppu = ppu,
    Ppk = if (is.infinite(ppk)) NA_real_ else ppk,
    Cpm = cpm
  )
}

data <- read.csv(input_path, stringsAsFactors = FALSE)
result <- capability_summary(data[[value_col]], lsl = lsl, usl = usl, target = target)
print(result)
