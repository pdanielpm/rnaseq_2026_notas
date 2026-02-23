
library(ExploreModelMatrix)
mat <- with(trees, model.matrix(log(Volume) ~ log(Height) + log(Girth)))

(sampleData <- data.frame(
    genotype = rep(c("A", "B"), each = 4),
    treatment = rep(c("ctrl", "trt"), 4)
))

vd <- ExploreModelMatrix::VisualizeDesign(
    sampleData = sampleData,
    designFormula = ~ genotype + treatment,
    textSizeFitted = 4
)


cowplot::plot_grid(plotlist = vd$plotlist)

(sampleData <- data.frame(
  Response = rep(c("Resistant", "Sensitive"), c(12, 18)),
  Patient = factor(rep(c(1:6, 8, 11:18), each = 2)),
  Treatment = factor(rep(c("pre","post"), 15)), 
  ind.n = factor(rep(c(1:6, 2, 5:12), each = 2))))

vd <- ExploreModelMatrix::VisualizeDesign(
  sampleData = sampleData,
  designFormula = ~ Response + Response:ind.n + Response:Treatment,
  textSizeFitted = 3
)
cowplot::plot_grid(plotlist = vd$plotlist, ncol = 1)

app <- ExploreModelMatrix(
  sampleData = sampleData,
  designFormula = ~ Response + Response:ind.n + Response:Treatment
)
#> The `name` provided ('') does not correspond to a known icon
#> The `name` provided ('hand-o-right') does not correspond to a known icon
#> The `name` provided ('question-circle fa-1g') does not correspond to a known icon
if (interactive()) {
  shiny::runApp(app)
}



#(Intercept): Es la referencia base. En este gráfico, corresponde al grupo Resistant, paciente ind.1, en el tiempo post (fíjate que en esa celda solo aparece (Intercept)).

# ResponseSensitive: Es el efecto principal de ser del grupo Sensible. Se suma a todas las muestras de los pacientes "Sensitive".

# Response[Group]:ind.n: Estos son los efectos específicos de cada individuo (baseline individual). Como los pacientes están anidados dentro de su grupo de respuesta, esto actúa como un "efecto de bloque" para controlar la variabilidad entre personas.

# Response[Group]:Treatmentpre: Este es el coeficiente de interés principal. Representa la diferencia entre el estado pre y el estado post dentro de ese grupo específico.

# ResponseResistant:Treatmentpre : Coeficiente que captura la diferencia entre el estado pre y el estado post para el grupo Resistant.