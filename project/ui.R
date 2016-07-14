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
                h4("Visuzalize information about some battles of Game of Thrones"),
                tags$p(),
                ## Plot1,
                h4(em("Battle Regions by Year")),
                helpText("Toggle the years in the left panel checkbox list to control the graph"),
                showOutput("plot1", lib="nvd3"),
                hr(),
                ## Plot2,
                h4(em("Battles Types by Year")),
                helpText("Don't forget the left panel to check or uncheck years you want in the graph"),
                showOutput("plot2", lib="nvd3"),
                hr(),
                ## Plot3,
                h4(em("Defender house by attacker")),
                helpText("Don't forget the left panel to check or uncheck years you want in the graph"),
                showOutput("plot3", lib="polycharts"),
                hr(),
                ##
                ## Plot3B,
                h4(em("Is there a linear relationship between attacker size, the battle outcome and defender size?")),
                tags$span(helpText("From the view there doens't seem to be a linear relationship betweent the", em("attacker house"),",", em("the attacker army size"), "or the outcome of the battle that could explain a relationship with the defender size. In other words, a large army size doens't mean a win in either defender or atatcker scenario"
                                   )), 
                tags$span(helpText("Note as well that", tags$a(href="http://awoiaf.westeros.org/index.php/Battle_of_Castle_Black", "the battle of castle back")," has been excluded as the attacker size of `100000` is a likely outlier." 
                )),
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
                  helpText("Use the selecor options below"),
                  checkboxGroupInput(inputId ="got_alive", 
                                     label = h5(em("Alive Status")), 
                                     choices = list("Dead", "Alive"),
                                     inline = TRUE,
                                     selected = c("Dead", "Alive")),
                  ##
                  selectInput(inputId ="got_house", width = "200", 
                              label = h5(em("House")), 
                              choices = list("Stark", "Lannister", "Targaryen", "Baratheon",
                                             "Tully", "Greyjoy", "Night's Watch", "Wildlings",
                                             "Tyrell", "Martell", "Arryn", "None"), 
                              selected = list("Stark", "Lannister","Baratheon", "Targaryen"),
                              multiple = TRUE),
                  helpText("Click on the text field to select different houses or hit 'delete' to remove them.")
                  ##
                ), ## end SidebarPanel
                ##
                mainPanel(
                h4("Visuzalize the Culture and Houses of Game of Thrones"),
                tags$p(),
                #### Plot4####
                h4(em("Deaths by GoT Culture")),
                helpText("Toggle the years in the checkbox list to control the graph."),
                showOutput("plot4", lib="nvd3"),
                hr(),
                #### End of Plot 4   
                #### Plot5 ####
                h4(em("Gender, Noble status & Death")),
                helpText("Use the 'House' option in the side panel to control this graph."),
                showOutput("plot5", lib="dimple"),
                hr(),
                #### End of Plot 5   
                #### Plot6 ####
                h4(em("TBD")),
                helpText("Use the 'House' option in the side panel to control this graph."),
                showOutput("plot6", lib="dimple"),
                hr(),
                #### End of Plot 5####
                tags$span(h6("All data used for this visualization is based on datasets made available freely on:", tags$a(href="https://www.kaggle.com/mylesoneill/game-of-thrones", "Kaggle"),"." 
                )),
                tags$span(h6("Additional data manipulation can be found on:", tags$a(href="https://github.com/minitelle/DP/tree/master/project", "github"),"." 
                )),
                tags$span(h6("This app would not have been possible without the open source community. Special mention to the following websites:", tags$a(href="http://rstudio.com", "R Studio"),",", tags$a(href="http://rcharts.io", "RCharts"),",", tags$a(href="http://fontawesome.io/icons/", "fontawesome"),",", tags$a(href="http://stackoverflow.com", "Stackoverflow"),"." 
                ))
                )# End main panel 2
                ) # End tab panel 2
              ) # End TabSet
####Do not alter anything below this line.
)
# end sidebarLayout
))