library(tidyverse)
library(showtext)

font_add_google(name = "Courier Prime", family = "Main")
showtext_auto()

theme_hg <- function(){ 
  font <- "Main"   
  
  theme_minimal() %+replace%    
    
    theme(
      
      #grid elements
      panel.grid.major = element_line(color = "black", size = .25),   
      panel.grid.minor = element_blank(),    
      
      panel.background = element_blank(),
      plot.background = element_rect(fill = "#f1d9b5"),
      
      plot.title = element_text(    
        family = font,
        size = 7,             
        face = 'bold'),         
      
      plot.subtitle = element_text(       
        family = font,        
        size = 7),               
      
      plot.tag = element_text(
        family = font,          
        size = 7),               
      
      plot.caption = element_text(
        family = font,      
        size = 9,       
        hjust = 1),           
      
      axis.title = element_blank(),
      
      axis.text.y = element_text(       
        family = font,
        size = 8,
        color = "black"),
      
      axis.text.x = element_text(       
        family = font,
        size = 7,
        color = "black") 
    )
}