library(tidyverse)
library(showtext)
library(readxl)
library(magick)

gap <- ggplot() + theme_void()

picture <- image_graph(width = 2000, height = 900)
gap 
dev.off()

img <- image_draw(picture)
#Red Lines
polygon(c(78, 125, 249, 207), c(400, 555, 520, 355), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(208, 220, 220, 208), c(370, 420, 230.5, 230), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(208, 205, 340, 340), c(370, 530, 550, 390), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(340, 340, 502, 518), c(415, 390, 267, 280), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(620, 622, 502, 510), c(297, 280, 267, 285), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(620, 622, 790, 795), c(293, 280, 295, 308), border = "#Cb6b57", col = "#Cb6b57")

polygon(c(340, 485, 455, 340), c(550, 510, 385, 410), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(480, 585, 550, 455), c(505, 475, 360, 390), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(583, 650, 645, 550), c(470, 450, 343, 367), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(645, 670, 660, 645), c(452, 449.5, 342, 343), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(670, 775, 763, 660), c(445, 430, 334, 348), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(775, 858, 848, 763), c(425, 415, 328, 340), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(858, 948, 938, 848), c(410, 400, 323, 333), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(948, 979, 972, 939), c(395, 392, 325, 327), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(965, 973, 1200, 1200), c(392, 325, 405, 475), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(1415, 1400, 1200, 1200), c(400, 335, 405, 475), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(1415, 1400, 1585, 1605), c(400, 335, 160, 220), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(1695, 1710, 1585, 1605), c(245, 195, 160, 220), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(1695, 1705, 1740, 1740), c(245, 203, 213, 257), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(1740, 1740, 1945, 1930), c(213, 257, 150, 110), border = "#Cb6b57", col = "#Cb6b57")

#Borderlines
segments(x0=0,y0=760, x1=1930, y1=760, lwd = 1, lty = "solid")
segments(x0=0,y0=695, x1=2000, y1=695, lwd = 1, lty = "solid")
segments(x0=0,y0=692, x1=2000, y1=692, lwd = 1, lty = "solid")

#Horz Graph Lines
segments(x0=550,y0=797, x1=1930, y1=797, lwd = 1, lty = "solid")
segments(x0=550,y0=834, x1=1930, y1=834, lwd = 1, lty = "solid")
segments(x0=550,y0=871, x1=1930, y1=871, lwd = 1, lty = "solid")

#Vert Graph Lines
segments(x0=95,y0=797, x1=95, y1=435, lwd = 1, lty = "solid")
segments(x0=310,y0=860, x1=310, y1=555, lwd = 1, lty = "solid")
segments(x0=550,y0=871, x1=550, y1=580, lwd = 1, lty = "solid")
segments(x0=635,y0=871, x1=635, y1=545, lwd = 1, lty = "solid")
segments(x0=750,y0=853, x1=750, y1=610, lwd = 1, lty = "solid")
segments(x0=870,y0=797, x1=870, y1=600, lwd = 1, lty = "solid")
segments(x0=1228,y0=845, x1=1228, y1=480, lwd = 1, lty = "solid")
segments(x0=1413,y0=797, x1=1413, y1=430, lwd = 1, lty = "solid")
segments(x0=1930,y0=880, x1=1930, y1=315, lwd = 1, lty = "solid")

dev.off()


image_write(img, path = here::here("Original Plot Work", "Napoleon's Invasion of Russia", "Napoleon's Invasion of Russia.png"), format = "png")






#text(500, 250, "Hoiven-Glaven", cex = 4, srt = 45)
#polygon(c(0, 0, 500, 400), c(0, 700, 700, 0), col = "red")
