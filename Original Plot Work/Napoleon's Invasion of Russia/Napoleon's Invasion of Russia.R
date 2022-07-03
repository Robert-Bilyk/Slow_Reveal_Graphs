library(tidyverse)
library(showtext)
library(readxl)
library(magick)
library(grid)


font_add_google(name = "Great Vibes", family = "Main")
font_add_google(name = "Charm", family = "Map")
showtext_auto()

gap <- ggplot() + theme_void() + 
  theme(plot.background = element_rect(color = "#d7d2bf", fill = "#d7d2bf"))
        
picture <- image_graph(width = 2000, height = 900)
gap 
dev.off()


neim <- image_read(here::here("Original Plot Work", "Napoleon's Invasion of Russia", "Neim.png"))
plot(as.raster(neim))
mosk <- image_read(here::here("Original Plot Work", "Napoleon's Invasion of Russia", "Mosk.PNG"))
plot(as.raster(mosk))
dorg <- image_read(here::here("Original Plot Work", "Napoleon's Invasion of Russia", "Dorg.PNG"))
plot(as.raster(dorg))
orsh <- image_read(here::here("Original Plot Work", "Napoleon's Invasion of Russia", "Orsh.PNG"))
plot(as.raster(orsh))
bere <- image_read(here::here("Original Plot Work", "Napoleon's Invasion of Russia", "Bere.PNG"))
plot(as.raster(bere))


img <- image_draw(picture)

#Black Lines 
polygon(c(127, 177, 177, 127), c(558, 555, 560, 563), border = "black", col = "black")
polygon(c(175, 177, 200, 198), c(559, 555, 225, 225), border = "black", col = "black")
polygon(c(177, 177, 245, 245), c(555, 557, 553, 551), border = "black", col = "black")
polygon(c(310, 310, 245, 245), c(554, 550, 551, 555), border = "black", col = "black")
polygon(c(310, 310, 490, 490), c(554, 550, 560, 564), border = "black", col = "black")
polygon(c(560, 560, 490, 490), c(584, 580, 560, 564), border = "black", col = "black")
polygon(c(560, 560, 635, 635), c(584, 580, 536, 544), border = "black", col = "black")
polygon(c(760, 760, 635, 635), c(610, 602, 536, 544), border = "black", col = "black")
polygon(c(764, 760, 785, 785), c(623, 602, 607, 626), border = "black", col = "black")
polygon(c(885, 880, 785, 785), c(599, 580, 607, 626), border = "black", col = "black")
polygon(c(870, 880, 795, 785), c(582, 580, 309, 308), border = "black", col = "black")
polygon(c(885, 880, 1030, 1035), c(592, 585, 515, 523), border = "black", col = "black")
polygon(c(1235, 1235, 1030, 1035), c(482, 470, 515, 526), border = "black", col = "black")
polygon(c(1235, 1235, 1415, 1420), c(485, 470, 405, 420), border = "black", col = "black")
polygon(c(1565, 1550, 1415, 1420), c(342, 325, 405, 425), border = "black", col = "black")
polygon(c(1565, 1550, 1690, 1690), c(354, 325, 260, 295), border = "black", col = "black")
polygon(c(1880, 1890, 1690, 1690), c(342, 310, 260, 297), border = "black", col = "black")
polygon(c(1880, 1870, 1905, 1930), c(342, 307, 297, 323), border = "black", col = "black")
polygon(c(1940, 1905, 1895, 1930), c(154, 170, 300, 323), border = "black", col = "black")
polygon(c(1945, 1905, 1910, 1958), c(150, 170, 210, 188), border = "black", col = "black")

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
segments(x0=94,y0=797, x1=94, y1=435, lwd = 1, lty = "solid")
segments(x0=310,y0=860, x1=310, y1=555, lwd = 1, lty = "solid")
segments(x0=550,y0=871, x1=550, y1=580, lwd = 1, lty = "solid")
segments(x0=635,y0=871, x1=635, y1=545, lwd = 1, lty = "solid")
segments(x0=750,y0=853, x1=750, y1=605, lwd = 1, lty = "solid")
segments(x0=870,y0=797, x1=870, y1=600, lwd = 1, lty = "solid")
segments(x0=1228,y0=845, x1=1228, y1=480, lwd = 1, lty = "solid")
segments(x0=1413,y0=797, x1=1413, y1=422, lwd = 1, lty = "solid")
segments(x0=1930,y0=880, x1=1930, y1=315, lwd = 1, lty = "solid")

