library(rworldmap)

newmap <- getMap(resolution = "low")
plot(newmap)




library(sf)
library(tidyverse)
library(maps)
library(ggspatial)
library(rnaturalearth)
library(rnaturalearthdata)

world <- ne_countries(scale = "medium", returnclass = "sf")
asia_cropped <- st_crop(world, xmin = 100, xmax = 110,
                        ymin = 7, ymax = 24) #cropping map

rivers50 <- ne_download(scale = 50, type = 'rivers_lake_centerlines', category = 'physical') 

rivers_cropped <- st_crop(st_as_sf(rivers50), xmin = 100, xmax = 110,
                          ymin = 7, ymax = 24)

ggplot() + geom_sf(data = asia_cropped) + theme_bw() + #south east asia
  annotate(geom = "text", x = 107, y = 8, label = "South China Sea", #adding S' China sea  
           fontface = "italic", color = "grey22", size = 4)  + 
  geom_sf(data = rivers_cropped, col = 'blue')

library(tidyverse)
library(showtext)
library(readxl)
library(magick)

frink <- image_read("https://jeroen.github.io/images/frink.png")
plot(as.raster(frink))

rasterImage(frink, -100, 10, 25, 80)


print(frink)

neim <- image_read(here::here("Original Plot Work", "Napoleon's Invasion of Russia", "Neiman.PNG"))
plot(as.raster(neim))

rasterImage(neim, -100, 10, 25, 80)