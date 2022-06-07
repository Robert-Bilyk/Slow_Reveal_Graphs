# https://www.loc.gov/resource/rbaapc.10601/?sp=10


#setup
library(tidyverse)
library(showtext)

# Required fonts
font_add_google("Dynalight", "Dynalight")
font_add_google("Puritan", "Puritan")
showtext_auto()



# Creating a dataset
year <- c(rep("1790", 2), rep("1800", 2), rep("1810", 2), rep("1820", 2),
          rep("1830", 2), rep("1840", 2), rep("1850", 2), rep("1860", 2),
          rep("1870", 2), rep("1880", 2), rep("1890", 2))

condition <- rep(c("black","white"), 11)

value <- c(1, 3, 1.4, 3.8, 1.5, 5.7, 1.9, 8, 2.5, 10.3, 3.0, 14, 3.5, 19.6,
           4.5, 27, 4.9, 33.6, 6.5, 43.6, 7.5, 55)

df <- data.frame(year, condition, value)

x_axis_text <- c("", 0, 10, 20, 30, 40, 50, 60, "")

# stacked bar graph
ggplot(df, aes(fill = condition, x = value, y = reorder(year, -value)))  +
  geom_vline(xintercept = 0:70 , linetype="solid", 
             color = "gray21", size = 0.6) +
  geom_vline(xintercept = c(10,20,30,40,50,60,70), linetype="solid", 
             color = "gray21", size = 1.2) +
  geom_col(position = position_stack(reverse = TRUE), colour = "black", width = 0.5) +
  scale_fill_manual(values = c("black", "white")) +
  scale_y_discrete() +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top", limits = c(-8,70), 
                     breaks = seq(-10, 70, by = 10)) +
  labs(title = "TOTAL POPULATION AND WHITE AND NEGRO ELEMENTS.",
       subtitle = "PLATE I.") +
  labs(y = NULL, x = "Millions.") +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 15),
        plot.subtitle = element_text(hjust = 1, family = "Puritan")) +
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Dynalight", size = 15),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05,
                                   margin = margin(l = 40, r = -60), colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 12)) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) +
  theme(legend.position = "none") +
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"))
