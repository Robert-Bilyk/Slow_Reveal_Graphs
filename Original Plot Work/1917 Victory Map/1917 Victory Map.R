library(tidyverse)
library(showtext)
library(readxl)
library(grid)
library(ggpattern)
library(maps)
library(mapdata)
library(stringr)

font_add_google(name = "PT Serif", family = "Title")
font_add_google(name = "Averia Serif Libre", family = "Main")
showtext_auto()

map <- map_data("state")
types <- read_xlsx(here::here("Original Plot Work", "1917 Victory Map", "Victory Map of 1917 State Types.xlsx"))

x_cross <- system.file("img", "x cross pattern.jpg", package = "ggpattern")
x_dot <- system.file("img", "x cross dot.jpg", package = "ggpattern")

types$State <- tolower(types$State)

newmap <- map %>%
  inner_join(types, by = c("region" = "State")) %>%
  mutate(Type = coalesce(case_when(test == 1 ~ 'FULL\nSUFFRAGE',
                                   test == 2 ~ 'PRIMARY \nSUFFRAGE',
                                   test == 3 ~ 'SCHOOL \nBOND TAX',
                                   test == 4 ~ 'PRESIDENTIAL \nSUFFRAGE',
                                   test == 5 ~ 'PRESIDENTIAL \n& MUNICIPAL \nSUFFRAGE',
                                   test == 6 ~ 'MUNICIPAL \nSUFFRAGE IN \nCHARTER CITIES',
                                   test == 7 ~ 'NO \nSUFFRAGE',
                                   test == 8 ~ 'MUNICIPAL \nSUFFRAGE',
                                   )))

newmap$Type <- newmap$Type %>%
  factor(levels = c('FULL\nSUFFRAGE','PRIMARY \nSUFFRAGE','SCHOOL \nBOND TAX','PRESIDENTIAL \nSUFFRAGE','PRESIDENTIAL \n& MUNICIPAL \nSUFFRAGE',
                    'MUNICIPAL \nSUFFRAGE','MUNICIPAL \nSUFFRAGE IN \nCHARTER CITIES','NO \nSUFFRAGE'))


png(here::here("Original Plot Work", "1917 Victory Map", "Victory_Map.png"),width=900,height=600)

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
                       color="grey",
                       size = .8) +
  labs(title = "Victory Map of 1917") +
  theme(legend.position = "bottom",
        legend.title = element_blank(),
        legend.text = element_text(size = 6, family = "Main"),
        legend.key.width = unit(1.8, "cm"),
        legend.key.height = unit(.9, "cm"),
        legend.direction = "horizontal") +
  theme(axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        plot.title = element_text(size = 20, hjust = .5, family = "Title"),
        plot.margin = margin(30,10,10,10),
        plot.background = element_rect(fill = "white")) +
  scale_fill_manual(values = c("white","white","black","white","white","white","white", "black")) +
  scale_pattern_manual(values = c("none", "none", "circle", "circle", "image", "image", "stripe", "none")) +
  scale_pattern_fill_manual(values = c("white", "white", "white", "black", "white", "white", "black", "white")) +
  scale_pattern_spacing_manual(values = c(.05, .05, .025, .025, .05, .05, .006, .05)) +
  scale_pattern_type_manual(values = c(NA, NA, NA, NA, "tile", "tile", NA, NA)) +
  scale_pattern_filename_manual(values = c(NA, NA, NA, NA, x_dot, x_cross, NA, NA)) +
  scale_pattern_scale_manual(values = c(1, 1, 1, 1, .15, .15, 1, 1)) +
  scale_pattern_density_manual(values = c(.2, .2, .3, .2, .2, .2, .2, .2)) +
  scale_pattern_angle_manual(values = c(30, 30, 30, 30, 30, 30, 0, 30)) +
  guides(fill = guide_legend(nrow = 1))

grid.draw(textGrob("The Woman Citizen", x=.4,y=.98, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("November 24, 1917", x=.6,y=.98, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("WASH. \n1910", x=.13,y=.805, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("OREG. \n1912", x=.125,y=.7, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("CAL. \n1911", x=.125,y=.5, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("IDAHO \n1896", x=.22,y=.68, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("NEV. \n1914", x=.18,y=.56, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("UTAH. \n1896", x=.26,y=.56, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("MONT. \n1914", x=.295,y=.795, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("ARIZ. \n1912", x=.26,y=.415, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("WYO. \n1869", x=.325,y=.67, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("November 24, 1917", x=.6,y=.98, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("November 24, 1917", x=.6,y=.98, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("November 24, 1917", x=.6,y=.98, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("November 24, 1917", x=.6,y=.98, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("November 24, 1917", x=.6,y=.98, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("November 24, 1917", x=.6,y=.98, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("November 24, 1917", x=.6,y=.98, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("November 24, 1917", x=.6,y=.98, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("November 24, 1917", x=.6,y=.98, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("November 24, 1917", x=.6,y=.98, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("November 24, 1917", x=.6,y=.98, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("November 24, 1917", x=.6,y=.98, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("November 24, 1917", x=.6,y=.98, gp=gpar(fontsize=8, fontfamily="Title")))
grid.draw(textGrob("November 24, 1917", x=.6,y=.98, gp=gpar(fontsize=8, fontfamily="Title")))


dev.off()

