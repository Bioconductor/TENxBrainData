#' @importFrom AnnotationHub query
#' @importFrom HDF5Array HDF5Array
#' @importFrom SingleCellExperiment SingleCellExperiment
#' @importFrom ExperimentHub ExperimentHub
.create_SCE_from_base <- function(base)
## Download HDF5 (dense assay) and RDS (row and column
## annotations) files from ExperimentHub, compose into a
## SingleCellExperiment.
{
    hub <- ExperimentHub()

    ## row and column data
    rdatapath <- paste0("TENxBrainData/", base, "_rowData.rds")
    rowData <- query(hub, rdatapath)[[1]]

    suppressMessages({
        rdatapath <- paste0("TENxBrainData/", base, "_colData.rds")
        colData <- query(hub, rdatapath)[[1]]

        ## HDF5, from ExperimentHub:
        rdatapath <- paste0("TENxBrainData/", base, "_rectangular.h5")
        h5file <- query(hub, rdatapath)[[1]]
    })
    h5array <- HDF5Array(h5file, "counts")

    SingleCellExperiment(
        list(counts = h5array), rowData = rowData, colData = colData
    )
}

#' @export
TENxBrainData <- function() {
    .create_SCE_from_base("1M_neurons_filtered_gene_bc_matrices_h5")
}

#' @export
TENxBrainData20k <- function() {
    .create_SCE_from_base("1M_neurons_neuron20k")
}
