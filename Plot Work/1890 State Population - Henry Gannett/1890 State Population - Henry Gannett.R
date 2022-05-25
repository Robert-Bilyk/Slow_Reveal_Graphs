install.packages("extrafont")
font_import()
loadfonts(device = "win")
library(tidyverse)
library(readxl)
library(scales)
library(showtext)
library(forcats)
library(extrafont)
library(grid)

font_add_google(name = "Courier Prime", family = "Main")

showtext_auto()

data <- read_xlsx(here::here("Plot Work", "1890 State Population - Henry Gannett", "Henry Gannett Total State Population 1890.xlsx")) %>%
  arrange(Population)

data$State <- toupper(data$State)
data$pop <- data$Population / 100000


#Full Graph

png(here::here("Plot Work", "1890 State Population - Henry Gannett", "5-Final-State-Pop-1890.png"),width=500,height=800)

ggplot(data, aes(x = pop, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45, ) +
  labs(title = "6. POPULATION OF EACH STATE AND TERRITORY: 1890",
       subtitle = element_blank(),
       tag = "(Hundreds of thousands.)") +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  theme_bw() +
  theme(axis.text.x = element_text(family = "Main", size = 8, color= "black"),
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
        plot.title = element_text(family = "Main", color = "black", hjust = .24, vjust = 5, size = 8),
        plot.subtitle = element_blank(),
        plot.margin = margin(10,10,10,10),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = -4, size = 7),
        plot.tag.position = "top",
        legend.position = "none") + 
        scale_x_continuous(position = "top", limits = c(0,62), breaks=seq(6,60,6)) +
        coord_cartesian(clip = "off") 
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.012, y1 = 0.962))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.962))
grid.draw(segmentsGrob(x0 = 0.243, x1 = 0.243, y0 = 0.012, y1 = 0.962))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.947, y1 = 0.947))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.962, y1 = 0.962))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.13,y=.954, gp=gpar(fontsize=8, fontfamily="Main")))

dev.off()

#Fully Concealed

png(here::here("Plot Work", "1890 State Population - Henry Gannett", "1-Concealed-State-Pop-1890.png"),width=500,height=800)

ggplot(data, aes(x = pop, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45, ) +
  labs(title = "6. POPULATION OF EACH STATE AND TERRITORY: 1890",
       subtitle = element_blank(),
       tag = "(Hundreds of thousands.)") +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  theme_bw() +
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank(), 
        axis.ticks.x = element_blank()) + 
  theme(axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_blank()) + 
  theme(panel.border = element_blank(),
        axis.ticks = element_line(size = .25),
        panel.grid.major = element_line(color="black", size=.25),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(linetype = 1, size = 1, fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.subtitle = element_blank(),
        plot.margin = margin(10,10,10,10),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        legend.position = "none") + 
  scale_x_continuous(position = "top", limits = c(0,62), breaks=seq(6,60,6)) +
  coord_cartesian(clip = "off") 

grid.draw(segmentsGrob(x0 = 0.067, x1 = 0.067, y0 = 0.012, y1 = 0.985))
grid.draw(segmentsGrob(x0 = 0.935, x1 = 0.935, y0 = 0.012, y1 = 0.985))
grid.draw(segmentsGrob(x0 = 0.067, x1 = 0.935, y0 = 0.012, y1 = 0.012))
grid.draw(segmentsGrob(x0 = 0.067, x1 = 0.935, y0 = 0.985, y1 = 0.985))

dev.off()

#Reveal Population Numbers

png(here::here("Plot Work", "1890 State Population - Henry Gannett", "2-Pop-Reveal-State-Pop-1890.png"),width=500,height=800)

ggplot(data, aes(x = pop, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45, ) +
  labs(title = "6. POPULATION OF EACH STATE AND TERRITORY: 1890",
       subtitle = element_blank(),
       tag = "(Hundreds of thousands.)") +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  theme_bw() +
  theme(axis.text.x = element_text(family = "Main", size = 8, color= "black"),
        axis.title.x = element_blank(), 
        axis.ticks.x = element_line()) + 
  theme(axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_blank()) + 
  theme(panel.border = element_blank(),
        axis.ticks = element_line(size = .25),
        panel.grid.major = element_line(color="black", size=.25),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(linetype = 1, size = 1, fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.subtitle = element_blank(),
        plot.margin = margin(10,10,10,10),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        legend.position = "none") + 
  scale_x_continuous(position = "top", limits = c(0,62), breaks=seq(6,60,6)) +
  coord_cartesian(clip = "off") 

grid.draw(segmentsGrob(x0 = 0.067, x1 = 0.067, y0 = 0.012, y1 = 0.988))
grid.draw(segmentsGrob(x0 = 0.935, x1 = 0.935, y0 = 0.012, y1 = 0.988))
grid.draw(segmentsGrob(x0 = 0.067, x1 = 0.935, y0 = 0.988, y1 = 0.988))
grid.draw(segmentsGrob(x0 = 0.067, x1 = 0.935, y0 = 0.972, y1 = 0.972))
grid.draw(segmentsGrob(x0 = 0.067, x1 = 0.935, y0 = 0.012, y1 = 0.012))

dev.off()

#Add States

png(here::here("Plot Work", "1890 State Population - Henry Gannett", "3-State-Reveal-State-Pop-1890.png"),width=500,height=800)

ggplot(data, aes(x = pop, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45, ) +
  labs(title = "6. POPULATION OF EACH STATE AND TERRITORY: 1890",
       subtitle = element_blank(),
       tag = "(Hundreds of thousands.)") +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  theme_bw() +
  theme(axis.text.x = element_text(family = "Main", size = 8, color= "black"),
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
        plot.margin = margin(10,10,10,10),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        legend.position = "none") + 
  scale_x_continuous(position = "top", limits = c(0,62), breaks=seq(6,60,6)) +
  coord_cartesian(clip = "off") 

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.012, y1 = 0.988))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.988))
grid.draw(segmentsGrob(x0 = 0.243, x1 = 0.243, y0 = 0.012, y1 = 0.988))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.972, y1 = 0.972))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.988, y1 = 0.988))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.13,y=.98, gp=gpar(fontsize=8, fontfamily="Main")))

dev.off()

# Add Units

png(here::here("Plot Work", "1890 State Population - Henry Gannett", "4-Unit-Reveal-State-Pop-1890.png"),width=500,height=800)

ggplot(data, aes(x = pop, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45, ) +
  labs(title = "6. POPULATION OF EACH STATE AND TERRITORY: 1890",
       subtitle = element_blank(),
       tag = "(Hundreds of thousands.)") +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  theme_bw() +
  theme(axis.text.x = element_text(family = "Main", size = 8, color= "black"),
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
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = 4, size = 6),
        plot.tag.position = "top",
        legend.position = "none") + 
  scale_x_continuous(position = "top", limits = c(0,62), breaks=seq(6,60,6)) +
  coord_cartesian(clip = "off") 

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.012, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.243, x1 = 0.243, y0 = 0.012, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.952, y1 = 0.952))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.13,y=.96, gp=gpar(fontsize=8, fontfamily="Main")))

dev.off()


