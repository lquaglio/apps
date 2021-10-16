# Libraries
library(shiny)
library(shiny.semantic)

library(tidyverse)
library(geosphere)
library(leaflet)


# Read dataframe 
df <- readRDS("./data/ships.RDS")
# df <- read.csv("./data/ships.csv") %>% tibble::as_tibble()


# Icon
shipIcon <- iconList(
  end = makeIcon("img/vessel_icon.jpeg", iconWidth = 30, iconHeight = 30)
)


# Load functions
dir("src", recursive = TRUE, full.names = T) %>%
  purrr::walk(~source(.x, encoding = "UTF-8"))


  