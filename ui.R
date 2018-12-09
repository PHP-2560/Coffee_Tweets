navbarPage(
  theme = shinytheme("cosmo"),
  collapsible = FALSE,
  fluid = TRUE,
  "Sentiment Analysis of Coffee Tweets",
  id ="main", 
  tabPanel("About", p("What can this app be used for?"),
           p(  "*       Our application can be used to determine and compare the sentiments of different coffee shops around the world."),
           
           p("How can we use this app?"),
           
           p("*"),
           
           p("*"),
           
           p("*"),
           
           p("*")),
  tabPanel("Table"),
  tabPanel("Graphs",  tabsetPanel(
    tabPanel("Word Cloud", 
             fluidPage(
      # Application title
               titlePanel("Word Cloud"),
               sidebarLayout(
        # Sidebar with a slider and selection inputs
        sidebarPanel(
          selectInput("selection", "Choose a Word:", choices = c("coffee","starbucks", "dunkin", "shiru")),
          hr(),
          sliderInput("max",
                      "Maximum Number of Words:",
                      min = 1,  max = 50,  value = 50)
        ),
        
        # Show Word Cloud
        mainPanel(
          plotOutput("plot")
        )
      )
    )),
    tabPanel("Bar Graph"),
    tabPanel("xx")
    )
  )
)