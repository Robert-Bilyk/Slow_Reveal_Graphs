library(tidyverse)
library(srtools)

png(here::here("Testing", "package_image_test.png"),width=500,height=800)

ggplot(states, aes(x = Pop, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45, ) +
  labs(title = "POPULATION OF EACH STATE",
       subtitle = "(Population in 2021)",
       x = "Population",
       y = "State")

dev.off()


png(here::here("Testing", "package_image_test_2.png"),width=500,height=800)

ggplot(states, aes(x = Pop, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45, ) +
  labs(title = "POPULATION OF EACH STATE",
       subtitle = "(Population in 2021)",
       x = "Population",
       y = "State") +
  theme_hga()

dev.off()



png(here::here("Testing", "package_image_test_3.png"),width=500,height=800)

ggplot(states, aes(x = Pop, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45, ) +
  labs(title = "POPULATION OF EACH STATE",
       subtitle = "(Population in 2021)",
       x = "Population",
       y = "State") +
  theme_dub()

dev.off()


png(here::here("Testing", "package_image_test_4.png"),width=500,height=800)

ggplot(states, aes(x = Pop, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45, ) +
  labs(title = "POPULATION OF EACH STATE",
       subtitle = "(Population in 2021)",
       x = "Population",
       y = "State") +
  hide_axistext()

dev.off()


