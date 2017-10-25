main.data <- data.frame(Title="Brain scRNA-seq data",
                        Description="Single-cell RNA-seq data for 1.3 million brain cells from E18 mice.",
                        BiocVersion="3.6",
                        Genome="mm10",
                        SourceType="HDF5",
                        SourceUrl="http://cf.10xgenomics.com/samples/cell-exp/1.3.0/1M_neurons/1M_neurons_filtered_gene_bc_matrices_h5.h5",
                        SourceVersion="f97b8c67e57a534816b9b2bccf31476b",
                        Species="Mus musculus",
                        TaxonomyId="10090",
                        Coordinate_1_based=TRUE,
                        DataProvider="10X Genomics",
                        Maintainer="Aaron Lun <alun@wehi.edu.au>",
                        RDataClass="SingleCellExperiment",
                        DispatchClass="Rds",
                        RDataPath="TENxNeuronData/brain.rds")
write.csv(file="metadata.csv", main.data, row.names=FALSE)



