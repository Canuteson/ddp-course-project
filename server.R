library(UsingR)
data(galton)
lmfit <- lm(child ~ parent, data = galton)

predictChild <- function(parentHeight) {
    parent <- parentHeight
    new_data <- data.frame(parent)
    predict(lmfit, newdata = data.frame(parent))
}

childmu <- mean(galton$child)

shinyServer(
    function(input, output) {
        pred <- reactive({as.numeric(predictChild(input$height))})
        output$inputValue <- renderPrint({input$height})
        output$prediction <- renderText({pred()})
        output$newHist <- renderPlot({
            hist(
                 galton$child, 
                 xlab = "Children's Heights", 
                 xlim = c(60,75),
                 col = 'lightblue', 
                 main='Height Distribution'
            )
            lines(c(input$height, input$height), c(0,200), col = 'blue', lwd=5)
            lines(c(childmu, childmu), c(0,200), col = 'green', lwd=5)
            lines(c(pred(), pred()), c(0, 200), col='red', lwd=5)
            legend("topright", c("Parent height", "Child Mean", "Predicted Height"), 
                   col=c("blue", "green", "red"), lwd=10)
        })
    }
)
