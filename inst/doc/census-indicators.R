## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----setup--------------------------------------------------------------------
library(knbsdata)

## ----eval = FALSE-------------------------------------------------------------
# knbs_indicators()                  # all families, source_id says which
# cpi <- knbs_get_indicator("CPI_ALL_ITEMS", start = "2020-01")
# gdp <- knbs_get_indicator("DF_NAT_GDPCP")
# pop <- knbs_get_indicator("POPCEN0001", geo_level = "county")
# gcp <- knbs_get_indicator("jhbzkjc") # Gross County Product, 2013-2020

## ----eval = FALSE-------------------------------------------------------------
# knbs_indicators(source = "opendataforafrica", search = "county product")
# gcp <- knbs_get_indicator("jhbzkjc")
# gcp[gcp$table_code == "T3" & gcp$period == 2020, ]  # current-price GCP, 2020

## ----eval = FALSE-------------------------------------------------------------
# knbs_get_indicator("CPI_INFLATION_YOY", start = 2015, end = 2020)

## ----eval = FALSE-------------------------------------------------------------
# knbs_get_indicator("CPI_ALL_ITEMS", geo_level = "region")
# knbs_get_indicator("CPI_ALL_ITEMS", geo_code = c("national", "1"))

## ----eval = FALSE-------------------------------------------------------------
# knbs_retail_prices(commodity = "petrol", start = 2024)
# knbs_retail_prices(start = "2026-06", end = "2026-06")   # one month, all 22

## ----eval = FALSE-------------------------------------------------------------
# knbs_indicators()
# knbs_indicators(topic = "Population")
# knbs_indicators(search = "marital")

## ----eval = FALSE-------------------------------------------------------------
# pop <- knbs_get_indicator("POPCEN0001")
# pop

## ----eval = FALSE-------------------------------------------------------------
# counties <- knbs_get_indicator("POPCEN0001", geo_level = "county")
# nairobi  <- knbs_get_indicator("POPCEN0001", geo_code = "47")

## ----eval = FALSE-------------------------------------------------------------
# pop <- knbs_get_indicator("POPCEN0001", geo_level = "county")
# totals <- pop[pop$sex == "total" & pop$marital_status == "Total",
#               c("geo_code", "geo_name", "value")]
# totals[order(-totals$value), ]

## ----eval = FALSE-------------------------------------------------------------
# knbs_metadata(pop)
# knbs_cite(pop)

