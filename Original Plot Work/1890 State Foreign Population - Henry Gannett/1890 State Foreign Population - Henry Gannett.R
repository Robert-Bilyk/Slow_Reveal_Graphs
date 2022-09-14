library(tidyverse)
library(showtext)
library(readxl)
library(grid)
library(magick)
library(srtools)


font_add_google(name = "Courier Prime", family = "Main")
showtext_auto()

data <- read_xlsx(here::here("Original Plot Work", "1890 State Foreign Population - Henry Gannett", "Henry Gannett State Foreign Population 1890.xlsx")) %>%
  arrange(desc(Foreign))

data$State <- toupper(data$State)
data$Foreign <- data$Foreign / 1000


#Final Graph

picture <- image_graph(width = 500, height = 800)

ggplot(data, aes(x = Foreign, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45 ) +
  labs(tag = "(In thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = 3, size = 7),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10))

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.2, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.97, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.958, y1 = 0.958))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.11,y=.9645, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("37. FOREIGN BORN POPULATION, BY STATES AND TERRITORIES:1890", x=.5, y=.99, gp=gpar(fontsize=7, fontfamily="Main")))

dev.off()

img <- image_draw(picture)
dev.off()

image_write(img, path = here::here("Original Plot Work", "1890 State Foreign Population - Henry Gannett", "7-Final-State-Foreign-Population-1890.png"), format = "png")


#Concealed Graph

picture <- image_graph(width = 500, height = 800)

ggplot(data, aes(x = Foreign, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45 ) +
  labs(tag = "(In thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = 3, size = 7),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10)) +
  hide(c("xtext", "ytext", "xtick","tag"), "#f1d9b5")

grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.958))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.2, y0 = 0.012, y1 = 0.958))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.95, y0 = 0.958, y1 = 0.958))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.95, y0 = 0.012, y1 = 0.012))

dev.off()

img <- image_draw(picture)
dev.off()

image_write(img, path = here::here("Original Plot Work", "1890 State Foreign Population - Henry Gannett", "1-Concealed-State-Foreign-Population-1890.png"), format = "png")


#Reveal State Label

picture <- image_graph(width = 500, height = 800)

ggplot(data, aes(x = Foreign, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45 ) +
  labs(tag = "(In thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = 3, size = 7),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10)) +
  hide(c("xtext", "ytext", "xtick","tag"), "#f1d9b5")


grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.2, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.97, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.958, y1 = 0.958))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.11,y=.9645, gp=gpar(fontsize=8, fontfamily="Main")))

dev.off()

img <- image_draw(picture)
dev.off()

image_write(img, path = here::here("Original Plot Work", "1890 State Foreign Population - Henry Gannett", "2-StateReveal-State-Foreign-Population-1890.png"), format = "png")


#Reveal Title

picture <- image_graph(width = 500, height = 800)

ggplot(data, aes(x = Foreign, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45 ) +
  labs(tag = "(In thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = 3, size = 7),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10)) +
  hide(c("xtext", "ytext", "xtick"), "#f1d9b5")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.2, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.97, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.958, y1 = 0.958))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.11,y=.9645, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("37. FOREIGN BORN POPULATION, BY STATES AND TERRITORIES:1890", x=.5, y=.99, gp=gpar(fontsize=7, fontfamily="Main")))

dev.off()

img <- image_draw(picture)
dev.off()

image_write(img, path = here::here("Original Plot Work", "1890 State Foreign Population - Henry Gannett", "3-TitleReveal-State-Foreign-Population-1890.png"), format = "png")


# Reveal Units

picture <- image_graph(width = 500, height = 800)

ggplot(data, aes(x = Foreign, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45 ) +
  labs(tag = "(In thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = 3, size = 7),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10)) +
  hide(c("ytext"), "#f1d9b5")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.2, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.97, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.958, y1 = 0.958))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.11,y=.9645, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("37. FOREIGN BORN POPULATION, BY STATES AND TERRITORIES:1890", x=.5, y=.99, gp=gpar(fontsize=7, fontfamily="Main")))

dev.off()

img <- image_draw(picture)
dev.off()

image_write(img, path = here::here("Original Plot Work", "1890 State Foreign Population - Henry Gannett", "4-PopReveal-State-Foreign-Population-1890.png"), format = "png")



# Reveal New York

picture <- image_graph(width = 500, height = 800)

ggplot(data, aes(x = Foreign, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45 ) +
  labs(tag = "(In thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = 3, size = 7),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10)) 

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.2, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.97, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.958, y1 = 0.958))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.11,y=.9645, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("37. FOREIGN BORN POPULATION, BY STATES AND TERRITORIES:1890", x=.5, y=.99, gp=gpar(fontsize=7, fontfamily="Main")))

dev.off()

img <- image_draw(picture)
polygon(c(10, 90, 90, 10), c(55, 55, 788, 788), border = "#f1d9b5", col = "#f1d9b5")

dev.off()

image_write(img, path = here::here("Original Plot Work", "1890 State Foreign Population - Henry Gannett", "5-NYSReveal-State-Foreign-Population-1890.png"), format = "png")


# Reveal High Population

picture <- image_graph(width = 500, height = 800)

ggplot(data, aes(x = Foreign, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45 ) +
  labs(tag = "(In thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = 3, size = 7),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10)) 

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.2, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.97, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.958, y1 = 0.958))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.11,y=.9645, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("37. FOREIGN BORN POPULATION, BY STATES AND TERRITORIES:1890", x=.5, y=.99, gp=gpar(fontsize=7, fontfamily="Main")))

dev.off()

img <- image_draw(picture)
polygon(c(10, 90, 90, 10), c(205, 205, 788, 788), border = "#f1d9b5", col = "#f1d9b5")

dev.off()

image_write(img, path = here::here("Original Plot Work", "1890 State Foreign Population - Henry Gannett", "6-HighPopReveal-State-Foreign-Population-1890.png"), format = "png")
