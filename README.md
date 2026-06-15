# QA Tools Skills For Codex

Paquete de skills para que Codex ayude a realizar analisis de calidad en R con criterio tecnico, seleccion actualizada de paquetes y salidas orientadas a decisiones QA.

## Objetivo

Estas skills evitan tener que buscar manualmente la documentacion cada vez que se necesita un analisis. Codex debe:

- entender el problema QA;
- validar los datos disponibles;
- seleccionar paquetes R adecuados y activos;
- consultar documentacion oficial cuando el API o la seleccion pueda estar desactualizada;
- generar codigo R reproducible;
- generar reportes Quarto entregables cuando se solicite;
- interpretar resultados en lenguaje de calidad;
- declarar supuestos, riesgos y acciones recomendadas.

## Skills Incluidas

| Skill | Uso principal |
| --- | --- |
| `qa-r-analysis-core-skill` | Flujo base, contrato de datos, seleccion de paquetes y checks de entorno R. |
| `qa-quarto-report-skill` | Reportes entregables en Quarto para HTML, PDF y Word. |
| `spc-process-control-skill` | Cartas de control, estabilidad, senales especiales y reaccion operativa. |
| `msa-measurement-systems-skill` | Gage R&R, atributos, sesgo, linealidad, estabilidad y riesgo de medicion. |
| `process-capability-skill` | Specs, estabilidad, normalidad, Cp, Cpk, Pp, Ppk, Cpm y PPM. |
| `fmea-control-plan-skill` | AMEF/FMEA, riesgos, controles, acciones y plan de control. |
| `root-cause-capa-skill` | 5 Why, Ishikawa, causa raiz, CAPA y verificacion de efectividad. |
| `pareto-aql-inspection-skill` | Pareto, AQL, muestreo, inspeccion, curvas OC y priorizacion. |
| `doe-industrial-experiments-skill` | DOE industrial completo: planificacion, diseno, modelo, analisis, RSM y confirmacion. |

## Ejemplos De Uso

Usa el nombre de la skill con `$skill-name` cuando quieras forzar una especialidad. Puedes combinar una skill analitica con `qa-quarto-report-skill` cuando necesites un entregable final.

### `qa-r-analysis-core-skill`

```text
Usa $qa-r-analysis-core-skill para revisar este CSV, identificar columnas utiles para QA, verificar paquetes R instalados y proponer el analisis adecuado.
```

```text
Usa $qa-r-analysis-core-skill para buscar el paquete R mas adecuado y vigente para este analisis de calidad antes de escribir codigo.
```

### `qa-quarto-report-skill`

```text
Usa $qa-quarto-report-skill para crear un reporte Quarto entregable en HTML y Word a partir de los resultados del analisis de capacidad.
```

```text
Usa $qa-quarto-report-skill para generar un .qmd ejecutivo con decision, evidencia, riesgos y acciones recomendadas.
```

### `spc-process-control-skill`

```text
Usa $spc-process-control-skill para seleccionar la carta de control correcta, evaluar estabilidad y detectar senales especiales en estos datos de produccion.
```

```text
Usa $spc-process-control-skill y $qa-quarto-report-skill para crear un reporte de estabilidad del proceso con carta I-MR, interpretacion y reaccion operativa.
```

### `msa-measurement-systems-skill`

```text
Usa $msa-measurement-systems-skill para analizar este estudio Gage R&R cruzado con partes, operadores, replicas y mediciones.
```

```text
Usa $msa-measurement-systems-skill para evaluar acuerdo por atributos entre inspectores contra un estandar y explicar falsos aceptados/rechazados.
```

### `process-capability-skill`

```text
Usa $process-capability-skill para verificar specs, estabilidad, normalidad, Cp, Cpk, Pp, Ppk y PPM de esta caracteristica critica.
```

```text
Usa $process-capability-skill y $qa-quarto-report-skill para entregar un reporte de capacidad en Quarto con decision ejecutiva y riesgos.
```

### `fmea-control-plan-skill`

```text
Usa $fmea-control-plan-skill para revisar este PFMEA, detectar brechas en controles preventivos/detectivos y proponer acciones.
```

```text
Usa $fmea-control-plan-skill para convertir los riesgos altos del AMEF en entradas concretas de plan de control con reaccion, frecuencia y evidencia.
```

### `root-cause-capa-skill`

```text
Usa $root-cause-capa-skill para estructurar causa raiz, contencion, CAPA y verificacion de efectividad para esta no conformidad.
```

