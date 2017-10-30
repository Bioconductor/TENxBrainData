TENxBrainData <- function() 
# Downloads the RDS object and the HDF5 file from AWS,
# and modifies the path of the HDF5 object to use the 
# system location of the installation.
{
    base <- "1M_neurons_filtered_gene_bc_matrices_h5"

    ## row and column data
    rdatapath <- paste0("TENxBrainData/", base, "_rowData.rds")
    rowData <- query(ExperimentHub(), rdatapath)[[1]]

    rdatapath <- paste0("TENxBrainData/", base, "_colData.rds")
    colData <- query(ExperimentHub(), rdatapath)[[1]]

    ## HDF5, from ExperimentHub:
    rdatapath <- paste0("TENxBrainData/", base, "_rectangular.h5")
    h5file <- query(ExperimentHub(), rdatapath)[[1]]
    h5array <- HDF5Array(h5file, "counts")

    SingleCellExperiment(
        list(counts = h5array), rowData = rowData, colData = colData
    )
}
