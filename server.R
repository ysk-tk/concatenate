#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# # Define server logic required to draw a histogram
# shinyServer(function(input, output) {
# 
#     output$distPlot <- renderPlot({
# 
#         # generate bins based on input$bins from ui.R
#         x    <- faithful[, 2]
#         bins <- seq(min(x), max(x), length.out = input$bins + 1)
# 
#         # draw the histogram with the specified number of bins
#         hist(x, breaks = bins, col = 'darkgray', border = 'white')
# 
#     })
# 
# })

server <- function(input, output, session) {
    output$text <- renderText({
        N <- as.integer(input$N)
        M <- as.integer(input$M)
        m <- M-1
        text = vector()
        
        for (i in N:m){
            T <- paste (i, "OR", sep = " ")
            text <- paste (text, T, sep = " ")
        }
        
        text <- paste (text, M, sep = " ")
        text <- paste (text, ":", sep = "")})

    
    autoInvalidate <- reactiveTimer(10000)
    observe({
        autoInvalidate()
        cat(".")
    })
        
}
