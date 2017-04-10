
library(shiny)
library(leaflet)
library(dplyr)

# ui.R

shinyUI(fluidPage(
        titlePanel("Russian Cinema Market Overview"),
        
        sidebarLayout(
                sidebarPanel(
                        
                        ## Adding controls
                        selectInput("Year", 
                                    label = "Choose a Year to display",
                                    choices = list(2014, 2015, 2016),
                                    selected = 2016),
                        
                        selectInput("Indicator", 
                                    label = "Choose a numerical indicator to display",
                                    choices = list("Revenue", "Tickets"),
                                    selected = "Revenue"),
                        
                        
                        sliderInput("ScaleFactor", 
                                    label = "Set up a scaling factor for visualisations",
                                    min = 1, max = 15, value = c(10)),
                        
                        
                        ## Adding documentation
                        helpText( "Read Me:", tags$br(),
                                 "Cinema market map visualisation ShinyApp visualizes Russian Cinema theaters performance:",tags$br(),
                                 "1. The user can select one of 3 years of statistics to visualise: 2014-2016",tags$br(),
                                 "2. The Cinema's circle area reflects one of 2 parameters for comparison: either revenue or # of tickets sold",tags$br(),
                                 "3. The Scaling factor slider allows to fine-tune visualisation by adjusting Circle's area calculation",tags$br(),
                                 "4. Circles color represent which network does the exact Cinema theater belongs to",tags$br(),
                                 "5. If you click the circle - you'll see the combined analytics for the exact Cinema",tags$br()
                                 )
                        
                        
                        ),
                
                mainPanel( 
                        leafletOutput("mymap"),
                        p()
                        
                        )
       
        
       
        
        )))
