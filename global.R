# Libraries
library(shiny)
library(shiny.semantic)

library(tidyverse)
library(geosphere)
library(leaflet)


# Read dataframe 
df <- readRDS("./data/df_sample.RDS")
# df_sample <- df %>% dplyr::slice(1:1000000)
# saveRDS(df_sample, "data/df_sample.RDS")
# df <- read.csv("./data/ships.csv") %>% tibble::as_tibble()


# Icon
shipIcon <- iconList(
  end = makeIcon("img/vessel_icon.jpeg", iconWidth = 30, iconHeight = 30)
)


# Load functions
dir("src", recursive = TRUE, full.names = T) %>%
  purrr::walk(~source(.x, encoding = "UTF-8"))


  