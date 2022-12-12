#Library
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

#Sources
source("shiny_server.R")
source("shiny_ui.R")


#Connection
shinyApp(server = shinyServer, ui = shinyUI)






