## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----setup--------------------------------------------------------------------
library(knbsdata)

## -----------------------------------------------------------------------------
knbs_abstract_tables()

## ----eval = FALSE-------------------------------------------------------------
# gdp <- knbs_abstract_table("2.2")     # GDP by activity, current prices
# gdp[gdp$industry == "GDP at market prices", c("period", "status", "value")]
# #> # A tibble: 10 x 3
# #>    period status         value
# #>     <int> <chr>          <dbl>
# #>  1   2015 NA           6884326
# #>  2   2016 NA           7594064
# #>  ...
# #>  9   2023 revised     15033610
# #> 10   2024 provisional 16224478

## ----eval = FALSE-------------------------------------------------------------
# saving <- knbs_abstract_table("disposable income")   # resolves to 2.9

## ----eval = FALSE-------------------------------------------------------------
# library(dplyr)
# 
# births <- knbs_abstract_table("16.11") |>          # by county of occurrence
#   filter(period == 2019L, geo_code != "00")
# pop <- knbs_get_indicator("POPCEN0002", geo_level = "county") |>
#   filter(sex == "total", age_type == "total")
# 
# births |>
#   inner_join(pop, by = "geo_code", suffix = c("_births", "_pop")) |>
#   mutate(births_per_1000 = 1000 * value_births / value_pop) |>
#   arrange(desc(births_per_1000))
# #> Kericho 37.0, Busia 34.4, Nairobi City 33.4, ... Mandera 14.3, Wajir 8.2

## ----eval = FALSE-------------------------------------------------------------
# knbs_metadata(knbs_abstract_table("7.6"))$notes
# #> ... "Coffee and tea are auction prices; coffee refers to coffee beans
# #>      and tea to black tea." "Rice paddy prices for 2020 and 2021 are
# #>      revised." "Source as printed: Marketing Boards, Millers and
# #>      Ginneries." ...

## ----eval = FALSE-------------------------------------------------------------
# library(dplyr)
# library(tidyr)
# 
# # The largest industries in 2024. Keeping one level of the table - the
# # parts of "All industries" - leaves out the totals and the sub-industries
# # that would otherwise crowd the ranking.
# knbs_abstract_table("2.2") |>
#   filter(period == 2024, parent == "All industries") |>
#   slice_max(value, n = 5) |>
#   select(industry, value, status)
# 
# # The breakdown of one industry
# knbs_abstract_table("2.2") |>
#   filter(period == 2024, parent == "Agriculture, forestry and fishing")
# 
# # Recreate the printed-table look: industries by year, wide
# knbs_abstract_table("2.4") |>
#   filter(industry %in% c("Agriculture, forestry and fishing",
#                          "Manufacturing", "GDP at market prices")) |>
#   select(industry, period, value) |>
#   pivot_wider(names_from = period, values_from = value)
# 
# # Sectioned tables group naturally
# knbs_abstract_table("2.1") |>
#   filter(measure == "Gross value added at basic prices", period == 2024) |>
#   arrange(desc(value))
# 
# # And straight into ggplot2
# library(ggplot2)
# knbs_abstract_table("2.5") |>
#   filter(industry == "GDP at market prices") |>
#   ggplot(aes(period, value)) +
#   geom_col() +
#   labs(title = "Real GDP growth", y = "per cent")

## ----eval = FALSE-------------------------------------------------------------
# meta <- knbs_metadata(gdp)
# meta$source_url   # the workbook on knbs.or.ke
# meta$notes        # edition, sheet, workbook SHA-256, flag legend
# knbs_cite(gdp)

