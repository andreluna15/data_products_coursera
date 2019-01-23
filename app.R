library(shiny)



  ui <- fluidPage(

               sidebarPanel(
                 numericInput("inc", "Expected Income:", value = 8000),
                 numericInput("exp", "Expected Expenses:", value = 5000),
                 sliderInput("slider", "Inteded Savings Rate:", 0.1, 1, 0.3)

               ),
               mainPanel(

                            h2("Savings Calculator"),
                            h3("Instructions:"),
                            h6("The app calculates the amount to be saved by multiplying the inteded savings rate and the available income, after deducing expected expenses."),
                            h6("Use the text box on the left to inset the expected income and expenses of the period."),
                            h6("Use the slider to set the savings rate."),
                            h5("Income:",  fluidRow(column(3, verbatimTextOutput("value1")))),
                            h5("Expenses:",  fluidRow(column(3, verbatimTextOutput("value2")))),
                            h5("Savings:", fluidRow(column(3, verbatimTextOutput("slider")))),
                            h3("Savings this period:", verbatimTextOutput("txtout"))

                        )
                 )

  server = function(input, output) {
    output$value1 <- renderPrint({ input$inc })
    output$value2 <- renderPrint({ input$exp })
    output$slider <- renderPrint({ input$slider })
    output$txtout <- renderText({ paste("(", input$inc, "-", input$exp, ")", "*", input$slider, "=", (input$inc - input$exp)*input$slider) })
      
  }

  shinyApp(ui = ui, server = server)