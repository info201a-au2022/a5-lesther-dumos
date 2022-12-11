#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)
library(shinythemes)

co2_df <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv", stringsAsFactors =  FALSE)

#Graph 2
per_cap_df <- co2_df %>% 
  filter(year == "2020") %>% 
  select(country, cement_co2_per_capita, co2_including_luc_per_capita, co2_per_capita,
         coal_co2_per_capita, consumption_co2_per_capita, energy_per_capita, flaring_co2_per_capita,
         gas_co2_per_capita, ghg_per_capita, land_use_change_co2_per_capita, methane_per_capita,
         nitrous_oxide_per_capita, oil_co2_per_capita, other_co2_per_capita) %>% 
  rename("region" = "country") %>% 
  group_by(region)

world_cords <- map_data("world")
world_cap <- left_join(per_cap_df, world_cords)

#Server
server <- function (input, output){
  
 output$graph1 <- renderPlot({
   map1 <- ggplot() +
     geom_polygon(data = world_cap, aes(x = long, y = lat, group = group, fill = fill_flg)) +
     geom_point(data = world_cap, aes(x = lon, y = lat), color = "#e60000") +
     scale_fill_manual(values = c("#CCCCCC","#e60000")) +
     labs(title = 'Countries with highest "talent competitiveness"'
          ,subtitle = "source: INSEAD, https://www.insead.edu/news/2017-global-talent-competitiveness-index-davos") +
     theme(text = element_text(family = "Gill Sans", color = "#FFFFFF")
           ,panel.background = element_rect(fill = "#444444")
           ,plot.background = element_rect(fill = "#444444")
           ,panel.grid = element_blank()
           ,plot.title = element_text(size = 30)
           ,plot.subtitle = element_text(size = 10)
           ,axis.text = element_blank()
           ,axis.title = element_blank()
           ,axis.ticks = element_blank()
           ,legend.position = "none"
     )
   map1
 })
}