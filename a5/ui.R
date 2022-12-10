#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

intro_panel <- tabPanel(
  "Introduction",
  titlePanel(strong("CO2 Gas Emissions")),
  br(),
  h3(strong("Introduction")),
  sidebarLayout(
    mainPanel(
    ),
    sidebarPanel (
    ) 
  )
)

interactive_1 <- tabPanel(
  "Interactive 1",
  titlePanel("Graph"),
  h3(strong("Introduction")),
  sidebarLayout(
    mainPanel(
    ),
    sidebarPanel (
    ) 
  )
)

ui <- navbarPage(
  "Navigation",
  intro_panel,
  interactive_1
)
