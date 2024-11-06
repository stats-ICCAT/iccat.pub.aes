# ICCAT public aesthetics library

A set of reference data constants - and the code to build them - meant for public usage and modeling the core ICCAT aesthetics (i.e., outline and fill colors) for core datasets and categories.

The included reference data provides standard colors for the following categories:

-   [gear groups](https://github.com/stats-ICCAT/iccat.pub.aes/blob/main/data/REF_GEAR_GROUPS_COLORS.rda)
-   [species' gear groups](https://github.com/stats-ICCAT/iccat.pub.aes/blob/main/data/REF_SPECIES_GEAR_GROUPS_COLORS.rda) (as used by the CATDIS maps)
-   [catch types](https://github.com/stats-ICCAT/iccat.pub.aes/blob/main/data/REF_CATCH_TYPES_COLORS.rda)

The format of each color table is as follows:

|*dataset-dependent code column*|FILL   |COLOR|
|-------------------------------|---------|-------|
|*alphanumeric code*            |*RGB color*|*RGB color*|

Where the *dataset-dependent code column* name changes with the specific type of reference data (e.g., `CATCH_TYPE_CODE` for catch types, or `GEAR_GROUP_CODE` for gear groups). 

Also, the *alphanumeric code* value depends on the valid entries expected for the specific type of reference data, while `FILL` and `COLOR` values correspond to the RGB colors for the two different types of aesthetics.

The former (`FILL`) is the color used for the inner part of the bar / area charts, and the latter (`COLOR`) is the color used for the outline of each bar / area chart).

Example from the [catch types](https://github.com/stats-ICCAT/iccat.pub.aes/blob/main/data/REF_CATCH_TYPES_COLORS.rda) aesthetics table:

|CATCH_TYPE_CODE|FILL   |COLOR  |
|---------------|-------|-------|
|C              |#66C2A5|#3C856F|
|FA             |#B15932|#B15932|
|L              |#AB98C8|#796497|
|LF             |#C6B18B|#8B7850|
|DD             |#E1D83B|#999203|
|DL             |#E9C783|#A98504|
|DM             |#B3B3B3|#7A7A7A|

Example of results using the *catch type* aesthetics (from the [T1NC dashboard](https://iccat.shinyapps.io/T1NC_dashboard) app:

![image](https://github.com/user-attachments/assets/91fec789-eb57-4e75-b74c-48153d53799a)

# External dependencies (CRAN) <a name="external_deps"></a>
+ `data.table`
+ `colorspace`
+ `RColorBrewer`
+ 
### Installation
```
install.packages(c("data.table", "colorspace", "RColorBrewer"))
```

# Internal dependencies <a name="internal_deps"></a>
+ [iccat.pub.data](https://github.com/stats-ICCAT/iccat.pub.data)

### Installation (straight from GitHub)
```
library(devtools)

install_github("stats-ICCAT/iccat.pub.data")
```

# How to update <a name="update_process"></a>

ICCAT aesthetics reference data (i.e., all available color tables) can be updated by explicitly executing the [`initialize_reference_data_aesthetics.R`](https://github.com/stats-ICCAT/iccat.pub.aes/blob/main/data-raw/initialize_reference_data_aesthetics.R) script (currently stored under the standard [`data-raw`](https://github.com/stats-ICCAT/iccat.pub.aes/tree/main/data-raw) folder).

After the new reference data have been created and placed under the [`data`](https://github.com/stats-ICCAT/iccat.pub.aes/tree/main/data) folder, the [`data.R`](https://github.com/stats-ICCAT/iccat.pub.aes/blob/main/data/data.R) script **must** be updated to properly document the additions and ensure these are exported by the library.

# Building the library

Assuming that all [external](#external_deps) and [internal](#internal_deps) dependencies are already installed in the R environment, and that the `devtools` package and [RTools](https://cran.r-project.org/bin/windows/Rtools/) are both available, the building process can be either started within R studio by selecting the Build > Build Source Package menu entry:

![image](https://github.com/user-attachments/assets/f209d8d4-568c-4200-bcf2-fb1fa0e1d2ef)

or by executing the following statement:

`devtools::document(roclets = c('rd', 'collate', 'namespace'))`

> For changes to the color tables to be included in the library at build time, all steps of the [update process](#update_process) shall be executed successfully *before* the build starts.

# Future extensions

+ [ ] the *dataset-dependent code column* should instead be made uniform (e.g., `CODE`) across all different reference datasets. This will require changing the code of all other dependent libraries and apps using the default aesthetics. 
+ [ ] the library should be extended to also include reference data colors for the **school types**, which are now embedded in the other libraries / apps that require them. 
 
