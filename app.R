library(shiny)



  ui <- fluidPage(

               sidebarPanel(
                 numericInput("inc", "Expected Income:", value = 8000),
                 numericInput("exp", "Expected Expenses:", value = 5000),
                 sliderInput("slider", "Inteded Savings Rate:", 0.1, 1, 0.3)

               ),
               mainPanel(

                            h2("Savings Calculator"),
                            h4("Income:",  fluidRow(column(3, verbatimTextOutput("value1")))),
                            h4("Expenses:",  fluidRow(column(3, verbatimTextOutput("value2")))),
                            h4("Savings:", fluidRow(column(3, verbatimTextOutput("slider")))),
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