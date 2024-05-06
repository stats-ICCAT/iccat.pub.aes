### REF_GEAR_GROUP

library(iccat.pub.data)
library(colorspace)
library(RColorBrewer)
library(Polychrome)

### Gear groups
#REF_GEAR_GROUPS_COLORS = brewer.pal(n = 9, name = "Set1")
#REF_GEAR_GROUPS_COLORS = colorRampPalette(REF_GEAR_GROUPS_COLORS)(length(REF_GEAR_GROUPS$CODE))

REF_GEAR_GROUPS_COLORS =
  data.table(
    GEAR_GROUP_CODE = REF_GEAR_GROUPS$CODE,
    #FILL            = REF_GEAR_GROUPS_COLORS[1:nrow(REF_GEAR_GROUPS)],
    FILL            = NA_character_
  )

REF_GEAR_GROUPS_COLORS[!GEAR_GROUP_CODE %in% c("UN", "OT"), FILL := colorRampPalette(brewer.pal(n = 12, name = "Paired"))(length(REF_GEAR_GROUPS$CODE) - 2)]
REF_GEAR_GROUPS_COLORS[GEAR_GROUP_CODE == "UN", FILL := "#888888"]
REF_GEAR_GROUPS_COLORS[GEAR_GROUP_CODE == "OT", FILL := "#222222"]

REF_GEAR_GROUPS_COLORS$GEAR_GROUP_CODE =
  factor(
    REF_GEAR_GROUPS_COLORS$GEAR_GROUP_CODE,
    labels = REF_GEAR_GROUPS$CODE,
    levels = REF_GEAR_GROUPS$CODE,
    ordered = TRUE
  )

REF_GEAR_GROUPS_COLORS[, COLOR := darken(FILL, amount = .3)]
REF_GEAR_GROUPS_COLORS = REF_GEAR_GROUPS_COLORS[order(GEAR_GROUP_CODE)]

usethis::use_data(REF_GEAR_GROUPS_COLORS, overwrite = TRUE, compress = "gzip")

### Catch types
REF_CATCH_TYPES_COLORS = brewer.pal(n = 8, name = "Set2")
REF_CATCH_TYPES_COLORS = colorRampPalette(REF_CATCH_TYPES_COLORS)(length(REF_CATCH_TYPES$CODE))

REF_CATCH_TYPES_COLORS =
  data.table(
    CATCH_TYPE_CODE = REF_CATCH_TYPES$CODE,
    FILL            = REF_CATCH_TYPES_COLORS[1:nrow(REF_CATCH_TYPES)]
  )

REF_CATCH_TYPES_COLORS$CATCH_TYPE_CODE =
  factor(
    REF_CATCH_TYPES_COLORS$CATCH_TYPE_CODE,
    labels = REF_CATCH_TYPES$CODE,
    levels = REF_CATCH_TYPES$CODE,
    ordered = TRUE
  )

REF_CATCH_TYPES_COLORS[, COLOR := darken(FILL, amount = .3)]
REF_CATCH_TYPES_COLORS = REF_CATCH_TYPES_COLORS[order(CATCH_TYPE_CODE)]

usethis::use_data(REF_CATCH_TYPES_COLORS, overwrite = TRUE, compress = "gzip")
