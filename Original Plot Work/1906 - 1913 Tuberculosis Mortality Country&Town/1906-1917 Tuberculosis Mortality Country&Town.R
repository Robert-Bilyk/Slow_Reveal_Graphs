library(tidyverse)
library(showtext)
library(readxl)
library(grid)
library(ggpubr)


#font_add_google(name = "Courier Prime", family = "Main")
#showtext_auto()

#text <- paste("En Angleterre, en France et aux Etats- Unis \ndurant les annees 1906 a 1913.*", sep = "")

country <- read_xlsx(here::here("Original Plot Work", "1906 - 1913 Tuberculosis Mortality Country&Town", "Tuberculosis Countries.xlsx")) 

countryplot <- ggplot(country) +
  geom_line(aes(x=Year, y= Death, group = Country, linetype = Country, size = Country)) +
  labs(title= "COVNTRIES") +
  scale_x_continuous(limits = c(1906,1913), breaks = seq(1906,1913,1)) +
  scale_y_continuous(limits = c(0,5), breaks = seq(0,5,.25)) +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major = element_line(color= "white"),
        panel.background = element_rect(fill="white"),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        legend.position = "none")



town <- read_xlsx(here::here("Original Plot Work", "1906 - 1913 Tuberculosis Mortality Country&Town", "Tuberculosis Towns.xlsx")) 

townplot <- ggplot(town) +
  geom_line(aes(x=Year, y= Death, group = Area, linetype = Area, size = Area)) +
  labs(title= "TOWNS") +
  scale_x_continuous(limits = c(1906,1913), breaks = seq(1906,1913,1)) +
  scale_y_continuous(position = "right", limits = c(0,5), breaks = seq(0,5,.25)) +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major = element_line(color= "white"),
        panel.background = element_rect(fill="white"),
        axis.ticks = element_blank(),
        axis.title = element_blank(), 
        legend.position = "none")




ggarrange(ggplot() + theme_void(),
          ggarrange(countryplot, ggplot() + theme_void(), townplot, ncol=3, widths = c(.5, .1, .5)),
          ggplot() + theme_void(),
          nrow = 3, heights = c(.2, 1, .1))
