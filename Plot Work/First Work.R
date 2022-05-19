library(tidyverse)
library(ggplot2)
library(sf)
library(maps)
library(rnaturalearth)
library(rnaturalearthdata)
library(usmap)

world <- ne_countries(scale = "medium", returnclass = "sf")


test <- ne_countries(geounit = 'United States of America', scale = "medium", returnclass = "sf")
ggplot(data = test) +
  geom_sf()

map('county', 'michigan', fill = TRUE, col = palette())
map('state')

plot_usmap(exclude = c("AK","HI"))



























