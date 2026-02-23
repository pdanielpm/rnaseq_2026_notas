
```R
# Crear un nuevo proyecto de sitio web
usethis::create_project("pdanielpm.github.io")

# Configurar Git y GitHub
usethis::use_git() 
usethis::use_github()

# Elegir una plantilla de postcards
postcards::create_postcard(template = "trestles")

```
# Edicion de pagina

```R
---
title: "Daniel Pineda Martinez"
image: "Daniel_perfil.jpg"
links:
  - label: GitHub
    url: "https://github.com/pdanielpm"
  - label: Email
    url: "mailto:pedropm@lcg.unam.mx"
output:
  postcards::trestles
---
 
## Bio

I am a undegraduate student in Genomic Sciences at the National Autonomous University of Mexico (UNAM). I am passionate about paleogenomics and evolutionary biology. I am currently working on a project to analyze DNA samples from museum specimens to identify contamination between samples an the impact of different storage/preservation methods on DNA quality.

## Education

**National Autonomous University of Mexico** | Cuernavaca(Morelos), Mexico

B.S. in Genomic Sciences | August 2023 - Present

## Experience

**Dra. Araxi Urrutia Evolutionary and Comparative Genomics Lab** | Research Internship  | May 2025 - Present

**Dra. Marcela Sandoval Velasco Lab** | Research Internship | August 2025 - Present

```

```R
# Renderizar la pagina
rmarkdown::render("index.Rmd")
```