# Downloading the data.

path <- "1M_neurons_filtered_gene_bc_matrices_h5.h5"
download.file("http://cf.10xgenomics.com/samples/cell-exp/1.3.0/1M_neurons/1M_neurons_filtered_gene_bc_matrices_h5.h5", path)

# Loading the data into R.

# devtools::install_github("mtmorgan/TENxGenomics")
library(TENxGenomics)
tenx.se <- tenxSummarizedExperiment(path)
tenx.se

# Converting into a `HDF5Matrix` object

tenxmat <- TENxMatrix(path)

library(HDF5Array)
options(DelayedArray.block.size=1e9) # 1GB block size.
mat.out <- writeHDF5Array(tenxmat, file="10x_brain.h5", name="brain", chunk_dim=c(100, 100))

# Constructing a new SingleCellExperiment object for serialization.

se.out <- SingleCellExperiment(list(counts=mat.out), rowData=rowData(tenx.se), colData=colData(tenx.se))
saveRDS(se.out, file="brain.rds")
