install.packages("extrafont")
font_import()
loadfonts(device = "win")
library(tidyverse)
library(readxl)
library(scales)
library(showtext)
library(forcats)
library(extrafont)

font_add_google(name = "Courier Prime", family = "Main")

showtext_auto()

data <- read_xlsx(here::here("Plot Work", "table.xlsx")) %>%
  arrange(Population)

data$State <- toupper(data$State)
data$pop <- data$Population / 100000

x <- ggplot(data, aes(x = pop, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", width = 0.45, ) +
  labs(title = "POPULATION OF EACH STATE AND TERRITORY: 1890",
       subtitle = element_blank(),
       tag = "(Hundreds of thousands.)",
       x="STATES.")+
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  theme_bw() +
  theme(axis.text.x = element_text(family = "Main", size = 8),
        axis.title.x.top = element_text(family = "Main", hjust = 0.5, vjust = 1, angle = 0), 
        axis.ticks.x = element_line()) + 
  theme(axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "#372811")) + 
  theme(panel.border = element_rect(size = .25, fill = NA),
        axis.ticks = element_line(size = .25),
        panel.grid.major = element_line(color="black", size=.25),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.background = element_rect(color="black", size = .25 ,fill = "#f1d9b5"),
        plot.background = element_rect(size = 1, fill = "#f1d9b5", color = "black"), 
        plot.title = element_text(family = "Main", color = "black", hjust = .25, vjust = 4, size = 8),
        plot.subtitle = element_blank(),
        plot.margin = margin(20,25,10,10),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = -6, size = 6),
        plot.tag.position = "top",
        legend.position = "none") + 
        scale_x_continuous(position = "top", limits = c(0,60), breaks=seq(0,60,6)) +
        coord_cartesian(clip = "off")
print(x)
