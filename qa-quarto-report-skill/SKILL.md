---
name: qa-quarto-report-skill
description: Build deliverable QA reports with Quarto and R. Use when Codex must create, adapt, render, or troubleshoot .qmd reports for SPC, MSA, process capability, FMEA, CAPA, Pareto, AQL, inspection, DOE, or other quality analyses, including HTML, PDF, and Word outputs, report templates, execution options, chunk options, parameters, and current Quarto documentation checks.
---

# QA Quarto Report

## Purpose

Use this skill after a QA analysis skill has selected the method and generated results. This skill turns the analysis into a deliverable Quarto report with executive summary, method, assumptions, results, interpretation, risks, and actions.

## Workflow

1. Identify the audience and output format: HTML for review, Word for editable delivery, PDF for controlled release, or multiple formats.
2. Confirm local environment with `quarto --version`, `quarto check`, and R/knitr checks when rendering is requested.
3. Consult current official Quarto documentation when using unfamiliar output options, format-specific features, templates, parameters, caching, or render flags.
4. Choose a template from `assets/templates/`.
5. Generate a working `.qmd` using `scripts/create_qa_quarto_report.R` or by copying a template manually.
6. Insert analysis code, tables, figures, and interpretation. Keep raw code hidden in client-facing reports unless the user requests auditability.
7. Render with `quarto render <file.qmd> --to html`, `--to docx`, or `--to pdf`.
8. Verify the rendered artifact exists, opens structurally, and contains the executive decision, key results, assumptions, limitations, and next actions.

## Report Standards

- Put the QA decision in the first page or first screen.
- Separate executive interpretation from technical details.
- Include data readiness, method, assumptions, package versions, and reproducibility notes.
- For regulated or customer-facing reports, include revision, author, date, data source, and approval placeholders.
- Do not overfill the report with console output. Convert results into clear tables and figures.
- Keep code chunks named and use Quarto chunk options with `#|`.

## Resources

- `references/quarto-report-guide.md`: Quarto authoring, rendering, and output guidance.
- `references/qa-report-structure.md`: deliverable QA report structure by analysis type.
- `assets/templates/qa-analysis-report.qmd`: general QA analysis report.
- `assets/templates/qa-executive-report.qmd`: concise management-facing report.
- `assets/styles/qa-report.css`: HTML report styling.
- `scripts/create_qa_quarto_report.R`: scaffold a report from a template.
