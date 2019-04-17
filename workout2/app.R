#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(reshape)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   fluidRow(
     column(4, 
         sliderInput("initial_amount",
                     "Initial Amount",
                     min = 1,
                     max = 100000,
                     value = 1000),
         sliderInput("return_rate",
                     "Return Rate",
                     min = 0,
                     max = .2,
                     value = .05)
     ),
     column(4,
         sliderInput("years",
                     "Years",
                     min = 1,
                     max = 50,
                     value = 20),
         sliderInput("annual_contribution",
                     "Annual Contribution",
                     min = 1,
                     max = 50000,
                     value = 2000)
     ),
     column(4,
         sliderInput("growth_rate",
                     "Growth Rate",
                     min = 0,
                     max = .2,
                     value = .02),
         selectInput("facet",
                     "Facet",
                     c("Yes", "No"),
                     selected = "No"
                     )
     )
    ),
   
   plotOutput("timelines"),
   dataTableOutput("balances")
   
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  future_value <- function(amount, rate, years) {
    return(amount * (1 + rate) ^ years)
  }
  
  annuity <- function(contrib, rate, years) {
    return(contrib * ((1 + rate) ^ years - 1) / rate)
  }
  
  growing_annuity <- function(contrib, rate, growth, years) {
    num <- (1 + rate) ^ years - (1 + growth) ^ years
    den <- rate - growth
    return(contrib * num / den)
  }
  
  output$balances <- renderDataTable({
    
    modalities <- data.frame(year=0:input$years)
    modalities$no_contrib = future_value(input$initial_amount, input$return_rate, modalities$year)
    modalities$fixed_contrib = future_value(input$initial_amount, input$return_rate, modalities$year) + 
      annuity(input$annual_contribution, input$return_rate, modalities$year)
    modalities$growing_contrib = future_value(input$initial_amount, input$return_rate, modalities$year) +
      growing_annuity(input$annual_contribution, input$return_rate, input$growth_rate, modalities$year)
    
    modalities
  })
  
   
  output$timelines <- renderPlot({
    
    modalities <- data.frame(year=0:input$years)
    modalities$no_contrib = future_value(input$initial_amount, input$return_rate, modalities$year)
    modalities$fixed_contrib = future_value(input$initial_amount, input$return_rate, modalities$year) + 
      annuity(input$annual_contribution, input$return_rate, modalities$year)
    modalities$growing_contrib = future_value(input$initial_amount, input$return_rate, modalities$year) +
      growing_annuity(input$annual_contribution, input$return_rate, input$growth_rate, modalities$year)
    
    if (input$facet == "Yes") {
      modalities <- melt(modalities, c("year"))
      
      ggplot(modalities, aes(year)) + 
        geom_line(aes(y = value)) +
        geom_area(aes(y = value)) +
        facet_wrap(modalities$variable) +
        labs(title = "Three modes of investing", x = "year", y = "value")
    } else {
      ggplot(modalities, aes(year)) + 
        geom_line(aes(y = no_contrib, colour = "no_contrib")) + 
        geom_line(aes(y = fixed_contrib, colour = "fixed_contrib")) +
        geom_line(aes(y = growing_contrib, colour = "growing_contrib")) +
        labs(title = "Three modes of investing", x = "year", y = "value")
    }
    
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

