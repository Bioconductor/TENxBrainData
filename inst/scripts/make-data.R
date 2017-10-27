library(HDF5Array)
library(SingleCellExperiment)

# Downloading the data.

url <- "https://cf.10xgenomics.com/samples/cell-exp/1.3.0/1M_neurons/1M_neurons_filtered_gene_bc_matrices_h5.h5"
path <- basename(url)
download.file(url, path)

# Loading the data into R.

# devtools::install_github("mtmorgan/TENxGenomics")
library(TENxGenomics)
tenx.se <- tenxSummarizedExperiment(path)

saveRDS(
    rowData(tenx.se), "1m_neurons_filtered_gene_bc_matrices_h5_rowData.rds"
)

saveRDS(
    colData(tenx.se), "1m_neurons_filtered_gene_bc_matrices_h5_colData.rds"
)

# Converting into a `HDF5Matrix` object
library(HDF5Array)
tenxmat <- TENxMatrix(path)

options(DelayedArray.block.size=1e9) # 1GB block size.
mat.out <- writeHDF5Array(
    tenxmat,
    file="1M_neurons_filtered_gene_bc_matrices_h5_rectangular.h5",
    name="counts", 
    chunk_dim=beachmat::getBestChunkDims(dim(tenxmat))
)
