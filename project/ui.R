## Project: ui.R file##
######################

# Call packages
library(shiny)
library(shinythemes)
library(rCharts)
# UI Design
shinyUI(
  fluidPage(theme = shinytheme("cerulean"),
    titlePanel(h2("GoT Battle Visualization & Analysis", align = "center")),
    ##
    sidebarLayout(
                hr(),
                tabsetPanel(
               #### TAB PANEL 1 ####
                tabPanel(p(icon("map-o"), "Battles"),
                tags$p(),         
                ##
                sidebarPanel( 
                  tags$style(type="text/css", "select { max-width: 199px; }"),
                  h4("Filter By Year:"),
                  helpText("Select ane or all 3 years to see changes in the graphs"),
                  ##
                  checkboxGroupInput(inputId ="got_year", 
                                     label = h5(em("Years")), 
                                     choices = list("298", "299", "300"),
                                     selected = c("298", "299", "300"))
                  ##
                ), 
                # end SidebarPanel
                ##
                mainPanel(
                ## Plot1,
                h5("Use the left panel to control the graphs"),
                h5(em("Battles in Region by Year")),
                helpText("Toggle the years in the checkbox list to control the graph"),
                showOutput("plot1", lib="nvd3"),
                ## Plot2,
                h5(em("Battles Types by Year")),
                helpText("Toggle the years in the checkbox list to control the graph"),
                showOutput("plot2", lib="nvd3"),
                ## Plot3,
                h5("Use the left panel to control the graphs"),
                h5(em("Defender house by attacker")),
                helpText("Toggle the years in the checkbox list to control the graph"),
                showOutput("plot3", lib="polycharts"),
                ##
                ## Plot3B,
                h5("Use the left panel to control the graphs"),
                h5(em("Defender house by attacker")),
                helpText("Toggle the years in the checkbox list to control the graph"),
                showOutput("plot3B", lib="polycharts"),
                ##
                hr(),
                tags$span(h6("All data used for this visualization is based on datasets made available freely on:", tags$a(href="https://www.kaggle.com/mylesoneill/game-of-thrones", "Kaggle"),"." 
                )),
                tags$span(h6("Additional data manipulation can be found on:", tags$a(href="https://github.com/minitelle/DP/tree/master/project", "github"),"." 
                )),
                tags$span(h6("This app would not have been possible without the open source community. Special mention to the following websites:", tags$a(href="http://rstudio.com", "R Studio"),",", tags$a(href="http://rcharts.io", "RCharts"),",", tags$a(href="http://fontawesome.io/icons/", "fontawesome"),",", tags$a(href="http://stackoverflow.com", "Stackoverflow"),"." 
                ))
                )#end main panel 1
                  ), #end tab panel 1
                ####### TAB PANEL 2####
                tabPanel(p(icon("shield"),"Kings & Deaths"),
                ####
                tags$p(),         
                ##
                sidebarPanel( 
                  tags$style(type="text/css", "select { max-width: 199px; }"),
                  h4("Filter:"),
                  ##
                  helpText("Select ane of the two options"),
                  checkboxGroupInput(inputId ="got_alive", 
                                     label = h5(em("Alive Status")), 
                                     choices = list("Dead", "Alive"),
                                     inline = TRUE,
                                     selected = c("Dead", "Alive")),
                  ##
                  helpText("Select one of the main GoT houses to see changes in the graphs"),
                  selectInput(inputId ="got_house", width = "200", 
                              label = h5(em("House")), 
                              choices = list("Stark", "Lannister", "Targaryen", "Baratheon",
                                             "Tully", "Greyjoy", "Night's Watch", "Wildlings",
                                             "Tyrell", "Martell", "Arryn", "None"), 
                              selected = list("Stark", "Lannister","Baratheon", "Targaryen"),
                              multiple = TRUE)
                  ##
                ), ## end SidebarPanel
                ##
                mainPanel(
                h5("Visuzalize the Culture and Houses of GoT"),
                #### Plot4####
                h5(em("Deaths by GoT Culture")),
                helpText("Toggle the years in the checkbox list to control the graph"),
                showOutput("plot4", lib="nvd3")
                #### End of Plot 4   
                #### Plot5 ####
                #### End of Plot 5####
                )# End main panel 2
                ) # End tab panel 2
              ) # End TabSet
####Do not alter anything below this line.
)
# end sidebarLayout
))