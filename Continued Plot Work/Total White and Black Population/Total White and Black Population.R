57 lines (46 sloc)  2.4 KB
   
# Special Request from Tammy based on Image 10_1 using 1900-1970 data

#setup
library(tidyverse)
library(showtext)

# Loading required fonts
font_add_google("Dynalight", "Dynalight")

font_add_google("Puritan", "Puritan")
showtext_auto()


#Creating a dataset
year <- c(rep("1900", 2), rep("1910", 2), rep("1920", 2), rep("1930", 2),
          rep("1940", 2), rep("1950", 2), rep("1960", 2), rep("1970", 2))

condition <- rep(c("black","white"), 8)          

value <- c(8.83, 57.97, 9.83, 71.90, 10.46, 84.36, 11.89, 98.395, 12.87, 105.35, 15.04, 119.899,
           18.87, 139.96, 22.58, 155.17)

df <- data.frame(year, condition, value)

x_axis_text <- c("", 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, "")

# stacked bar graph
ggplot(df, aes(fill = condition, x = value, y = reorder(year, -value)))  +
  geom_vline(xintercept = 0:180 , linetype="solid", 
             color = "gray21", size = 0.6) +
  geom_vline(xintercept = seq(0, 180, by = 10), linetype="solid", 
             color = "gray21", size = 1.2) +
  geom_col(position = position_stack(reverse = TRUE), colour = "black", width = 0.5) +
  scale_fill_manual(values = c("black", "white")) +
  scale_y_discrete() +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top", limits = c(-10,180), 
                     breaks = seq(-10, 180, by = 10)) +
  labs(title = "TOTAL WHITE AND BLACK POPULATION.",
       subtitle = "1900 - 1970") +
  labs(y = NULL, x = "Millions.") +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 15),
        plot.subtitle = element_text(hjust = 0.5, family = "Puritan")) +
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Dynalight", size = 15),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05,
                                   margin = margin(l = 40, r = -35), colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 12)) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) +
  theme(legend.position = "none") +
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"))
