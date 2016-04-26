library(shiny)


epochs <- list(
  list(
    data = 1,
    type = 0
  ),
  list(
    data = 2,
    type = 0
  ),
  list(
    data = 3,
    type = 0
  ),
  list(
    data = 4,
    type = 0
  )
)


# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(

  # Application title
  titlePanel("Check EEG"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    mainPanel(
      plotOutput("distPlot")
    ),
    sidebarPanel(
      sliderInput("epoch",
                  "Epoch:",
                  min = 1,
                  max = length(epochs),
                  value = 1,
                  step = 1),
      textOutput("statusText"),
      actionButton("skipButton", "Skip"),
      actionButton("yesButton", "Yes"),
      actionButton("noButton", "No")
    )
  )
))

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output, session) {

  output$distPlot <- renderPlot({
   plot(epochs[[input$epoch]]$data)
  })
  output$statusText <- renderText({
    sprintf("Epoch type: %i", epochs[[input$epoch]]$type )
  })

  observeEvent(input$skipButton, {
    updateSliderInput(session, "epoch", value=input$epoch+1)
  })
})

# Run the application
shinyApp(ui = ui, server = server)

