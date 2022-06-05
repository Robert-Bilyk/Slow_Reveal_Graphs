library(tidyverse)
library(showtext)
library(readxl)
library(grid)
library(ggpattern)
library(maps)
library(mapdata)


map <- map_data("state")
types <- read_xlsx(here::here("Plot Work", "1917 Victory Map", "Victory Map of 1917 State Types.xlsx"))

x_cross <- system.file("img", "x cross pattern.jpg", package = "ggpattern")
x_dot <- system.file("img", "x cross dot.jpg", package = "ggpattern")

types$State <- tolower(types$State)

newmap <- map %>%
  inner_join(types, by = c("region" = "State")) %>%
  mutate(my_color = ifelse(region == "washington", TRUE, FALSE)) 


png(here::here("Plot Work", "1917 Victory Map", "Victory_Map.png"),width=700,height=400)

ggplot(data = newmap) + 
  geom_polygon_pattern(aes(x=long, y=lat, group=group, 
                   fill = Type,
                   pattern = Type,
                   pattern_fill = Type,
                   pattern_spacing = Type,
                   pattern_type = Type,
                   pattern_filename = Type,
                   pattern_scale = Type,
                   pattern_density = Type),
               color="grey") +
  scale_fill_manual(values = c("white","black","white","white","white","black","white")) +
  scale_pattern_manual(values = c("none", "circle", "image", "circle", "stripe", "none", "image")) +
  scale_pattern_fill_manual(values = c("white", "white", "black", "black", "white", "white", "white")) +
  scale_pattern_spacing_manual(values = c(.05, .02, .05, .02, .0, .05, .05)) +
  scale_pattern_type_manual(values = c(NA, NA, "tile", NA, NA, NA, "tile")) +
  scale_pattern_filename_manual(values = c(NA, NA, x_dot, NA, NA, NA, x_cross)) +
  scale_pattern_scale_manual(values = c(1, 1, .06, 1, 1, 1, .06)) +
  scale_pattern_density_manual(values = c(.2, .3, .2, .2, .2, .2,.2))


dev.off()