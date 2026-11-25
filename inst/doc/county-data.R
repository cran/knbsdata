## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----setup--------------------------------------------------------------------
library(knbsdata)

## ----eval = FALSE-------------------------------------------------------------
# geo <- knbs_geographies()
# counties <- knbs_geographies(level = "county")
# mombasa_subs <- knbs_geographies(parent = "01")

## ----eval = FALSE-------------------------------------------------------------
# pop <- knbs_get_indicator("POPCEN0001", geo_level = "county")
# totals <- pop[pop$sex == "total" & pop$marital_status == "Total",
#               c("geo_code", "geo_name", "value")]
# 
# geo <- knbs_geographies(level = "county")
# joined <- merge(totals, geo[, c("geo_code", "parent_code")], by = "geo_code")
# 
# joined$share <- joined$value / sum(joined$value)
# head(joined[order(-joined$share), ])

## ----eval = FALSE-------------------------------------------------------------
# gcp <- knbs_get_indicator("jhbzkjc")
# latest <- gcp[gcp$table_code == "T3" & gcp$period == 2020 & gcp$geo_code != "KE", ]
# head(latest[order(-latest$value), c("geo_name", "value")])

## ----eval = FALSE-------------------------------------------------------------
# stunting <- knbs_get_indicator("CN_NUTS_C_HA2", geo_level = "county")
# pop <- knbs_get_indicator("POPCEN0002", geo_level = "county")
# pop <- pop[pop$age_type == "total" & pop$sex == "total", c("geo_code", "value")]
# 
# joined <- merge(stunting[stunting$period == 2022, ], pop, by = "geo_code",
#                 suffixes = c("", "_population"))
# head(joined[order(-joined$value), c("geo_name", "value", "value_population")], 3)
# #>      geo_name value value_population
# #> 3      Kilifi  37.0          1440770
# #> 24 West Pokot  33.5           618761
# #> 25    Samburu  31.4           307946

## ----eval = FALSE-------------------------------------------------------------
# knbs_county_code(c("Murang'a", "MURANGA", "Nairobi City County",
#                    "taita/taveta", "Homabay", "47"))
# #> [1] "21" "21" "47" "06" "43" "47"

## ----eval = FALSE-------------------------------------------------------------
# knbs_county_code("Kakamenga")
# #> Warning: 1 value matched no county and became `NA`:
# #> • "Kakamenga" (did you mean "Kakamega"?)
# 
# knbs_match_counties(c("Kakamenga", "Uasin-Gishu", "07"))   # how each matched

## ----eval = FALSE-------------------------------------------------------------
# library(dplyr)
# 
# rural <- knbs_get_indicator("DF_POP_CENSUS_RUR", source = "knbs_opendata") |>
#   filter(indic_phc_code == "POP_TOT", sex == "total", geo_code != "KE") |>
#   mutate(county_code = knbs_county_code(geo_name))     # "MURANGA" -> "21"
# 
# total <- knbs_get_indicator("POPCEN0002", geo_level = "county") |>
#   filter(sex == "total", age_type == "total")
# 
# rural |>
#   inner_join(total, by = c(county_code = "geo_code"),
#              suffix = c("_rural", "_total")) |>
#   mutate(rural_share = value_rural / value_total) |>
#   arrange(desc(rural_share))
# #> Bomet 0.97, Kitui 0.96, Elgeyo/Marakwet 0.96, ... Kiambu 0.30;
# #> Nairobi City and Mombasa NA: the portal reports no rural population there.

