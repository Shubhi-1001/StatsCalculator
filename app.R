library(shiny)
library(ggplot2)

# UI for the Shiny app
ui <- fluidPage(
  titlePanel("Critical Region Visualization Z test"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        "alpha",
        "Level of Significance (α):",
        min = 0.01,
        max = 0.1,
        value = 0.05,
        step = 0.005
      ),
      radioButtons(
        "test_type",
        "Type of Test:",
        choices = list(
          "Right-tailed" = "right",
          "Left-tailed" = "left",
          "Two-tailed" = "two"
        ),
        selected = "two"
      )
    ),
    
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Server logic for the Shiny app
server <- function(input, output) {
  output$distPlot <- renderPlot({
    alpha <- input$alpha
    test_type <- input$test_type
    
    x <- seq(-4, 4, length.out = 1000)
    y <- dnorm(x)
    
    df <- data.frame(x = x, y = y)
    
    # Initialize critical region layers
    critical_layer <- NULL
    critical_layer_right <- NULL
    vline <- NULL
    annotation <- NULL
    
    # Determine critical points based on test type
    if (test_type == "right") {
      critical_value <- qnorm(1 - alpha)
      # df$critical <- ifelse(df$x >= critical_value, df$y, NA)
      vline <- geom_vline(xintercept = critical_value, color = "red", linetype = "dashed", size = 0.5)
      annotation <- annotate("text", x = critical_value- 0.2, y = -0.05, label = paste(round(critical_value, 3)), color = "red",size=5)
      critical_layer <- geom_area(data = subset(df, x >= critical_value), aes(y = y), fill = "red", alpha = 0.5)
    } else if (test_type == "left") {
      critical_value <- qnorm(alpha)
      # df$critical <- ifelse(df$x <= critical_value, df$y, NA)
      vline <- geom_vline(xintercept = critical_value, color = "red", linetype = "dashed", size = 0.5)
      annotation <- annotate("text", x = critical_value+0.2, y = -0.05, label = paste(round(critical_value, 3)), color = "red",size=5)
      critical_layer <- geom_area(data = subset(df, x <= critical_value), aes(y = y), fill = "red", alpha = 0.5)
    } else {
      critical_value_left <- qnorm(alpha / 2)
      critical_value_right <- qnorm(1 - alpha / 2)
      # df$critical_left <- ifelse(df$x <= critical_value_left, df$y, NA)
      # df$critical_right <- ifelse(df$x >= critical_value_right, df$y, NA)
      vline <- list(
        geom_vline(xintercept = critical_value_left, color = "red", linetype = "dashed", size = 0.5),
        geom_vline(xintercept = critical_value_right, color = "red", linetype = "dashed", size = 0.5)
      )
      annotation <- list(
        annotate("text", x = critical_value_left + 0.2, y = -0.05, label = paste(round(critical_value_left, 3)), color = "red",size=5),
        annotate("text", x = critical_value_right - 0.2, y = -0.05, label = paste(round(critical_value_right, 3)), color = "red",size=5)
      )
      critical_layer <- geom_area(data = subset(df, x <= critical_value_left), aes(y = y), fill = "red", alpha = 0.5)
      critical_layer_right <- geom_area(data = subset(df, x >= critical_value_right), aes(y = y), fill = "red", alpha = 0.5)
    }
    
    # Create the plot
    p <- ggplot(df, aes(x = x, y = y)) +
      geom_line(size = 1, color = "black") +
      labs(title = "Standard Normal Distribution",
           x = "Z", y = "Density") +
      theme_minimal()
    
    # Add layers dynamically
    p + critical_layer + critical_layer_right + vline + annotation
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
