
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


intro_panel <- tabPanel(
  "Introduction",
  titlePanel(strong("CO2 and Greenhouse Gases")),
  hr(style = "border-top: 1px solid #000000;"),
  sidebarLayout(
    mainPanel(
      DT::dataTableOutput("mytable")
    ),
    sidebarPanel (
      h4(strong("Abstract")),
      hr(style = "border-top: 1px solid #000000;"),
      p("This project covers the emissions that are found in our world. It covers the years beginning from 1750’s up till 2020. 
        It shows which countries and what type of emissions are utilized the most. The table to the right shows how many variables 
        and what each correspodnming variable does."),
      p("My analysis covers the world data in years in which emissions are accumulated per capita of a person. It is interesting as 
        each emission has its own pattern. The most carbon dioxide that occurred was in 2021 with 3,7000 million tonnes with a 
        population of nearly 8 million. As opposed to nitrous with the highest utility in 1990 with .446 million tonnes. And it has 
        decreased since the 1990’s. With the rise of carbon dioxide shows the shift of energy in the global energy utility which has 
        only increased upwards since the 1850s. Another popular rise of energy is the consumption of gas. In the 1950, it was recorded 
        that it was at .141 million tonnes but has since increased by 400% within a 50 years time frame. ")
    ) 
  )
)


# Graph 1

interaction_one <- tabPanel(
  "Interactive Graph",
  titlePanel(strong("Emissions by Country")),
    sidebarLayout(
      sidebarPanel(
        selectInput(
          inputId = "graph1_input",
          label = "Choose Graph",
          choices = list(
            "Annual production-based emissions of carbon dioxide" = "cement_co2_per_capita",
            "Annual production-based emissions of carbon dioxide (CO₂), including land-use change" = "co2_including_luc_per_capita",
            "Annual total production-based emissions of carbon dioxide (CO₂), excluding land-use change" = "co2_per_capita",
            "Annual production-based emissions of carbon dioxide (CO₂) from coal" = "coal_co2_per_capita",
            "Annual consumption-based emissions of carbon dioxide (CO₂)" = "consumption_co2_per_capita",
            "Primary energy consumption" = "energy_per_capita",
            "Annual production-based emissions of carbon dioxide (CO₂) from flaring" = "flaring_co2_per_capita",
            "Annual production-based emissions of carbon dioxide (CO₂) from gas" = "gas_co2_per_capita",
            "Total greenhouse gas emissions including land-use change and forestry" = "ghg_per_capita",
            "Annual production-based emissions of carbon dioxide (CO₂) from land-use change" = "land_use_change_co2_per_capita",
            "Total methane emissions including land-use change and forestry" = "methane_per_capita",
            "Total nitrous oxide emissions including land-use change and forestry" = "nitrous_oxide_per_capita",
            "Annual production-based emissions of carbon dioxide (CO₂) from oil" = "oil_co2_per_capita",
            "Annual production-based emissions of carbon dioxide (CO₂) from other industry sources" = "other_co2_per_capita"),
          selected = "cement_co2_per_capita"
        ),
      ),
      mainPanel(
        plotOutput("graph_1"),
        p("Unfortunately, I was not able to produce a map chart within the library extensions. Unlike the US map which comes 
          with a library that assists in mapping, I was not able to apply the concept into a global scale with data that held 
          a lot of information. "),
        p("However, the purpose of the graph was to show the visual difference in the contrasting countries that showed the 
          type of emissions in a capital level (per person) and as well show which countries produced the most emissions by 
          selecting what type of emissions to be listed. "),
        plotOutput("graph_2"),
        p("In the majority of the graphs, most emissions have an increase, some years have exponential growth. However, it appears 
        that total methane and nitrous emissions from including land-use change and forestry was the only graph that decreased. It 
        is an interesting point as the usage of carbon dioxide from land-use was a popular source of emission from the 1850’s which 
        lasted nearly a century until the 1950’s where it dropped down. However, the largest growth comes from emissions from carbon 
        dioxide occurring in the mid 1900’s.")
        
      )
    )
)



shinyUI <- navbarPage(
  h4("The US Economy", align = "center"),
  theme = shinytheme("yeti"),
  intro_panel,
  interaction_one
)
