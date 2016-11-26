
# This is the server logic for a Shiny web application.

library(shiny)
library(UsingR)
library(ggplot2)

shinyServer(function(input, output) {

  output$dimondDataPlot <- renderPlot({

        
          #First, let’s fit the linear regression model. 
          fit <- lm(price*0.7 ~ carat, data = diamond)
          
          
          #Now, let’s predicting the price of a diamond. 
          newx <- c(input$carats)
          pricePredicted <- predict(fit, newdata = data.frame(carat = newx))
                    
          
    #Lets Plot data
    data(diamond)
    g = ggplot(diamond, aes(x = carat, y = price*0.7))
    g = g + xlab("Mass (carats)")
    g = g + ylab("Price (USD $)")
    g = g + geom_point(size = 3, colour = "black", alpha=0.5)
    g = g + geom_point(size = 5, colour = "blue", alpha=0.2)
    g = g + geom_smooth(method = "lm", colour = "black")
    g = g + geom_vline(xintercept = input$carats, label("C") )
    g = g + geom_hline(yintercept = pricePredicted[1] )
    g          
          
  })


  output$pricePrediction <- renderText({

          #First, let’s fit the linear regression model. 
          fit <- lm(price*0.7 ~ I(carat * 10), data = diamond)
          
          
          #Now, let’s predicting the price of a diamond. 
          newx <- c(input$carats)
          pricePredicted <- predict(fit, newdata = data.frame(carat = newx))
          pricePredicted[1]
  })
  
  
  
  
  
})
