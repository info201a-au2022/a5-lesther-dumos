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
library(quantmod)
library(plotly)
library(shinythemes)
library(usmap)
library(maps)



co2_df <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv", stringsAsFactors =  FALSE)
data_code <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-codebook.csv")

# Data Wrangling 
per_cap_df <- co2_df %>% 
  filter(year == 2020) %>% 
  select(year, country, cement_co2_per_capita, co2_including_luc_per_capita, co2_per_capita,
         coal_co2_per_capita, consumption_co2_per_capita, energy_per_capita, flaring_co2_per_capita,
         gas_co2_per_capita, ghg_per_capita, land_use_change_co2_per_capita, methane_per_capita,
         nitrous_oxide_per_capita, oil_co2_per_capita, other_co2_per_capita) %>% 
  mutate(cement_co2_per_capita = as.numeric(cement_co2_per_capita)) %>% 
  rename("region" = "country") %>% 
  group_by(region)
mapdata <- map_data("world")
map_cap_df <- left_join(per_cap_df, mapdata)

world_data <- co2_df %>% 
  filter(country == "World")

#Data Wrangling for Intro
most_co2 <- world_data %>% 
  filter(co2 == max(co2)) %>% 
  pull(co2)

most_co2_year <- world_data %>% 
  filter(co2 == max(co2)) %>% 
  pull(year)

most_co2_population <- world_data %>% 
  filter(co2 == max(co2)) %>% 
  pull(population)

most_n2o_year <- world_data %>% 
  filter(nitrous_oxide_per_capita == max(nitrous_oxide_per_capita, na.rm = TRUE)) %>% 
  pull(year)

most_n2o <- world_data %>% 
  filter(nitrous_oxide_per_capita == max(nitrous_oxide_per_capita, na.rm = TRUE)) %>% 
  pull(nitrous_oxide_per_capita)

most_n2o_population <- world_data %>% 
  filter(nitrous_oxide_per_capita == max(nitrous_oxide_per_capita, na.rm = TRUE)) %>% 
  pull(population)

gas_1950 <- world_data %>% 
  filter(year == 1950) %>% 
  pull(gas_co2_per_capita)

gas_2000 <- world_data %>% 
  filter(year == 2000) %>% 
  pull(gas_co2_per_capita)




# Define server logic required to draw a histogram
shinyServer <- function (input, output){
  
# Render Graph 1
  output$graph_1 <- renderPlot({
  map1 <- ggplot() +
    geom_polygon(data = mapdata,
      aes(x = long, y = lat, group = group),
      color = "black", fill = "white") +
    geom_polygon(data = map_cap_df,
      aes(x = long, y = lat, group = group),
      color = "red", fill = "pink")
  map1
  })
  
  #Render Table
  output$mytable <- DT::renderDataTable({
    data_code
  })
  
  #Render a line Graph
  output$graph_2 <- renderPlot ({
    graph2_plot <- ggplot(data = world_data) +
      geom_line(mapping = aes_string (
        x = world_data$year,
        y = input$graph1_input
      ), color = "purple") +
      labs(
        x = "Year",
        y = "Type of Emission",
        title = "World Total by Emissions"
      ) + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
    graph2_plot 
    
  })
}

