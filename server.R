#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(dplyr)

FFF <- readRDS("CCC.RDS")

# Define server logic required to draw a map with leaflet  and reactive calculations
shinyServer(function(input, output) {
   
 
       
        
        output$mymap <- renderLeaflet({
               
                EEE <- FFF %>% filter(Year==input$Year) 
                ValueToShow <- EEE [[input$Indicator]]
                
                # Mapping Revenue
                
                factpal <- colorFactor(rainbow(8), FFF$TopCircuitName)
                
                leaflet(EEE) %>%        addProviderTiles("CartoDB.Positron") %>%
                        addCircles(
                                lng = ~Lon, 
                                lat = ~Lat, 
                                weight = 1,
                                radius = ~sqrt(ValueToShow)/input$ScaleFactor,  ## Scaling circles area
                                popup = ~ paste("<b>", Name,"</b>",             ## Adding info to popup balloon
                                                "<br />  Revenue,m =", 
                                                round(Revenue/10^6, digits = 0),   ## Adding info to popup balloon
                                                "<br /> Tickets, ths = ", 
                                                round(Tickets/10^3, digits = 0),
                                                "<br /> Average price, RUR = ",
                                                round(Revenue/Tickets, digits = 0)), ## Adding info to popup balloon
                                color = ~factpal(TopCircuitName),
                                opacity = 0.95
                        ) %>%
                        
                        addLegend(pal = factpal, values = ~TopCircuitName, opacity = 1) %>%
                        setView(lat = 55.74, lng = 37.67, zoom = 10) ## Setting center of map to Moscow
                
        
  })
  
})
