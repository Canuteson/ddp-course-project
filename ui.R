library(shiny)

pageHeader <- h2("Regression to the Mean in Children's heights", align = "center")

pageSidePanel <- sidebarPanel(
    sliderInput('height', 'Parent Height, inches', value = 65, min = 60, max = 75, step = .1)
)

pageMainPanel <- mainPanel(
    h3("Child Height Prediction"),
    h4("Parent's Height:"),
    verbatimTextOutput("inputValue"),
    h4("Predicted child's height: "),
    verbatimTextOutput("prediction"),
    plotOutput('newHist'),
    br(),
    br(),
    h4("This application's code is OpenSource:"),
    p(a("View on Github", href="https://github.com/Canuteson/ddp-shiny-app"))
    
)

shinyUI(
    pageWithSidebar(
        headerPanel = pageHeader,
        sidebarPanel = pageSidePanel,
        mainPanel = pageMainPanel
    )
)
