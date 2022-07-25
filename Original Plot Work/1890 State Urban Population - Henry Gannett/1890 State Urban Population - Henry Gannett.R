library(tidyverse)
library(showtext)
library(readxl)
library(grid)
library(magick)
library(srtools)


font_add_google(name = "Courier Prime", family = "Main")
showtext_auto()

data <- read_xlsx(here::here("Original Plot Work", "1890 State Urban Population - Henry Gannett", "Henry Gannett State Urban Population.xlsx")) %>%
  arrange(desc(`Total Population`)) %>%
  select(`State`, `Urban Population`, `Rural Population`)

data$State <- toupper(data$State)
data$`Urban Population` <- data$`Urban Population` / 1000000
data$`Rural Population` <- data$`Rural Population` / 1000000

data <- data %>%
       pivot_longer(cols = c(`Urban Population`, `Rural Population`),
             names_to = "Location",
             values_to = "Population")


#11 Full Graph

picture <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("21. TOTAL AND URBAN POPULATION, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))
grid.draw(textGrob("The total length of each bar represents the aggregate population of the State or Territory," , x=.5, y=.035, gp=gpar(fontsize=9, fontfamily="Main")))
grid.draw(textGrob("while the black portion of the bar indicates the urban element; that is,", x=.5, y=.023, gp=gpar(fontsize=9, fontfamily="Main")))
grid.draw(textGrob("the population contained in cities having 8,000 inhabitants or more", x=.5, y=.011, gp=gpar(fontsize=9, fontfamily="Main")))

dev.off()

image_write(picture, path = here::here("Original Plot Work", "1890 State Urban Population - Henry Gannett", "11-Final-State-Urban-Pop-1890.png"), format = "png")


#1 Full Concealed

picture <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none") +
  hide(hidden = c("xtext", "ytext", "xtick"), colour = "#f1d9b5")

grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.043, y1 = 0.942))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.043, y1 = 0.942))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.043, y1 = 0.942))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.95, y0 = 0.942, y1 = 0.942))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.95, y0 = 0.043, y1 = 0.043))

dev.off()

image_write(picture, path = here::here("Original Plot Work", "1890 State Urban Population - Henry Gannett", "1-Concealed-State-Urban-Pop-1890.png"), format = "png")


#2 Reveal Population

picture <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none") +
  hide(hidden = c("ytext"), colour = "#f1d9b5")

grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.043, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.043, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.043, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.95, y0 = 0.043, y1 = 0.043))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))


dev.off()

image_write(picture, path = here::here("Original Plot Work", "1890 State Urban Population - Henry Gannett", "2-RevealPop-State-Urban-Pop-1890.png"), format = "png")

#3 Reveal States Label

picture <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none") +
  hide(hidden = c("ytext"), colour = "#f1d9b5")


grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))

dev.off()

image_write(picture, path = here::here("Original Plot Work", "1890 State Urban Population - Henry Gannett", "3-RevealStatesLabel-State-Urban-Pop-1890.png"), format = "png")


#4 Reveal Year

picture <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none") +
  hide(hidden = c("ytext"), colour = "#f1d9b5")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))
