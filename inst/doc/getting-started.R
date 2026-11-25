## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----setup--------------------------------------------------------------------
library(knbsdata)

## -----------------------------------------------------------------------------
knbs_sources()

## ----eval = FALSE-------------------------------------------------------------
# meta <- knbs_survey_metadata("KEN-KNBS-KIHBS-2015-2016-v01")
# knbs_metadata(meta)

## ----eval = FALSE-------------------------------------------------------------
# knbs_cite(meta)
# knbs_cite(meta, style = "bibtex")

## ----eval = FALSE-------------------------------------------------------------
# tryCatch(
#   knbs_survey_metadata("Kenya"),
#   knbs_error_ambiguous_resource = function(cnd) cnd$matches
# )

## ----eval = FALSE-------------------------------------------------------------
# library(dplyr)
# library(tidyr)
# 
# knbs_get_indicator("jhbzkjc") |>                    # Gross County Product
#   filter(table_code == "T3", period == 2020) |>
#   slice_max(value, n = 5)
# 
# knbs_abstract_table("2.2") |>                       # years across, like print
#   select(industry, period, value) |>
#   pivot_wider(names_from = period, values_from = value)

## ----eval = FALSE-------------------------------------------------------------
# hits <- knbs_search("consumer price index")
# hits[, c("resource_type", "resource_id", "title", "get")]
# #>   resource_type resource_id   title                            get
# #> 1 indicator     CPI_ALL_ITEMS Consumer Price Index, all items  knbs_get_indicator("CPI_ALL_ITEMS", source = "knbs_cpi")
# #> 2 publication   17052         Kenya-Consumer-Price-Indices-…   knbs_download_publication("17052", destination = tempdir())
# #> ...
# 
# eval(parse(text = hits$get[[1]]))   # or copy the call

## ----eval = FALSE-------------------------------------------------------------
# # 1. Find something
# studies <- knbs_search_surveys("household budget")
# 
# # 2. Read its record
# meta <- knbs_survey_metadata(studies$survey_id[[1]])
# 
# # 3. See what variables it documents
# knbs_variables(meta$resource_id, search = "expenditure")
# 
# # 4. See what files exist, and on what terms
# knbs_survey_files(meta$resource_id)
# 
# # 5. Record what you used
# knbs_cite(meta)

## ----eval = FALSE-------------------------------------------------------------
# pubs <- knbs_publications("economic survey", year = 2026)
# knbs_download_publication(pubs$publication_id[[1]], tempdir())

## ----eval = FALSE-------------------------------------------------------------
# cpi <- knbs_get_indicator("CPI_ALL_ITEMS", start = "2020-01")
# gdp <- knbs_get_indicator("DF_NAT_GDPCP")            # GDP by activity, SDMX
# knbs_get_indicator("DF_PF_CG_REV")                   # county govt revenue
# gcp <- knbs_get_indicator("jhbzkjc")                 # Gross County Product
# 
# knbs_indicators(topic = "Population")
# pop <- knbs_get_indicator("POPCEN0001", geo_level = "county")
# 
# # The matching reference codes, for census joins
# knbs_geographies(level = "county")

## -----------------------------------------------------------------------------
knbs_options()

## ----eval = FALSE-------------------------------------------------------------
# knbs_options(timeout = 60, retries = 5)

## ----eval = FALSE-------------------------------------------------------------
# knbs_cache_info()
# knbs_search_surveys("household budget", refresh = TRUE)  # ignore the cache
# knbs_cache_clear()

