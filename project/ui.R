## Project ui.R file

# Call package
library(shiny)
library(shinythemes)
#UI Design
shinyUI(
  fluidPage(theme = shinytheme("spacelab"),
  titlePanel("GoT Battle Analysis"),
    sidebarPanel(
      h3("Filters:")
      ),
   #endsidebarpanel
  mainPanel(
    h2("Visualisation")
      )

  ))