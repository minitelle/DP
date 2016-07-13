# I Read battles files
battles <- read.csv("https://raw.githubusercontent.com/minitelle/DP/master/project/game-of-thrones/battles.csv", header=TRUE, stringsAsFactors=TRUE, na.strings=c("NA", " ", ""))

# II Read got deaths
got_deaths <- read.csv("https://raw.githubusercontent.com/minitelle/DP/master/project/game-of-thrones/character-deaths.csv", header=TRUE, stringsAsFactors=TRUE, na.strings=c("NA", " ", ""))
##Fix allegiances column and remove the value "House"
got_deaths$Allegiances <- gsub("^House ","",got_deaths$Allegiances)

# III Read got predict
got_predict <- read.csv("https://raw.githubusercontent.com/minitelle/DP/master/project/game-of-thrones/character-predictions.csv", header=TRUE, stringsAsFactors=TRUE, na.strings=c("NA", " ", ""))
  ##Fix allegiances column and remove the value "House"
  got_predict$house <- gsub("^House ","",got_predict$house)
  ## Fix culture values with captial letters
  got_predict$culture <- gsub("(?<=\\b)([a-z])", "\\U\\1", tolower(got_predict$culture), perl=TRUE)
  ## Combine culture values
  got_predict$culture[got_predict$culture=="Dorn"] <- "Dornish"
  got_predict$culture[got_predict$culture=="Riverman"] <- "Rivermen"
  got_predict$culture[got_predict$culture=="Riverlands"] <- "Rivermen"
  got_predict$culture[got_predict$culture=="Ironman"] <- "Ironborn"
  got_predict$culture[got_predict$culture=="Ironmen"] <- "Ironborn"
  got_predict$culture[got_predict$culture=="Wildling"] <- "Wildlings"
  got_predict$culture[got_predict$culture=="Andals"] <- "Andals"
  got_predict$culture[got_predict$culture=="Asshai'I"] <- "Asshai"
  got_predict$culture[got_predict$culture=="Braavos"] <- "Braavosi"
  got_predict$culture[got_predict$culture=="Meereen"] <- "Meereenese"
  got_predict$culture[got_predict$culture=="Westerman"] <- "Westermen"
  got_predict$culture[got_predict$culture=="Westerlands"] <- "Westermen"
  got_predict$culture[got_predict$culture=="Reach"] <- "Reachmen"
  got_predict$culture[got_predict$culture=="The Reach"] <- "Reachmen"
  got_predict$culture[got_predict$culture=="Summer Islander"] <- "Summer Isles"
  got_predict$culture[got_predict$culture=="Summer Islands"] <- "Summer Isles"
  got_predict$culture[got_predict$culture=="Ghiscaricari"] <- "Ghiscari"
  got_predict$culture[got_predict$culture=="Astapor"] <- "Astapori"
  got_predict$culture[got_predict$culture=="Qarth"] <- "Qartheen"
  got_predict$culture[got_predict$culture=="Lhazarene"] <- "Lhazareen"
  got_predict$culture[got_predict$culture=="Norvos"] <- "Norvoshi"
  got_predict$culture[got_predict$culture=="Stormlands"] <- "Stormlander"
  got_predict$culture[got_predict$culture=="Vale"] <- "Valemen"
  got_predict$culture[got_predict$culture=="Vale Mountain Clans"] <- "Valemen"
  