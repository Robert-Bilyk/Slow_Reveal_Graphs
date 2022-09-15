library(tidyverse)
library(showtext)
library(magick)


#Add Dimensions
gap <- ggplot() + theme_void() + 
  theme(plot.background = element_rect(color = "#cabc8d", fill = "#cabc8d"))

picture <- image_graph(width = 1350, height = 900)

gap 

dev.off()


img <- image_draw(picture)

#top left
segments(x0=90, x1=275, y0=50, y1=50, lwd = 1, lty = "solid")
segments(x0=90, x1=90, y0=50, y1=130, lwd = 1, lty = "solid")
segments(x0=275, x1=275, y0=50, y1=130, lwd = 1, lty = "solid")
segments(x0=90, x1=275, y0=130, y1=130, lwd = 1, lty = "solid")

#top2 far left
segments(x0=90, x1=175, y0=140, y1=140, lwd = 1, lty = "solid")
segments(x0=90, x1=170, y0=600, y1=600, lwd = 1, lty = "solid")
segments(x0=90, x1=90, y0=140, y1=600, lwd = 1, lty = "solid")
segments(x0=170, x1=170, y0=325, y1=600, lwd = 1, lty = "solid")
segments(x0=170, x1=175, y0=325, y1=325, lwd = 1, lty = "solid")
segments(x0=175, x1=175, y0=325, y1=140, lwd = 1, lty = "solid")

#top2 left2
segments(x0=275, x1=200, y0=140, y1=140, lwd = 1, lty = "solid")
segments(x0=200, x1=200, y0=140, y1=190, lwd = 1, lty = "solid")
segments(x0=200, x1=200, y0=190, y1=190, lwd = 1, lty = "solid")
segments(x0=195, x1=200, y0=190, y1=190, lwd = 1, lty = "solid")
segments(x0=195, x1=195, y0=190, y1=325, lwd = 1, lty = "solid")
segments(x0=195, x1=190, y0=325, y1=325, lwd = 1, lty = "solid")
segments(x0=190, x1=190, y0=525, y1=325, lwd = 1, lty = "solid")
segments(x0=190, x1=270, y0=525, y1=525, lwd = 1, lty = "solid")
segments(x0=270, x1=270, y0=525, y1=325, lwd = 1, lty = "solid")
segments(x0=275, x1=270, y0=325, y1=325, lwd = 1, lty = "solid")
segments(x0=275, x1=270, y0=325, y1=325, lwd = 1, lty = "solid")
segments(x0=275, x1=275, y0=140, y1=325, lwd = 1, lty = "solid")

#top 3 left 2
segments(x0=270, x1=190, y0=535, y1=535, lwd = 1, lty = "solid")

dev.off()

image_write(img, path = here::here("Original Plot Work", "Hull House Nationality Map1", "National1-Hullhouse.png"), format = "png")

