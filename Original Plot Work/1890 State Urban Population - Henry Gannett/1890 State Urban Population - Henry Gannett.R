library(tidyverse)
library(showtext)
library(readxl)
library(grid)


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


#Full Graph

png(here::here("Original Plot Work", "1890 State Urban Population - Henry Gannett", "6-Final-State-Urban-Pop-1890.png"),width=600,height=700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
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
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.21, x1 = 0.21, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("21. TOTAL AND URBAN POPULATION, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("The total length of each bar represents the aggregate population of the State or Territory," , x=.5, y=.035, gp=gpar(fontsize=6, fontfamily="Main")))
grid.draw(textGrob("while the black portion of the bar indicates the urban element; that is,", x=.5, y=.025, gp=gpar(fontsize=6, fontfamily="Main")))
grid.draw(textGrob("the population contained in cities having 8,000 inhabitants or more", x=.5, y=.015, gp=gpar(fontsize=6, fontfamily="Main")))

dev.off()

#Full Concealed

png(here::here("Original Plot Work", "1890 State Urban Population - Henry Gannett", "1-Concealed-State-Urban-Pop-1890.png"),width=600,height=700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "#f1d9b5"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "#f1d9b5"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.21, x1 = 0.21, y0 = 0.045, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.21, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.21, x1 = 0.95, y0 = 0.045, y1 = 0.045))

dev.off()

#Reveal Population

png(here::here("Original Plot Work", "1890 State Urban Population - Henry Gannett", "2-RevealPop-State-Urban-Pop-1890.png"),width=600,height=700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "#f1d9b5"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.21, x1 = 0.21, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.21, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.21, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.21, x1 = 0.95, y0 = 0.045, y1 = 0.045))

dev.off()

#Reveal States

png(here::here("Original Plot Work", "1890 State Urban Population - Henry Gannett", "3-RevealStates-State-Urban-Pop-1890.png"),width=600,height=700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
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
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.21, x1 = 0.21, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=8, fontfamily="Main")))

dev.off()

#Reveal Units

png(here::here("Original Plot Work", "1890 State Urban Population - Henry Gannett", "4-RevealUnits-State-Urban-Pop-1890.png"),width=600,height=700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
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
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.21, x1 = 0.21, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=8, fontfamily="Main")))

dev.off()

#Reveal Bar Colors

png(here::here("Original Plot Work", "1890 State Urban Population - Henry Gannett", "5-RevealBars-State-Urban-Pop-1890.png"),width=600,height=700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
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
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.21, x1 = 0.21, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.962, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("The total length of each bar represents the aggregate population of the State or Territory," , x=.5, y=.035, gp=gpar(fontsize=6, fontfamily="Main")))
grid.draw(textGrob("while the black portion of the bar indicates the urban element; that is,", x=.5, y=.025, gp=gpar(fontsize=6, fontfamily="Main")))
grid.draw(textGrob("the population contained in cities having 8,000 inhabitants or more", x=.5, y=.015, gp=gpar(fontsize=6, fontfamily="Main")))

dev.off()

