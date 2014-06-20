shinyServer(function(input, output) {

      #Combine states info dataframe with region info
      states <- cbind(state.x77,as.character(state.region))
      
      #Create dataframes for each region
      data.ne <- subset(states,states[,9]=="Northeast")
      data.s <- subset(states,states[,9]=="South")
      data.nc <- subset(states,states[,9]=="North Central")
      data.w <- subset(states,states[,9]=="West")

      #Reactive function to select region data frame based on user input
      indata <- reactive({
            switch(input$region,
                   "Northeast" = data.ne,
                   "South" = data.s,
                   "North Central" = data.nc,
                   "West" = data.w)
      })
      
      #Create histograms for each tab
      output$pop <- renderPlot({
            hist(as.numeric(indata()[,"Population"]), breaks=4, col="gray", border="blue", main="", xlab="Population")
      })
      output$inc <- renderPlot({
            hist(as.numeric(indata()[,"Income"]), breaks=4, col="gray", border="blue", main="", xlab="Income")
      })
      output$ill <- renderPlot({
            hist(as.numeric(indata()[,"Illiteracy"]), breaks=4, col="gray", border="blue", main="", xlab="Illiteracy")
      })
      output$le <- renderPlot({
            hist(as.numeric(indata()[,"Life Exp"]), breaks=4, col="gray", border="blue", main="", xlab="Life Expectancy")
      })
      output$mur <- renderPlot({
            hist(as.numeric(indata()[,"Murder"]), breaks=4, col="gray", border="blue", main="", xlab="Murders")
      })
      output$hsg <- renderPlot({
            hist(as.numeric(indata()[,"HS Grad"]), breaks=4, col="gray", border="blue", main="", xlab="High School Graduates")
      })
      output$frost <- renderPlot({
            hist(as.numeric(indata()[,"Frost"]), breaks=4, col="gray", border="blue", main="", xlab="Frost")
      })
      output$area <- renderPlot({
            hist(as.numeric(indata()[,"Area"]), breaks=4, col="gray", border="blue", main="", xlab="Area")
      })
      
})
      