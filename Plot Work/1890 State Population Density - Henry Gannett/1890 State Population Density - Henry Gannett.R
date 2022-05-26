library(tidyverse)
library(showtext)
library(readxl)
library(grid)


font_add_google(name = "Courier Prime", family = "Main")
showtext_auto()

data <- read_xlsx(here::here("Plot Work", "1890 State Population Density - Henry Gannett", "Henry Gannett State Population Density 1890.xlsx")) %>%
  arrange(desc(Density))

data$State <- toupper(data$State)

#Final Graph

png(here::here("Plot Work", "1890 State Population Density - Henry Gannett", "4-Final-State-Pop-Density-1890.png"),width=500,height=800)

ggplot(data, mapping = aes(x = Density, y = fct_rev(fct_inorder(State)))) +
  geom_col(color = "black", fill = "black", width = .45) +
  scale_x_continuous(position= "top" ,limits = c(0,325), breaks = seq(25,325,25)) +
  theme(axis.text.x = element_text(family = "Main", color = "black", size = 8),
        axis.title.x = element_blank(),
        axis.text.y = element_text(family = "Main", color = "black", hjust = 0, size = 8),
        axis.ticks.y = element_blank(),
        axis.title.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line( color = "black", size = .25),
        plot.background = element_rect(fill = "#f1d9b5"),
        plot.title = element_blank(),
        panel.background = element_blank(),
        plot.margin = margin(20,10,10,10))

grid.draw(segmentsGrob(x0 = 0.005, x1 = 0.005, y0 = 0.012, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.977, x1 = 0.977, y0 = 0.012, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.241, x1 = 0.241, y0 = 0.012, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.005, x1 = 0.977, y0 = 0.96, y1 = 0.96))
grid.draw(segmentsGrob(x0 = 0.005, x1 = 0.977, y0 = 0.98, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.005, x1 = 0.977, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.13,y=.969, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("NUMBER OF INHABITANTS TO THE SQUARE MILE, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=7, fontfamily="Main")))

dev.off()

#Concealed Graph

png(here::here("Plot Work", "1890 State Population Density - Henry Gannett", "1-Concealed-State-Pop-Density-1890.png"),width=500,height=800)

ggplot(data, mapping = aes(x = Density, y = fct_rev(fct_inorder(State)))) +
  geom_col(color = "black", fill = "black", width = .45) +
  scale_x_continuous(position= "top" ,limits = c(0,325), breaks = seq(25,325,25)) +
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line( color = "black", size = .25),
        plot.background = element_rect(fill = "#f1d9b5"),
        plot.title = element_blank(),
        panel.background = element_blank(),
        plot.margin = margin(20,10,10,10))

grid.draw(segmentsGrob(x0 = 0.069, x1 = 0.069, y0 = 0.012, y1 = 0.975))
grid.draw(segmentsGrob(x0 = 0.977, x1 = 0.977, y0 = 0.012, y1 = 0.975))
grid.draw(segmentsGrob(x0 = 0.069, x1 = 0.977, y0 = 0.975, y1 = 0.975))
grid.draw(segmentsGrob(x0 = 0.069, x1 = 0.977, y0 = 0.012, y1 = 0.012))

dev.off()

#Reveal Density Numbers

png(here::here("Plot Work", "1890 State Population Density - Henry Gannett", "2-DensityReveal-State-Pop-Density-1890.png"),width=500,height=800)

ggplot(data, mapping = aes(x = Density, y = fct_rev(fct_inorder(State)))) +
  geom_col(color = "black", fill = "black", width = .45) +
  scale_x_continuous(position= "top" ,limits = c(0,325), breaks = seq(25,325,25)) +
  theme(axis.text.x = element_text(family = "Main", color = "black", size = 8),
        axis.title.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line( color = "black", size = .25),
        plot.background = element_rect(fill = "#f1d9b5"),
        plot.title = element_blank(),
        panel.background = element_blank(),
        plot.margin = margin(20,10,10,10))

grid.draw(segmentsGrob(x0 = 0.069, x1 = 0.069, y0 = 0.012, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.977, x1 = 0.977, y0 = 0.012, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.069, x1 = 0.977, y0 = 0.96, y1 = 0.96))
grid.draw(segmentsGrob(x0 = 0.069, x1 = 0.977, y0 = 0.98, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.069, x1 = 0.977, y0 = 0.012, y1 = 0.012))

dev.off()

#Reveal States

png(here::here("Plot Work", "1890 State Population Density - Henry Gannett", "3-StateReveal-State-Pop-Density-1890.png"),width=500,height=800)

ggplot(data, mapping = aes(x = Density, y = fct_rev(fct_inorder(State)))) +
  geom_col(color = "black", fill = "black", width = .45) +
  scale_x_continuous(position= "top" ,limits = c(0,325), breaks = seq(25,325,25)) +
  theme(axis.text.x = element_text(family = "Main", color = "black", size = 8),
        axis.title.x = element_blank(),
        axis.text.y = element_text(family = "Main", color = "black", hjust = 0, size = 8),
        axis.ticks.y = element_blank(),
        axis.title.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line( color = "black", size = .25),
        plot.background = element_rect(fill = "#f1d9b5"),
        plot.title = element_blank(),
        panel.background = element_blank(),
        plot.margin = margin(20,10,10,10))

grid.draw(segmentsGrob(x0 = 0.005, x1 = 0.005, y0 = 0.012, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.977, x1 = 0.977, y0 = 0.012, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.241, x1 = 0.241, y0 = 0.012, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.005, x1 = 0.977, y0 = 0.96, y1 = 0.96))
grid.draw(segmentsGrob(x0 = 0.005, x1 = 0.977, y0 = 0.98, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.005, x1 = 0.977, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.13,y=.969, gp=gpar(fontsize=8, fontfamily="Main")))

dev.off()
