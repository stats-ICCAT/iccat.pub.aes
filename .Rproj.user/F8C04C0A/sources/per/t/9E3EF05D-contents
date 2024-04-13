### REF_GEAR_GROUP

library(iccat.pub.data)
library(colorspace)
library(RColorBrewer)

REF_GEAR_GROUPS_COLORS = brewer.pal(n = 9, name = "Set1")
REF_GEAR_GROUPS_COLORS = colorRampPalette(REF_GEAR_GROUPS_COLORS)(length(REF_GEAR_GROUPS$CODE))

REF_GEAR_GROUPS_COLORS =
  data.table(
    GEAR_GROUP_CODE = REF_GEAR_GROUPS$CODE,
    FILL            = REF_GEAR_GROUPS_COLORS[1:nrow(REF_GEAR_GROUPS)]
  )

REF_GEAR_GROUPS_COLORS[GEAR_GROUP_CODE == "OT", FILL := "#111111"]

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
