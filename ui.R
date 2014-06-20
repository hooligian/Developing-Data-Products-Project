shinyUI(fluidPage(
      #Title
      titlePanel("State Facts"),
      
      sidebarLayout(
            sidebarPanel(
                  
                  #User input to select the region they want to look at
                  selectInput("region","Select Region(s):",
                              c("Northeast",
                                "South",
                                "North Central",
                                "West")
                  )
            ),
            
      
      
            mainPanel(
                  tabsetPanel(type = "tabs",
                              
                        #Create tabs for all of the different measures that the user can look at
                        tabPanel("Population", plotOutput("pop")),
                        tabPanel("Income", plotOutput("inc")),
                        tabPanel("Illiteracy", plotOutput("ill")),
                        tabPanel("Life Expectancy", plotOutput("le")),
                        tabPanel("Murder", plotOutput("mur")),
                        tabPanel("High School Grads", plotOutput("hsg")),
                        tabPanel("Frost", plotOutput("frost")),
                        tabPanel("Area", plotOutput("area"))
                  )
            )
      )
))