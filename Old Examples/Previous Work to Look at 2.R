
library(tidyverse)
library(showtext)
font_add_google("Puritan", "Puritan")
showtext_auto()

Censuses <- c("1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890")
Population <- c(3929214,5308483,7239881,9633822,12866020,17069453,23191876,31443321,38558371,50155783,62622250)
Density <- c(4.75,6.41,3.62,4.82,6.25,8.29,7.78,10.39,12.74,16.58,20.70)
Urban_Pop <- c(119748,201806,315653,467252,856512,1449569,2896539,4645000,7538000,10794000,17446000)
Population_Density <- tibble(Censuses,Population,Density,Urban_Pop)

gannett <- function() {
  theme(axis.title = element_text(size = 9, family = "serif"),
        axis.text = element_text(size = 7, family = "serif"),
        plot.title = element_text(size = 10, family = "Puritan", hjust = .5, vjust = -3),
        axis.title.y = element_text(hjust = .5),
        axis.ticks = element_blank(),
        axis.text.y = element_text(size = 7.5, margin = margin(l = 20, r = -20.5)),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        aspect.ratio = 1.2,
        panel.border = element_rect(fill = NA, size = 1.5)
  )
}
Mod_Total_Population <- Population_Density %>% 
  mutate(New_censuses = as.character(Censuses)) %>% 
  select(New_censuses, Density)

png("Pop-Density.png",width=500,height=550)
ggplot(Mod_Total_Population) +
  geom_col(aes(y = New_censuses, x = Density), width = .4, color = "#1a1e19", fill = "#100e05") +
  labs(y = NULL, x = NULL, title = "Number of Inhabitants to the Square Mile \nat Each Census: 1790 to 1890") +
  scale_y_discrete(limits = rev) +
  scale_x_continuous(breaks = seq(0,20,2), position = "top", limit = c(-2,22)) +
  theme_linedraw() +
  coord_cartesian(xlim = c(-.5,20.85), ylim = c(1, 11.15)) +
  theme(axis.title = element_text(size = 9, family = "serif"),
        axis.text = element_text(size = 7.5, family = "serif"),
        plot.title = element_text(size = 13, family = "Puritan", hjust = .5, vjust = -3),
        axis.title.y = element_text(hjust = .5),
        axis.ticks = element_blank(),
        axis.text.y = element_text(size = 7.5, vjust = .75, margin = margin(r = -26)),
        axis.text.x.top = element_text(margin = margin(b = -16.5, t = 15)),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_blank(),
        aspect.ratio = 1.2,
        panel.border = element_rect(fill = NA, size = 1.05)
  )
dev.off()


Ext_Censuses <- c("1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890", "1900","1910","1920","1930")
Ext_Density <- c(4.75,6.41,3.62,4.82,6.25,8.29,7.78,10.39,12.74,16.58,20.70,25.6,30.9,35.5,41.3)
Ext_Pop_Density <- tibble(Ext_Censuses,Ext_Density)
Ext_Density <- Ext_Pop_Density %>% 
  mutate(New_censuses = as.character(Ext_Censuses)) %>% 
  select(New_censuses, Ext_Density)

# Extended Graph

png("Ext-Pop-Density.png",width=500,height=575)
ggplot(Ext_Density) +
  annotate("segment", x = seq(0,40,4), xend = seq(0,40,4), y = 0, yend = 15.4) +
  annotate("segment", x = -4, xend = 44, y = 15.4, yend = 15.4) +
  geom_col(aes(y = New_censuses, x = Ext_Density), width = .4, color = "#1a1e19", fill = "#100e05") +
  labs(y = NULL, x = NULL, title = "Number of Inhabitants to the Square Mile \nat Each Census: 1790 to 1930") +
  scale_y_discrete(limits = rev) +
  scale_x_continuous(breaks = seq(0,40,4), position = "top", limit = c(-4,44)) +
  theme_linedraw() +
  coord_cartesian(xlim = c(-.9,42), ylim = c(1, 15.22)) +
  theme(axis.title = element_text(size = 9, family = "serif"),
        axis.text = element_text(size = 7.5, family = "serif"),
        plot.title = element_text(size = 13, family = "Puritan", hjust = .5, vjust = -2),
        axis.title.y = element_text(hjust = .5),
        axis.ticks = element_blank(),
        axis.text.y = element_text(size = 7.5, vjust = .75, margin = margin(r = -25.5)),
        axis.text.x.top = element_text(margin = margin(b = -15.5, t = 14)),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_blank(),
        aspect.ratio = 1.2,
        panel.border = element_rect(fill = NA, size = 1.05)
  )
dev.off()