library(tidyverse)
library(showtext)
library(readxl)
library(grid)


font_add_google(name = "Courier Prime", family = "Main")
showtext_auto()

data <- read_xlsx(here::here("Plot Work", "1890 State Foreign Population - Henry Gannett", "Henry Gannett State Foreign Population 1890.xlsx")) %>%
  arrange(desc(Foreign))

data$State <- toupper(data$State)
data$Foreign <- data$Foreign / 1000

#Final Graph

png(here::here("Plot Work", "1890 State Foreign Population - Henry Gannett", "5-Final-State-Foreign-Population-1890.png"),width=500,height=800)

ggplot(data, aes(x = Foreign, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45 ) +
  labs(tag = "(Hundreds of thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "black"),
        axis.title.x = element_blank(), 
        axis.ticks.x = element_line()) + 
  theme(axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black")) + 
  theme(panel.border = element_blank(),
        panel.grid.major.x = element_line(color="black", size=.25),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(linetype = 1, size = 1, fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.margin = margin(20,10,10,10),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = 3, size = 7),
        plot.tag.position = "top",
        legend.position = "none") 

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.012, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.243, x1 = 0.243, y0 = 0.012, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.953, y1 = 0.953))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.13,y=.961, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("27. FOREIGN BORN POPULATION, BY STATES AND TERRITORIES:1890", x=.5, y=.99, gp=gpar(fontsize=7, fontfamily="Main")))

dev.off()

#Concealed Graph

png(here::here("Plot Work", "1890 State Foreign Population - Henry Gannett", "1-Concealed-State-Foreign-Population-1890.png"),width=500,height=800)

ggplot(data, mapping = aes(x = Foreign, y = fct_rev(fct_inorder(State)))) +
  geom_col(color = "black", fill = "black", width = .45) +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
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

grid.draw(segmentsGrob(x0 = 0.067, x1 = 0.067, y0 = 0.012, y1 = 0.975))
grid.draw(segmentsGrob(x0 = 0.935, x1 = 0.935, y0 = 0.012, y1 = 0.975))
grid.draw(segmentsGrob(x0 = 0.067, x1 = 0.935, y0 = 0.012, y1 = 0.012))
grid.draw(segmentsGrob(x0 = 0.067, x1 = 0.935, y0 = 0.975, y1 = 0.975))

dev.off()

#Reveal Foreigner Numbers

png(here::here("Plot Work", "1890 State Foreign Population - Henry Gannett", "2-ForeignReveal-State-Foreign-Population-1890.png"),width=500,height=800)

ggplot(data, mapping = aes(x = Foreign, y = fct_rev(fct_inorder(State)))) +
  geom_col(color = "black", fill = "black", width = .45) +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
  theme(axis.text.x = element_text(family = "Main", color = "black", size = 6),
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

grid.draw(segmentsGrob(x0 = 0.067, x1 = 0.067, y0 = 0.012, y1 = 0.978))
grid.draw(segmentsGrob(x0 = 0.935, x1 = 0.935, y0 = 0.012, y1 = 0.978))
grid.draw(segmentsGrob(x0 = 0.067, x1 = 0.935, y0 = 0.978, y1 = 0.978))
grid.draw(segmentsGrob(x0 = 0.067, x1 = 0.935, y0 = 0.963, y1 = 0.963))
grid.draw(segmentsGrob(x0 = 0.067, x1 = 0.935, y0 = 0.012, y1 = 0.012))

dev.off()

#Reveal States

png(here::here("Plot Work", "1890 State Foreign Population - Henry Gannett", "3-StateReveal-State-Foreign-Population-1890.png"),width=500,height=800)

ggplot(data, mapping = aes(x = Foreign, y = fct_rev(fct_inorder(State)))) +
  geom_col(color = "black", fill = "black", width = .45) +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
  theme(axis.text.x = element_text(family = "Main", color = "black", size = 6),
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

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.012, y1 = 0.978))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.978))
grid.draw(segmentsGrob(x0 = 0.243, x1 = 0.243, y0 = 0.012, y1 = 0.978))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.963, y1 = 0.963))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.978, y1 = 0.978))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.13,y=.97, gp=gpar(fontsize=8, fontfamily="Main")))

dev.off()

# Reveal Units

png(here::here("Plot Work", "1890 State Foreign Population - Henry Gannett", "4-UnitReveal-State-Foreign-Population-1890.png"),width=500,height=800)

ggplot(data, aes(x = Foreign, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45, ) +
  labs(title = "6. POPULATION OF EACH STATE AND TERRITORY: 1890",
       subtitle = element_blank(),
       tag = "(Hundreds of thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  theme_bw() +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "black"),
        axis.title.x = element_blank(), 
        axis.ticks.x = element_line()) + 
  theme(axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black")) + 
  theme(panel.border = element_blank(),
        axis.ticks = element_line(size = .25),
        panel.grid.major = element_line(color="black", size=.25),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(linetype = 1, size = 1, fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.subtitle = element_blank(),
        plot.margin = margin(20,10,10,10),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = 4, size = 7),
        plot.tag.position = "top",
        legend.position = "none") +
        coord_cartesian(clip = "off") 

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.012, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.243, x1 = 0.243, y0 = 0.012, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.953, y1 = 0.953))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.13,y=.96, gp=gpar(fontsize=8, fontfamily="Main")))

dev.off()
