# ui.R
library(shiny)
library(plotly)
library(shinythemes)

shinyUI(navbarPage(
  "Electoral College", theme = shinytheme("slate"),
  # Create a tab panel for your map
  tabPanel(
    "Map",
    titlePanel(tags$h1("Electoral College Votes")),
    tags$audio(src = "Sneaky_Snitch.mp3", type = "audio/mp3", controls = NA),
    # Create sidebar layout
    sidebarLayout(

      # Side panel for controls
      sidebarPanel(
        tags$h2("This is a map of Electoral College votes"),

        # Input to select variable to map
        selectInput(
          "mapvar",
           label = "Variable to Map",
          choices = list(
            "Population" = "population",
            "Electoral Votes" = "votes",
            "Votes / Population" = "ratio"
          )
        )
      ),

      # Main panel: display plotly map
      mainPanel(
        plotlyOutput("map"),
        tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
        tags$div(class = "summary", checked = NA,
                 tags$p("This map shows the electoral college votes by states. The darker
                        the color, the higher the number of votes. California has 
                        the highest votes.")
                 ),
        tags$a(href = "https://www.archives.gov/federal-register/electoral-college/about.html",
               "for more information")
      )
    )
  ),
  tabPanel(
    "Scatter Plot",
    titlePanel("Electoral College Votes"),
    
    sidebarLayout(
      
      sidebarPanel(
        
        textInput("search", label = "Find a State", value = "")
      ),
      
      mainPanel(
        plotlyOutput("Scatter")
      )
    )
    
  )

  # Create a tabPanel to show your scatter plot
))
