#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)


intro_panel <- tabPanel(
  "Introduction",
  titlePanel(strong("CO2 Gas Emissions")),
  br(),
  h3(strong("Introduction")),
  sidebarLayout(
    mainPanel(
    ),

  )
)

interactive_1 <- tabPanel(
  "Interactive Page",
  titlePanel("Graph"),
  h3(strong("Introduction")),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "graph1_input",
        label = "Choose varaible",
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
          "Annual production-based emissions of carbon dioxide (CO₂) from other industry sources" = "other_co2_per_capita"
        ),
        selected = "cement_co2_per_capita"
      ),
    ),
    mainPanel(
      plotOutput("graph1")
    )
  )
)

ui <- navbarPage(
  "Navigation",
  intro_panel,
  interactive_1
)
