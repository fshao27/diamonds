library(shiny)
library(ggplot2)

# GUI

ui <- fluidPage(
  titlePanel("Diamonds Data"),
  sidebarLayout(
    sidebarPanel(
      helpText("This app is to visualize diamonds dataset"),
      textInput(inputId = "title", 
                label = "Chart title", 
                value = ""),
      #  dropdown menu widget
      selectInput(inputId = "pos",
                  label = "Position",
                  choices = list("stack", "dodge"),
                  selected = "stack")  # default is "stack"
    ),
    mainPanel(
      plotOutput(outputId = "plot")
    )
  )
)



# Server - make the connections between input and output in this step

server <- function(input, output) 
{
  output$plot = renderPlot({
    ggplot(diamonds, aes(x = cut, fill = clarity)) +
      geom_bar(position = input$pos) +  # connect the output with the input pos
      ggtitle(input$title)   # connect the output with the input title
  })
  
}

# Run the App
shinyApp(ui, server)



