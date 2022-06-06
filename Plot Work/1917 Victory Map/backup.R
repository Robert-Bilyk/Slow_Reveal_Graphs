library(tidyverse)
library(showtext)
library(readxl)
library(grid)
library(ggpattern)
library(maps)
library(mapdata)
library(stringr)
map <- map_data("state")
types <- read_xlsx(here::here("Plot Work", "1917 Victory Map", "Victory Map of 1917 State Types.xlsx"))

x_cross <- system.file("img", "x cross pattern.jpg", package = "ggpattern")
x_dot <- system.file("img", "x cross dot.jpg", package = "ggpattern")

types$State <- tolower(types$State)

newmap <- map %>%
  inner_join(types, by = c("region" = "State"))

png(here::here("Plot Work", "1917 Victory Map", "Victory_Map.png"),width=1000,height=600)

ggplot(data = newmap) + 
  geom_polygon_pattern(aes(x=long, y=lat, group=group, 
                           fill = Type,
                           pattern = Type,
                           pattern_fill = Type,
                           pattern_spacing = Type,
                           pattern_type = Type,
                           pattern_filename = Type,
                           pattern_scale = Type,
                           pattern_density = Type,
                           pattern_angle = Type),
                       color="grey") +
  theme(legend.position = "bottom",
        legend.title = element_blank(),
        legend.text = element_text(size = 12),
        legend.key.width = unit(1.8, "cm"),
        legend.key.height = unit(.9, "cm"),
        legend.direction = "horizontal") +
  scale_fill_manual(values = c("white","black","white","white","white","black","white", "white")) +
  scale_pattern_manual(values = c("none", "circle", "image", "circle", "stripe", "none", "image", "none")) +
  scale_pattern_fill_manual(values = c("white", "white", "black", "black", "white", "white", "white", "white")) +
  scale_pattern_spacing_manual(values = c(.05, .025, .05, .025, .05, .05, .05, .05)) +
  scale_pattern_type_manual(values = c(NA, NA, "tile", NA, NA, NA, "squish", NA)) +
  scale_pattern_filename_manual(values = c(NA, NA, x_dot, NA, NA, NA, x_cross, NA)) +
  scale_pattern_scale_manual(values = c(1, 1, .09, 1, 1, 1, 1, 1)) +
  scale_pattern_density_manual(values = c(.2, .3, .2, .2, .01, .2, .2, .2)) +
  scale_pattern_angle_manual(values = c(30, 30, 30, 30, 0, 30, 30, 30))

dev.off() 