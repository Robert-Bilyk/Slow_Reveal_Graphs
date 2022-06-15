library(tidyverse)
library(showtext)
library(readxl)
library(srthemes)

data <- read_xlsx(here::here("Original Plot Work", "1890 State Population - Henry Gannett", "Henry Gannett Total State Population 1890.xlsx")) %>%
  arrange(Population)

data$State <- toupper(data$State)
data$pop <- data$Population / 100000


#Full Graph

png(here::here("Testing", "package_image_test.png"),width=500,height=800)

ggplot(data, aes(x = pop, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45, ) +
  labs(title = "6. POPULATION OF EACH STATE AND TERRITORY: 1890",
       subtitle = "(Hundreds of thousands.)") +
  theme_dub()

dev.off()