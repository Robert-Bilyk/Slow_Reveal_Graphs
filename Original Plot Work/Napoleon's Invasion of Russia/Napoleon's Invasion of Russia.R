library(tidyverse)
library(showtext)
library(readxl)
library(magick)

gap <- ggplot() + theme_void()

picture <- image_graph(width = 2000, height = 900)
gap 
dev.off()

img <- image_draw(picture)
#Borderlines
segments(x0=0,y0=760, x1=1930, y1=760, lwd = 1, lty = "solid")
segments(x0=0,y0=695, x1=2000, y1=695, lwd = 1, lty = "solid")
segments(x0=0,y0=692, x1=2000, y1=692, lwd = 1, lty = "solid")

#Horz Graph Lines
segments(x0=550,y0=797, x1=1930, y1=797, lwd = 1, lty = "solid")
segments(x0=550,y0=834, x1=1930, y1=834, lwd = 1, lty = "solid")
segments(x0=550,y0=871, x1=1930, y1=871, lwd = 1, lty = "solid")

#Vert Graph Lines
segments(x0=1930,y0=871, x1=1930, y1=315, lwd = 1, lty = "solid")
segments(x0=550,y0=871, x1=550, y1=585, lwd = 1, lty = "solid")
segments(x0=635,y0=871, x1=635, y1=545, lwd = 1, lty = "solid")
segments(x0=750,y0=853, x1=750, y1=545, lwd = 1, lty = "solid")
segments(x0=870,y0=797, x1=870, y1=545, lwd = 1, lty = "solid")
segments(x0=1228,y0=853, x1=1228, y1=545, lwd = 1, lty = "solid")
segments(x0=1413,y0=853, x1=1413, y1=545, lwd = 1, lty = "solid")


dev.off()


image_write(img, path = here::here("Original Plot Work", "Napoleon's Invasion of Russia", "Napoleon's Invasion of Russia.png"), format = "png")



