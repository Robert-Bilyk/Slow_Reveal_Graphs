library(tidyverse)
library(showtext)
library(readxl)
library(grid)


font_add_google(name = "Courier Prime", family = "Main")
showtext_auto()

data <- read_xlsx(here::here("Plot Work", "1890 State Urban Population - Henry Gannett", "Henry Gannett State Urban Population.xlsx")) %>%
  arrange(desc(`Total Population`)) %>%
  select(`State`, `Urban Population`, `Rural Population`)

data$State <- toupper(data$State)
data$`Urban Population` <- data$`Urban Population` / 1000000
data$`Rural Population` <- data$`Rural Population` / 1000000

data <- data %>%
       pivot_longer(cols = c(`Urban Population`, `Rural Population`),
             names_to = "Type",
             values_to = "Population")


#Full Graph

png(here::here("Plot Work", "1890 State Population - Henry Gannett", "5-Final-State-Pop-1890.png"),width=500,height=800)

ggplot(data, fill = NA) +
  geom_col(aes(x = `Urban Population`, y = fct_rev(fct_inorder(State))), color = "black", fill = "black", width = 0.45, position = "stack") +
  geom_col(aes(x = `Rural Population`, y = fct_rev(fct_inorder(State))), color = "black", fill = "white", width = 0.45, position = "stack") +
  labs(title = "6. POPULATION OF EACH STATE AND TERRITORY: 1890",
       tag = "(Hundreds of thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,10), breaks=seq(0,10,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 8, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", size=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_text(family = "Main", color = "black", hjust = .24, vjust = 5, size = 8),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = -4, size = 7),
        plot.tag.position = "top",
        plot.margin = margin(10,10,10,10))

