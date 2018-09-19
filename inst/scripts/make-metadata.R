## validate with `AnnotationHub::readMetadataFromCsv("TENxBrainData")`
## (above pkg directory)

main.data <- data.frame(
    Title = paste0(
        rep(
            c(
                "Brain scRNA-seq data",
                "Brain scRNA-seq data 20k subset"
            ),
            each=4
        ),
        ", ",
        rep(
            c(
                "'HDF5-based 10x Genomics' format",
                "'dense matrix' format",
                "sample (column) annotation",
                "gene (row) annotation"
            ),
            times=2
        )
    ),
    Description = paste(
        rep(
            c(
                "Single-cell RNA-seq data for 1.3 million brain cells from E18 mice.",
                "Single-cell RNA-seq data for subset of 20,000 brain cells from E18 mice."
            ),
            each=4
        ),
        rep(
            c(
                "'HDF5-based 10x Genomics' format originally provided by TENx Genomics.",
                "Full rectangular, block-compressed format, 1GB block size.",
                "Inferred sample descriptions.",
                "Gene descriptions."
            ),
            times=2
        )
    ),
    RDataPath = file.path("TENxBrainData",
        paste0(
            rep(
                c(
                    "1M_neurons_filtered_gene_bc_matrices_h5",
                    "1M_neurons_neuron20k"
                ),
                each=4
            ),
            rep(c(".h5", "_rectangular.h5", "_colData.rds", "_rowData.rds"), times=2)
        )
    ),
    BiocVersion="3.8",
    Genome="mm10",
    SourceType="HDF5",
    SourceUrl=rep(
        c(
            "http://cf.10xgenomics.com/samples/cell-exp/1.3.0/1M_neurons/1M_neurons_filtered_gene_bc_matrices_h5.h5",
            "http://cf.10xgenomics.com/samples/cell-exp/1.3.0/1M_neurons/1M_neurons_neuron20k.h5"
        ),
        each=4
    ),
    SourceVersion=rep(c("f97b8c67e57a534816b9b2bccf31476b", "7696db0199a30a36f857e86a1ad1da8d"), each=4),
    Species="Mus musculus",
    TaxonomyId="10090",
    Coordinate_1_based=TRUE,
    DataProvider="10X Genomics",
    Maintainer="Aaron Lun <alun@wehi.edu.au>",
    RDataClass="character",
    DispatchClass=rep(c("H5File", "H5File", "Rds", "Rds"), times=2),
    stringsAsFactors = FALSE
)

write.csv(file="metadata.csv", main.data, row.names=FALSE)
