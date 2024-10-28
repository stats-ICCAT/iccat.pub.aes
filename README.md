# ICCAT public aesthetics library

A set of reference data constants - and the code to build them - meant for public usage and modeling the core ICCAT aesthetics (i.e., outline and fill colors) for core datasets and categories.

The included reference data provides standard colors for the following categories:

-   [gear groups]()
-   [species' gear groups]() (as used by the CATDIS maps)
-   [catch types]()

# External dependencies (CRAN)

-   data.table
-   colorspace
-   RColorBrewer

# Internal dependencies

-   [iccat.pub.data](https://github.com/stats-ICCAT/iccat.pub.data)

# How to update

If needed, the reference data shall be updated by executing the [`initialize_reference_data_aesthetics.R`](https://github.com/stats-ICCAT/iccat.pub.aes/blob/main/data-raw/initialize_reference_data_aesthetics.R) script (currently stored under the standard `data-raw` folder).

After the new reference data have been created and placed under the `data` folder, the [`data.R`](https://github.com/stats-ICCAT/iccat.pub.aes/blob/main/data/data.R) script **must** be updated to properly document the additions and ensure these are exported by the library.

# Future extensions

The library should be extended to also include reference data colors for the **school types**, which are now embedded in the other libraries / apps that require them. 
