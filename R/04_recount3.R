library(recount3)
library(iSEE)
human_projects <- available_projects()

proj_info <- subset(
    human_projects,
    project == "SRP009615" & project_type == "data_sources"
)
rse_gene_SRP009615 <- create_rse(proj_info)
rse_gene_SRP009615
assay(rse_gene_SRP009615, "counts") <- compute_read_counts(rse_gene_SRP009615)
rse_gene_SRP009615 <- expand_sra_attributes(rse_gene_SRP009615)

colData(rse_gene_SRP009615)[
    ,
    grepl("^sra_attribute", colnames(colData(rse_gene_SRP009615)))
]

iSEE::iSEE(rse_gene_SRP009615)
