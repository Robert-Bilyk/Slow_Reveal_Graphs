library(tidyverse)
library(showtext)
library(readxl)
library(grid)
library(ggpubr)


font_add_google(name = "Cagliostro", family = "Main")
showtext_auto()

country <- read_xlsx(here::here("Original Plot Work", "1906 - 1916 Tuberculosis Mortality Country", "Tuberculosis Country.xlsx")) 

country$Country <- country$Country %>%
  factor(levels = c("Germany", "New York State", "France", "Tfrance", "England and Wales"))

plot <- ggplot(country) +
  geom_line(aes(x=Year, y= Rate, group = Country, linetype = Country, size = Country)) +
  scale_x_continuous(limits = c(1906,1916), breaks = seq(1906,1916,1)) +
  scale_y_continuous(limits = c(0,200), breaks = seq(0, 200,10), sec.axis = sec_axis(~ ., breaks = seq(0, 200,10))) +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major = element_line(color= "white"),
        panel.background = element_rect(fill="white"),
        axis.text = element_text(family = "Main", size = 12),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.title = element_text(family = "Main", size = 18),
        legend.position = "none") +
  scale_linetype_manual(values = c("twodash", "longdash", "solid", "solid", "solid")) +
  scale_size_manual(values = c(1.75, 1.75, .5, .5, 1.75))


gap <- ggplot() + theme_void()


png(here::here("Original Plot Work", "1906 - 1916 Tuberculosis Mortality Country", "Tuberculosis Mortality by Country 1906-1917.png"),width=1000,height=700)

ggarrange(gap,
          ggarrange(gap, plot, gap, ncol=3, widths = c(.07, 1, .07)),
          gap,
          nrow = 3, heights = c(.15, 1, .1))

grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.135, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.208, x1 = 0.208, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.281, x1 = 0.281, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.354, x1 = 0.354, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.427, x1 = 0.427, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.5, x1 = 0.5, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.572, x1 = 0.572, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.645, x1 = 0.645, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.718, x1 = 0.718, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.791, x1 = 0.791, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.864, x1 = 0.864, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))

grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.137, y1 = 0.137, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.177, y1 = 0.177, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.213, y1 = 0.213, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.248, y1 = 0.248, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.282, y1 = 0.282, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.317, y1 = 0.317, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.351, y1 = 0.351, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.385, y1 = 0.385, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.419, y1 = 0.419, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.453, y1 = 0.453, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.487, y1 = 0.487, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.526, y1 = 0.526, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.563, y1 = 0.563, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.597, y1 = 0.597, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.631, y1 = 0.631, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.665, y1 = 0.665, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.699, y1 = 0.699, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.733, y1 = 0.733, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.767, y1 = 0.767, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.801, y1 = 0.801, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.835, y1 = 0.835, gp = gpar(lwd = .5)))



dev.off()