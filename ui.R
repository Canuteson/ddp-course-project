library(shiny)

pageHeader <- h2("Regression to the Mean in Children's heights", align = "center")

pageSidePanel <- sidebarPanel(
    h3("This application predicts a child's height based on an input parent's height"),
    p("The prediction is based on a linear model fit from the Galton's Height Data set"),
    p("Select a parent's height using the slider below"),
    p(paste("You will receive a prediction of the child's height, as well as a histogram", 
            "the mean childrens' heights from Galton, the as well as the input parent's height,",
            "illustrating how childrens' heights tend to regress towards the mean childrens'", "
            height")),
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
