## Project: Server.R file##
##########################

# Call Package
library(shiny)
library(rCharts)
library(ggplot2)
source("loaddata.R")
# App info
shinyServer(
  function(input, output){
    #
    selectedData1 <- reactive({
      #year = input$bat_year
    #  subset(battles, year == y)
      #colnames(battles)[c(6, 10, 14)] <- c("Attacker", "Defender", "Attacker.Outcome")
      battles[which(as.factor(battles$year) %in% input$got_year),] #& as.factor(battles$attacker_1) %in% input$got_house
    })
    ##
    ### Panel 1 Plots ###
    ##
    #### Plot1 ####
    output$plot1 <- renderChart({
      #
      p1 <- nPlot(~ region, group = 'year', data = selectedData1(), type = 'multiBarChart')
      p1$chart(showControls = F)
      #p1$set(dom = 'plot1')
      p1$addParams(dom = 'plot1', title="test")
      p1$xAxis(axisLabel = "Regions")
      p1$chart(color = c('#413657', '#265475', '#353817', '6C2224', '4F0F0F', '777274'))
      ##
      return(p1)
    })
    
    #### Plot2 ####
    output$plot2 <- renderChart({
      #### Do not touch this it is bad code == # battles[which(battles$year == input$got_year),]
      #year = input$bat_year
      #dat <- subset(battles, year == year)
      #
      p2 <- nPlot(~ battle_type, group = 'year', data = selectedData1(), type = 'multiBarHorizontalChart')
      p2$chart(showControls = F)
      #p2$set(dom = 'plot2')
      p2$templates$script <- "http://timelyportfolio.github.io/rCharts_nvd3_templates/chartWithTitle_styled.html"
      p2$addParams(dom = 'plot2')
      p2$chart(color = c('#413657', '#265475', '#353817','#413657', '#353817', '6C2224'))
      #p2$xAxis(rotateLabels=-45)
      # Add Axis value
      p2$yAxis(axisLabel = '# of battles')
      ##
      return(p2)
    })
    #### Plot3 ####
    output$plot3 <- renderChart({
      
    p3 <- rPlot(attacker_1 ~ defender_1 | year, data = selectedData1(), type = 'point', color = 'attacker_outcome')
    p3$facet(var = 'year', rows = 3)
    p3$guides(x = list(title="Defender House"), y = list(title="Attacker House", numticks = 8))
    p3$set(color = c('#413657', '#265475'))
    p3$set(dom = 'plot3', title="Battle outcome by Opponents",  height="450")
    #p3$addParams(dom = 'plot3', title="Major Deaths")
    ##
    return(p3)
    })
    #### Plot3 ####
    output$plot3B <- renderChart2({
    
      #dat <- selectedData1()
    
      p3B <- rPlot(x = "attacker_size", y = "defender_size", data = selectedData1(), color = "attacker_outcome",
                  type = 'point')
      p3B$guides(x = list(title="Defender House"), y = list(title="Attacker House"))
      p3B$set(dom = 'plot3B', title="Battle outcome by Opponents",  height="450")
     #fit<- lm(attacker_size ~ defender_size, data=battles)
      
      #dat = fortify(lm(attacker_size ~ as.factor(attacker_outcome), data=battles))
      #names(dat) = gsub('\\.', '_', names(dat))
      #fitted <- lm(attacker_size ~ defender_size, data=battles)$fitted.values
  
      #p3B$layer(x = 'attacker_1', y = 'defender_1', data = selectedData1(), copy_layer = T, type = 'line')
      return(p3B)
    })
    
    ### Panel 2 Plots ###
    ## Set selectedDate 2
    selectedData2 <- reactive({
      gpdata <- na.omit(subset(got_predict,select=c(culture,isAlive, house, isNoble)))
      gpdata$isAlive[gpdata$isAlive == "1"] <- "Alive"
      gpdata$isAlive[gpdata$isAlive == "0"] <- "Dead"
      gpdata$isAlive <- as.factor(gpdata$isAlive)
      gpdata$isNoble <- as.factor(gpdata$isNoble)
      gpdata$culture <- as.factor(gpdata$culture)
      gpdata$house <- as.factor(gpdata$house)# modify value for in variables where 0 and 1 are used to denote status
      
      
      #
      gpdata[which(gpdata$house %in% input$got_house & gpdata$isAlive %in% input$got_alive), ]
      # colnames(battles)[c(6, 10, 14)] <- c("Main Attacker", "Main Defender", "Attacker Battle Outcome")
     # battles[which(as.factor(battles$year) %in% input$got_year),] #& as.factor(battles$attacker_1) %in% input$got_house
    })
    #
    selectedData3 <- reactive({
      gcdata <- na.omit(subset(got_deaths,select=c(Name, Allegiances,Gender, Nobility, Death.Year, Book.of.Death)))
      gcdata$isAlive <- as.factor(gpdata$Name)
      gcdata$isNoble <- as.factor(gpdata$Allegiances)
      gcdata$culture <- as.factor(gpdata$Gender)
      gcdata$house <- as.factor(gpdata$Nobility)
      gcdata$house <- as.factor(gpdata$Book.of.Death)
      gcdata$house <- as.factor(gpdata$Death.Year)
      
      #
      gcdata[which(gcdata$Allegiances %in% input$got_house), ]
      # colnames(battles)[c(6, 10, 14)] <- c("Main Attacker", "Main Defender", "Attacker Battle Outcome")
      # battles[which(as.factor(battles$year) %in% input$got_year),] #& as.factor(battles$attacker_1) %in% input$got_house
    })
    #### Plot4 ####
    output$plot4 <- renderChart({
      
      p4 <- nPlot(~culture, data = selectedData2(), group="isAlive", type = 'multiBarChart')
      p4$chart(showControls = F)
      p4$chart(color = c('#413657', '#265475', '#353817','#413657', '#353817', '6C2224'))
      p4$set(dom = 'plot4')
      #p3$addParams(dom = 'plot4', title="Major Deaths")
      p4$yAxis(axisLabel = 'Number of Dead or Alive', width=55)
      p4$xAxis(axisLabel = 'Culture by Hosue Allegiance')
      #p4$legend(rotateLabels=-45)
      ##
      return(p4)
    })
    #### Plot 5 ####
    #output$plot5 <- renderChart({
      ###
      ###
    #})
    #### THE END OF PLOTS
    } # End input output function
)