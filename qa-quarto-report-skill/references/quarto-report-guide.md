# Quarto Report Guide

Use this reference when creating or rendering QA reports with Quarto.

## Current Documentation Checks

Consult official Quarto documentation when using options that may change:

- Getting started and `.qmd` basics: <https://quarto.org/docs/get-started/>
- R computations and chunk options: <https://quarto.org/docs/computations/r.html>
- HTML output options: <https://quarto.org/docs/output-formats/html-basics.html>
- PDF output options: <https://quarto.org/docs/output-formats/pdf-basics.html>
- Word output options: <https://quarto.org/docs/output-formats/ms-word.html>
- Format reference: <https://quarto.org/docs/reference/formats/html.html>

## Local Checks

Use:

```powershell
quarto --version
quarto check
Get-Command quarto
Get-Command Rscript -ErrorAction SilentlyContinue
```

If `Rscript` is not on PATH, search common Windows paths such as:

```powershell
Get-ChildItem 'C:\Program Files\R' -Recurse -Filter Rscript.exe
```

## Rendering

Common commands:

```powershell
quarto render report.qmd --to html
quarto render report.qmd --to docx
quarto render report.qmd --to pdf
quarto render report.qmd --cache
quarto render report.qmd --no-cache
```

Prefer HTML with `embed-resources: true` for a single self-contained review file. Use Word when the user needs an editable deliverable. Use PDF when the document needs controlled formatting.

## R Chunk Conventions

Use named chunks and Quarto chunk options:

````
```{r}
#| label: load-packages
#| include: false
library(ggplot2)
```
````

For deliverable QA reports:

- use `echo: false` by default;
- use `warning: false` and `message: false` unless diagnostics matter;
- save important figures with stable labels;
- include package versions in an appendix or reproducibility section.

## Output QA

After render, verify:

- file was created in the expected output format;
- title, date, author, and analysis type are correct;
- figures and tables render;
- executive decision appears near the top;
- assumptions and limitations are visible;
- no raw errors, placeholder text, or broken image paths remain.
