library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(quantmod)
library(plotly)
library(shinythemes)

#Sources
source("server.R")
source("ui.R")


#Connection
shinyApp(server = server, ui = ui)