#Rivers
text(20, 360, "Niéman", family = "Map", cex = 1.25, col = "#383227", srt = 25)
text(55, 375, "R.", family = "Map", cex = 1.25, col = "#383227")
text(113, 620, "Niéman", family = "Map", cex = 1.25, col = "#383227", srt = 80)
text(122, 575, "R.", family = "Map", cex = 1.25, col = "#383227", srt = 90)
grid.raster(neim, .036, .428, height = .4)
grid.raster(mosk, .84, .828, height = .15)
text(1645, 115, "Moskowa", family = "Map", cex = 1.25, col = "#383227", srt = 310)
text(1685, 150, "R.", family = "Map", cex = 1.25, col = "#383227")
grid.raster(dorg, .712, .57, height = .05)
grid.raster(orsh, .53, .37, height = .27)
text(710, 510, "Bérézina", family = "Map", cex = 1.25, col = "#383227", srt = 335)
text(755, 535, "R.", family = "Map", cex = 1.25, col = "#383227", srt = 330)
grid.raster(bere, .375, .35, height = .25)

#Distance
segments(x0=1455,y0=600, x1=1700, y1=600, lwd = 1, lty = "solid")
segments(x0=1455,y0=600, x1=1455, y1=595, lwd = 1, lty = "solid")
segments(x0=1480,y0=600, x1=1480, y1=595, lwd = 1, lty = "solid")
segments(x0=1505,y0=600, x1=1505, y1=595, lwd = 1, lty = "solid")
segments(x0=1530,y0=600, x1=1530, y1=595, lwd = 1, lty = "solid")
segments(x0=1555,y0=600, x1=1555, y1=595, lwd = 1, lty = "solid")
segments(x0=1580,y0=600, x1=1580, y1=595, lwd = 1, lty = "solid")
segments(x0=1700,y0=600, x1=1700, y1=595, lwd = 1, lty = "solid")

# é à 

#Main Text
text(330, 33, "Carte Figurative", family = "Main", cex = 3.5, col = "#383227")
text(800, 35, "des peztes successives en hommes de l'Armée Francaise dans la campagne de", family = "Main", cex = 2.5, col = "#383227")
text(1295, 28, "Russie 1812 - 1813", family = "Main", cex = 3.5, col = "#383227")
text(800, 63, "Dressé par M. Minard, Inopecteur Genéral des Ponts en Chansséer en retraite", family = "Main", cex = 2.25, col = "#383227")
segments(x0=700, y0=85, x1=900, y1=85, lwd = 1, lty = "solid", col = "#383227")
text(1275, 80, "Paris, le 20 Novembre 1869.", family = "Main", cex = 2.25, col = "#383227")
text(800, 105, "Les nombres d'hommes présents som représentés par les largeurs des zones colorées à raison d'nn millimétre pour dix mille hommes; ils som de plus éerits en travers", family = "Main", cex = 2, col = "#383227")
text(800, 130, "des zones. Le ronge désigne les hommes qui entrem en Russie, le noir ceux qui en sortem. __ Les renseignements qui om servi à dresser la carte om été puiséa", family = "Main", cex = 2, col = "#383227")
text(800, 155, "dans les onvrages de M. M. Chiers, de Ségur, de Fezensac, de Chambray en le journal inédin de Jacob, pharmacien de l'Armée depuis le 28 Octobre.", family = "Main", cex = 2, col = "#383227")
text(800, 180, "Pour mieux faire juger à l'oeil la diminution de l'armée, j'ai supposé que les corps du Prince Jérome en du Maréchal Davous qui avaiem été détachés sur Minsk", family = "Main", cex = 2, col = "#383227")
text(800, 205, "en Mobilow en om rejoins oers Orscha en Witebsk, avaiem tonjours marché avec l'armée.", family = "Main", cex = 2, col = "#383227")

dev.off()


image_write(img, path = here::here("Original Plot Work", "Napoleon's Invasion of Russia", "Napoleon's Invasion of Russia.png"), format = "png")




#text(500, 250, "Hoiven-Glaven", cex = 4, srt = 45)
#polygon(c(0, 0, 500, 400), c(0, 700, 700, 0), col = "red")