grid.draw(textGrob("21. TOTAL AND URBAN POPULATION, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=11, fontfamily="Main")))

dev.off()

img <- image_draw(picture)
polygon(c(50, 469, 469, 50), c(2, 2, 13, 13), border = "#f1d9b5", col = "#f1d9b5")
 dev.off()
 
image_write(img, path = here::here("Original Plot Work", "1890 State Urban Population - Henry Gannett", "4-RevealYear-State-Urban-Pop-1890.png"), format = "png")

#5 Reveal New York

picture <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))
grid.draw(textGrob("21. TOTAL AND URBAN POPULATION, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=11, fontfamily="Main")))

dev.off()

img <- image_draw(picture)
polygon(c(50, 469, 469, 50), c(2, 2, 13, 13), border = "#f1d9b5", col = "#f1d9b5")
polygon(c(10, 120, 120, 10), c(55, 55, 667, 667), border = "#f1d9b5", col = "#f1d9b5")
dev.off()

image_write(img, path = here::here("Original Plot Work", "1890 State Urban Population - Henry Gannett", "5-RevealNY-State-Urban-Pop-1890.png"), format = "png")

#6 Reveal North Carolina and Alabama

picture <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))
grid.draw(textGrob("21. TOTAL AND URBAN POPULATION, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=11, fontfamily="Main")))

dev.off()

img <- image_draw(picture)
polygon(c(50, 469, 469, 50), c(2, 2, 13, 13), border = "#f1d9b5", col = "#f1d9b5")
polygon(c(10, 120, 120, 10), c(55, 55, 235, 235), border = "#f1d9b5", col = "#f1d9b5")
polygon(c(10, 120, 120, 10), c(260, 260, 667, 667), border = "#f1d9b5", col = "#f1d9b5")

dev.off()

image_write(img, path = here::here("Original Plot Work", "1890 State Urban Population - Henry Gannett", "6-RevealNCA-State-Urban-Pop-1890.png"), format = "png")

#7 Reveal Full Title

picture <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))
grid.draw(textGrob("21. TOTAL AND URBAN POPULATION, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=11, fontfamily="Main")))

dev.off()

img <- image_draw(picture)
polygon(c(10, 120, 120, 10), c(55, 55, 235, 235), border = "#f1d9b5", col = "#f1d9b5")
polygon(c(10, 120, 120, 10), c(260, 260, 667, 667), border = "#f1d9b5", col = "#f1d9b5")

dev.off()

image_write(img, path = here::here("Original Plot Work", "1890 State Urban Population - Henry Gannett", "7-RevealTitle-State-Urban-Pop-1890.png"), format = "png")

#8 Reveal Caption

picture <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))
grid.draw(textGrob("21. TOTAL AND URBAN POPULATION, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("The total length of each bar represents the aggregate population of the State or Territory," , x=.5, y=.035, gp=gpar(fontsize=9, fontfamily="Main")))
grid.draw(textGrob("while the black portion of the bar indicates the urban element; that is,", x=.5, y=.023, gp=gpar(fontsize=9, fontfamily="Main")))
grid.draw(textGrob("the population contained in cities having 8,000 inhabitants or more", x=.5, y=.011, gp=gpar(fontsize=9, fontfamily="Main")))

dev.off()

img <- image_draw(picture)
polygon(c(10, 120, 120, 10), c(55, 55, 235, 235), border = "#f1d9b5", col = "#f1d9b5")
polygon(c(10, 120, 120, 10), c(260, 260, 667, 667), border = "#f1d9b5", col = "#f1d9b5")

dev.off()

image_write(img, path = here::here("Original Plot Work", "1890 State Urban Population - Henry Gannett", "8-RevealCaption-State-Urban-Pop-1890.png"), format = "png")

#9 Reveal Pennsylvania and Illinois

picture <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))
grid.draw(textGrob("21. TOTAL AND URBAN POPULATION, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("The total length of each bar represents the aggregate population of the State or Territory," , x=.5, y=.035, gp=gpar(fontsize=9, fontfamily="Main")))
grid.draw(textGrob("while the black portion of the bar indicates the urban element; that is,", x=.5, y=.023, gp=gpar(fontsize=9, fontfamily="Main")))
grid.draw(textGrob("the population contained in cities having 8,000 inhabitants or more", x=.5, y=.011, gp=gpar(fontsize=9, fontfamily="Main")))

dev.off()

img <- image_draw(picture)
polygon(c(10, 120, 120, 10), c(80, 80, 235, 235), border = "#f1d9b5", col = "#f1d9b5")
polygon(c(10, 120, 120, 10), c(260, 260, 667, 667), border = "#f1d9b5", col = "#f1d9b5")

dev.off()

image_write(img, path = here::here("Original Plot Work", "1890 State Urban Population - Henry Gannett", "9-RevealPI-State-Urban-Pop-1890.png"), format = "png")

#10 Reveal Lowest Population States

picture <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))
grid.draw(textGrob("21. TOTAL AND URBAN POPULATION, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("The total length of each bar represents the aggregate population of the State or Territory," , x=.5, y=.035, gp=gpar(fontsize=9, fontfamily="Main")))
grid.draw(textGrob("while the black portion of the bar indicates the urban element; that is,", x=.5, y=.023, gp=gpar(fontsize=9, fontfamily="Main")))
grid.draw(textGrob("the population contained in cities having 8,000 inhabitants or more", x=.5, y=.011, gp=gpar(fontsize=9, fontfamily="Main")))

dev.off()

img <- image_draw(picture)
polygon(c(10, 120, 120, 10), c(80, 80, 235, 235), border = "#f1d9b5", col = "#f1d9b5")
polygon(c(10, 120, 120, 10), c(260, 260, 630, 630), border = "#f1d9b5", col = "#f1d9b5")

dev.off()

image_write(img, path = here::here("Original Plot Work", "1890 State Urban Population - Henry Gannett", "10-RevealLowPop-State-Urban-Pop-1890.png"), format = "png")
