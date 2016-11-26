
# Based on diamond data set from the UsingR package. 
# The data is diamond prices (in Singapore dollars) and diamond weight in carats. 
# Carats are a standard measure of diamond mass, 0.2 grams. 
# We will predict the price for the diamond based on the Carat Mass

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Predict Diamonds Price based On Weight"),

  # Sidebar with a slider input for Carats
  sidebarLayout(
    sidebarPanel(
      h2("Instructions"),
      p("Using a diamond data which contains Price based on Carat. A Linear model is created
         to predict any price for a given diamond mass in carats.
         Diamond prices  are in USD dollars and diamond weight in carats. 
         Carats are a standard measure of diamond mass, 0.2 grams."),
      sliderInput("carats",
                  "Select Diamond MASS in Carats:",
                  min = 0.10,
                  max = 1.5,
                  value = 0.15)
    ),

    # Show a plot with the data for the prediction model
    mainPanel(
      h3("Price in USD Calculated "),
      h2(textOutput("pricePrediction")),
      plotOutput("dimondDataPlot")
      
    )
  )
))
