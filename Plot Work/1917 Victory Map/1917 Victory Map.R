library(tidyverse)
library(showtext)
library(readxl)
library(grid)
library(ggpattern)
library(maps)
library(mapdata)


map <- map_data("state")
types <- read_xlsx(here::here("Plot Work", "1917 Victory Map", "Victory Map of 1917 State Types.xlsx"))

types$State <- tolower(types$State)

newmap <- map %>%
  inner_join(types, by = c("region" = "State"))


ggplot(newmap, aes(x = long, y = lat, group = group, pattern = Type)) +
  geom_polygon_pattern(fill="lightgray", colour = "white")