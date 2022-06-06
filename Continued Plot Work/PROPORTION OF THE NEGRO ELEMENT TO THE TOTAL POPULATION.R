# https://www.loc.gov/resource/rbaapc.10601/?sp=10

# setup
library(tidyverse)
library(showtext)

# Loading the required fonts
font_add_google("Dynalight", "Dynalight")
font_add_google("Puritan", "Puritan")
showtext_auto()

# creating a dataframe
percent <- c(12, 13, 12.8, 15, 15.8, 16.9, 18, 18.2, 19, 18.7, 19.1)
year <- c("1890", "1880", "1870", "1860", "1850", "1840", "1830", "1820", "1810", "1800", "1790")
df1 = data.frame(percent, year)

x_axis_text <- c(0, 10, 20)

# plotting the graph
ggplot(df1, aes(x = percent, y = year)) +
  geom_bar(stat = "identity", width = 0.4, fill = "gray21") +
  scale_y_discrete(expand = c(0,0), limits = rev) +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top",
                     breaks = seq(0, 20, by = 10)) +
  labs(title = "PLATE II.",
       subtitle = "PROPORTION OF THE NEGRO ELEMENT TO THE TOTAL \nPOPULATION") +
  geom_vline(xintercept = 0:20 , linetype = "solid", 
             color = "gray21", size = 0.6) +
  geom_vline(xintercept = c(10,20), linetype = "solid", 
             color = "gray21", size = 1.2) +
  labs(x = "Per Cent.", y = NULL) +
  theme(plot.title = element_text(hjust = 1, face = "bold",family = "Puritan", colour = "gray21"),
        plot.subtitle = element_text(hjust = 0.5, face = "bold", family = "Puritan", size = 15))+
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Dynalight", size = 13),
        axis.text.y = element_text(colour = "gray21", 
                                   face = "bold.italic", family = "Dynalight", size = 13)) +
  theme(axis.ticks.y = element_blank(), 
        axis.title.x = element_text(color = "gray21", family = "Puritan", hjust = 1)) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"))
