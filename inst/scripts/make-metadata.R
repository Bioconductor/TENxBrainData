## validate with `AnnotationHub::readMetadataFromCsv("TENxBrainData")`
## (above pkg directory)

main.data <- data.frame(
    Title = c(
        "Brain scRNA-seq data, 'RLE-compressed'",
        "Brain scRNA-seq data, 'rectangular'"
    ),
    Description = c(
        paste(
            "Single-cell RNA-seq data for 1.3 million brain cells from E18 mice.",
            "'RLE-compressed' format originally provided by TENx Genomics",
            collapse = " "
        ),
        paste(
            "Single-cell RNA-seq data for 1.3 million brain cells from E18 mice.",
            "Full rectangular, block-compressed format, 1GB block size.",
            collapse = " "
        )
    ),
    RDataPath = c(
        "TENxBrainData/1M_neurons_filtered_gene_bc_matrices_h5.h5",
        "TENxBrainData/1M_neurons_filtered_gene_bc_matrices_h5_rectangular.h5"
    ),
    BiocVersion="3.7",
    Genome="mm10",
    SourceType="HDF5",
    SourceUrl="http://cf.10xgenomics.com/samples/cell-exp/1.3.0/1M_neurons/1M_neurons_filtered_gene_bc_matrices_h5.h5",
    SourceVersion="f97b8c67e57a534816b9b2bccf31476b",
    Species="Mus musculus",
    TaxonomyId="10090",
    Coordinate_1_based=TRUE,
    DataProvider="10X Genomics",
    Maintainer="Aaron Lun <alun@wehi.edu.au>",
    RDataClass="character",
    DispatchClass="H5File",
    stringsAsFactors = FALSE
)

write.csv(file="metadata.csv", main.data, row.names=FALSE)

