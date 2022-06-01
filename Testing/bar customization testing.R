library(tidyverse)
library(showtext)
library(readxl)
library(grid)
library(ggpattern)


data <- read_xlsx(here::here("Testing", "test.xlsx"))

flag <- system.file("img", "pattern.JPG", package = "ggpattern")

ggplot(data, aes(x=test, fill = fills, pattern = test)) + 
  geom_bar_pattern(position = "dodge",
                   pattern = 
                     c("none", "stripe", "stripe", "image"),
                   pattern_angle = c(rep(0, 1), 
                                     rep(45, 1), 
                                     rep(0, 1),
                                     rep(0, 1)),
                   pattern_density = .1,
                   pattern_spacing = .04,
                   pattern_fill = 'black',
                   pattern_filename = flag,
                   pattern_type = "tile") +
  scale_fill_grey() 





x = seq(-1.5, 3.5, 0.1)

y = c( rep(1.0, 22), rep(0.2, 12), rep(0.7, 7), rep(1,10))

ref = data.frame(x = x, y = y)

coral = system.file("img", "test.jpg", package="ggpattern")

p = ggplot(ref, aes(x = x, y = y))+
  scale_y_reverse(lim = c(1, 0))+
  theme_classic()+
  geom_ribbon_pattern(aes(x = x, ymin = 1, ymax = y),
                      color = "darkblue",
                      fill = NA,
                      size = 1.5,
                      pattern = 'image',
                      pattern_type = 'squish',
                      pattern_filename = coral) +
  geom_ribbon(aes(x = x, ymin = 0, ymax = y), fill = "lightblue")

p