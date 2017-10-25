TENxBrainData <- function() 
# Downloads the RDS object and the HDF5 file from AWS,
# and modifies the path of the HDF5 object to use the 
# system location of the installation.
{
    # ... downloading the RDS file:
    # rds.loc <- ...

    # ... downloading the HDF5 file:
    # h5.loc <- ...
    
    sce <- readRDS(rds.loc)
    counts <- assay(sce)
    counts@seed@file <- h5.loc
    assay(sce) <- counts
    return(sce)
}