```text
Usa $root-cause-capa-skill para analizar datos antes/despues de una accion correctiva y decidir si la CAPA fue efectiva.
```

### `pareto-aql-inspection-skill`

```text
Usa $pareto-aql-inspection-skill para crear un Pareto de defectos por categoria, estratificar por linea y recomendar prioridades.
```

```text
Usa $pareto-aql-inspection-skill para evaluar un plan AQL, explicar la regla de aceptacion/rechazo y construir una curva OC.
```

### `doe-industrial-experiments-skill`

```text
Usa $doe-industrial-experiments-skill para planificar un DOE industrial desde objetivo, factores, niveles, restricciones y seleccion del diseno.
```

```text
Usa $doe-industrial-experiments-skill y $qa-quarto-report-skill para analizar un DOE con modelo, interacciones, diagnosticos, superficie de respuesta y corridas de confirmacion.
```

## Filosofia De Uso

Cada skill sigue el mismo patron:

1. Entender el caso y la decision.
2. Validar datos, specs, estructura y contexto.
3. Seleccionar metodo y paquete R con fuentes oficiales.
4. Ejecutar el analisis con codigo reproducible.
5. Generar reporte Quarto entregable si el usuario lo solicita.
6. Interpretar en lenguaje QA.
7. Recomendar accion operacional.

La skill base `qa-r-analysis-core-skill` se debe combinar con las skills especialistas cuando el analisis requiera R, seleccion de paquetes o validacion de datos.

## Paquetes R Iniciales

La seleccion final debe verificarse contra documentacion oficial cuando aplique. Candidatos comunes:

- SPC y capacidad: `qcc`, `SixSigma`.
- AQL y muestreo: `AcceptanceSampling`.
- DOE: `stats`, `DoE.base`, `FrF2`, `rsm`, `AlgDesign`, `skpr`.
- Visualizacion y datos: `ggplot2`, `dplyr`, `tidyr`, `readr`, `readxl`, `openxlsx`, `broom`, `gt`.
- Reportes: Quarto, `knitr`, `rmarkdown`.

No se debe usar `qualityTools` como default porque esta archivado en CRAN.

Fuentes utiles:

- <https://CRAN.R-project.org/package=qcc>
- <https://CRAN.R-project.org/package=SixSigma>
- <https://CRAN.R-project.org/package=AcceptanceSampling>
- <https://CRAN.R-project.org/view=ExperimentalDesign>

## Instalacion En Codex

Este repo contiene carpetas de skills completas. Para que Codex las descubra automaticamente, copia o sincroniza las carpetas de skills hacia tu directorio de skills, normalmente:

```text
%USERPROFILE%\.codex\skills
```

Tambien puedes mantenerlas en este repo para versionarlas y copiar solo las que quieras activar.

## Estructura

Cada skill incluye:

- `SKILL.md`: instrucciones principales y disparadores.
- `agents/openai.yaml`: metadata de interfaz.
- `references/`: guias de decision que se cargan solo cuando hacen falta.
- `scripts/`: plantillas R reutilizables.

## Politica De Paquetes

Las skills no deben instalar paquetes R sin aprobacion. Primero deben revisar si el paquete esta instalado, justificar por que se necesita y proponer la instalacion.

La skill base incluye:

```text
qa-r-analysis-core-skill/scripts/qa_r_package_check.R
```

para revisar paquetes comunes y versiones instaladas.

## Reportes Quarto

La skill `qa-quarto-report-skill` agrega una capa de entrega para convertir los analisis en documentos `.qmd` renderizables a HTML, Word o PDF. Incluye:

- templates en `qa-quarto-report-skill/assets/templates/`;
- CSS para HTML en `qa-quarto-report-skill/assets/styles/`;
- script de scaffolding en `qa-quarto-report-skill/scripts/create_qa_quarto_report.R`;
- guias de estructura de reportes en `qa-quarto-report-skill/references/`.

Comandos tipicos:

```powershell
quarto render report.qmd --to html
quarto render report.qmd --to docx
quarto render report.qmd --to pdf
```

En esta maquina se encontro Quarto 1.9.37 y R 4.5.1. `Rscript.exe` esta instalado en:

```text
C:\Program Files\R\R-4.5.1\bin\Rscript.exe
```

## Estado

Primera version funcional del paquete de skills QA en R. Las skills estan disenadas para evolucionar con casos reales, especialmente DOE, MSA y capacidad.
