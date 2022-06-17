library(tidyverse)
library(showtext)
library(readxl)
library(grid)


#font_add_google(name = "Courier Prime", family = "Main")
#showtext_auto()

data <- read_xlsx(here::here("Original Plot Work", "1906 - 1913 Tuberculosis Mortality Country&Town", "Tuberculosis Countries.xlsx")) %>%
  pivot_wider(names_from = Country,
              values_from = c(Death))

ggplot(data) +
  geom_line(aes(x=Year, y= France)) +
  geom_line(aes(x=Year, y=United_States)) +
  geom_line(aes(x=Year, y=England&Wales)) 