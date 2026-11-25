## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----setup--------------------------------------------------------------------
library(knbsdata)

## -----------------------------------------------------------------------------
knbs_sources(operation = "search_surveys")

## ----eval = FALSE-------------------------------------------------------------
# studies <- knbs_search_surveys("household budget")
# studies

## ----eval = FALSE-------------------------------------------------------------
# knbs_search_surveys(year = c(2015, 2020))
# knbs_search_surveys(access = "public_use", limit = 10)

## ----eval = FALSE-------------------------------------------------------------
# meta <- knbs_survey_metadata("KEN-KNBS-KIHBS-2015-2016-v01")
# meta

## ----eval = FALSE-------------------------------------------------------------
# knbs_survey_metadata("KEN-KNBS-KIHBS-2015-2016-v01", include = c("scope", "access"))

## ----eval = FALSE-------------------------------------------------------------
# knbs_variables("KEN-KNBS-KIHBS-2015-2016-v01", search = "expenditure")
# knbs_variables("KEN-KNBS-KIHBS-2015-2016-v01", file = "HH_Information")

## ----eval = FALSE-------------------------------------------------------------
# knbs_variables(
#   "KEN-KNBS-KIHBS-2015-2016-v01",
#   search = "county",
#   details = TRUE
# )

## ----eval = FALSE-------------------------------------------------------------
# knbs_survey_files("KEN-KNBS-KIHBS-2015-2016-v01")

## ----eval = FALSE-------------------------------------------------------------
# knbs_download_microdata("KEN-KNBS-KIHBS-2015-2016-v01")
# #> Error: Microdata from "kenada" cannot be downloaded programmatically.
# #> x Every download requires an account with the archive.
# #> i Register and request access at <https://statistics.knbs.or.ke/nada/index.php/home>.
# #> i knbsdata does not automate sign-in, licence acceptance or approval workflows.

## ----eval = FALSE-------------------------------------------------------------
# # The catalogue ships with the package: listing it contacts nothing
# knbs_finaccess_files(content = "data")
# 
# # Download and read the 2024 household survey (Stata, 160 MB). Name any folder
# # you like; tempdir() keeps it for this session only.
# dir <- file.path(tempdir(), "finaccess")
# fa <- knbs_read_microdata(knbs_download_finaccess("hh2024-stata", dir))
# knbs_cite(fa)

## ----eval = FALSE-------------------------------------------------------------
# fa <- knbs_read_microdata(file.path(dir, "2024_Finaccess_Publicdata.dta"),
#                           col_select = c("county", "A13", "A18"))
# attr(fa$A18, "label")                  # "A18. AGE OF RESPONDENT"
# table(haven::as_factor(fa$A13))        # value labels as factor levels
# 
# # Respondents' counties as census codes, ready to join census tables
# fa$geo_code <- knbs_county_code(haven::as_factor(fa$county))

## ----eval = FALSE-------------------------------------------------------------
# result <- tryCatch(
#   knbs_survey_metadata("Kenya"),
#   knbs_error_ambiguous_resource = function(cnd) {
#     message("Several studies match; using the first.")
#     knbs_survey_metadata(cnd$matches[[1]])
#   },
#   knbs_error_resource_not_found = function(cnd) NULL,
#   knbs_error_source_unavailable = function(cnd) NULL
# )

## ----eval = FALSE-------------------------------------------------------------
# knbs_cite(meta)

## ----eval = FALSE-------------------------------------------------------------
# knbs_cache_info()
# knbs_search_surveys("household budget", refresh = TRUE)  # bypass the cache
# knbs_cache_clear()

