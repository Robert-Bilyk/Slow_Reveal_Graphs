library(tidyverse)
library(showtext)
library(readxl)


font_add_google(name = "Courier Prime", family = "Main")
showtext_auto()

data <- read_xlsx(here::here("Plot Work", "1890 State Population Density - Henry Gannett", "Henry Gannett State Population Density 1890.xlsx")) %>%
  arrange(desc(Density))

data$State <- toupper(data$State)

ggplot(data, mapping = aes(x = Density, y = fct_rev(fct_inorder(State)))) +
  annotate("segment", x = 10, xend = -100, y = 50, yend = 50) +
  annotate("segment", x = -100, xend = 325, y = 45, yend = 45) +
  annotate("segment", x = 10, xend = -100, y = 50, yend = 50) +
  annotate("segment", x = seq(0,325,25), xend = seq(0,325,25), y = 0, yend = 10)+
  
  geom_col(color = "black", fill = "black", width = .45) +
  labs(title = "8. NUMBER OF INHABITANTS TO THE SQUARE MILE, BY STATES AND TERRITORIES: 1890.",
       y = "STATES.") +
  theme_linedraw() +
  scale_x_continuous(limits = c(-100,325), breaks = seq(0,325,25)) +
  scale_y_discrete()+
  theme(axis.text.x = element_text(family = "Main", color = "black", vjust = 440),
        axis.title.x = element_blank(),
        axis.text.y = element_text(family = "Main", color = "black", hjust = 2, margin = margin(r = -26)),
        axis.ticks.y = element_blank(),
        axis.title.y = element_text(family = "Main", color = "black", vjust = 1.05, angle = 0),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"),
        panel.background = element_rect(fill = "#f1d9b5"))