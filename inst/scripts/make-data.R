library(HDF5Array)
library(SingleCellExperiment)

getRowData <- function(path) {
    data.frame(
        Ensembl=as.character(h5read(path, "mm10/genes")),
        Symbol=as.character(h5read(path, "mm10/gene_names")),
        stringsAsFactors=FALSE
    )
}

getColData <- function(path) {
    barcode <- as.character(h5read(path, "mm10/barcodes"))
    lib <- as.integer(sub(".*-", "", barcode))
    data.frame(
        Barcode=barcode,
        Sequence=sub("-.*", "", barcode),
        Library=lib,
        Mouse=ifelse(lib <= 69, "A", "B"),
        stringsAsFactors=FALSE
    )
}

#################################################################################
# Processing the full 1 million cell data set.

url <- "https://cf.10xgenomics.com/samples/cell-exp/1.3.0/1M_neurons/1M_neurons_filtered_gene_bc_matrices_h5.h5"
path <- basename(url)
download.file(url, path)

# Loading the data into R.
saveRDS(getRowData(path), "1M_neurons_filtered_gene_bc_matrices_h5_rowData.rds")

saveRDS(getColData(path), "1M_neurons_filtered_gene_bc_matrices_h5_colData.rds")

# Converting into a `HDF5Matrix` object
tenxmat <- TENxMatrix(path)

options(DelayedArray.block.size=1e9) # 1GB block size.
mat.out <- writeHDF5Array(
    tenxmat,
    file="1M_neurons_filtered_gene_bc_matrices_h5_rectangular.h5",
    name="counts", 
    chunkdim=beachmat::getBestChunkDims(dim(tenxmat))
)

#################################################################################
# Processing the 20K subset.

url <- "http://cf.10xgenomics.com/samples/cell-exp/1.3.0/1M_neurons/1M_neurons_neuron20k.h5"
path <- basename(url)
download.file(url, path)

# Loading the data into R.
saveRDS(getRowData(path), "1M_neurons_neuron20k_rowData.rds")

saveRDS(getColData(path), "1M_neurons_neuron20k_colData.rds")

# Converting into a `HDF5Matrix` object
tenxmat <- TENxMatrix(path)

options(DelayedArray.block.size=1e9) # 1GB block size.
mat.out <- writeHDF5Array(
    tenxmat,
    file="1M_neurons_neuron20k_rectangular.h5",
    name="counts", 
    chunkdim=beachmat::getBestChunkDims(dim(tenxmat))
)
