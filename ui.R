source("check_packages.R")
check_packages(c("shiny", "shinythemes", "ggplot2", "devtools", "twitteR", "base64enc", "httr", "DT", "rmarkdown"))
install_github("PHP-2560/r-package-aes/coffee")
library(coffee)

navbarPage(
  theme = shinytheme("cosmo"),
  collapsible = FALSE,
  fluid = TRUE,
  "Sentiment Analysis of Coffee Tweets",
  id ="main", 
  tabPanel("About", p("What can this app be used for?"),
           includeMarkdown("Markdown.Rmd")
  ),
  tabPanel("Table",
    sidebarLayout(
      sidebarPanel(
        conditionalPanel(
          'input.dataset == "coffee"',
          helpText('Tweets including "coffee"')
               ),
        conditionalPanel(
          'input.dataset == "starbucks"',
          helpText('Tweets including "starbucks"')
        ),
        conditionalPanel(
          'input.dataset == "dunkin"',
          helpText('Tweets including "dunkin"')
        ),
        conditionalPanel(
          'input.dataset == "shiru"',
          helpText('Tweets including "shiru"')
        )
      ),
      mainPanel(
        tabsetPanel(
          id = 'dataset',
          tabPanel("coffee", DT::dataTableOutput("table1")),
          tabPanel("starbucks", DT::dataTableOutput("table2")),
          tabPanel("dunkin", DT::dataTableOutput("table3")),
          tabPanel("shiru", DT::dataTableOutput("table4"))
        )
      )
    )
  ),
  tabPanel("Graphs",  tabsetPanel(
    tabPanel("Word Cloud",
             fluidPage(
      # Application title
               titlePanel("Word Cloud"),
               sidebarLayout(
                 sidebarPanel(
                   selectInput("selection", "Choose a Word:", choices = c("coffee","starbucks", "dunkin", "shiru")),
                   hr(),
                   # Sidebar with a slider and selection inputs
                   sliderInput("num",
                               "Number of Words:",
                               min = 1,  max = 100,  value = 50)
                 ),
                 #Show Word Cloud
                 mainPanel(
                   plotOutput("plot1")
                 )
               )
             )),
    tabPanel("Bar Graph",
             fluidPage(
      #Application title
               titlePanel("Bar Graph"),
               sidebarLayout(
                 #Sidebar with a slide and selection inputs
                 sidebarPanel(
                   selectInput("word", "Choose a Word:", choices = c("coffee","starbucks", "dunkin", "shiru")),
                   hr()
                 ),
                 # Show Bar Plot
                 mainPanel (
                   plotOutput("plot2")
                 )
               )
             )),
    tabPanel("Emotions Category Graph",
             fluidPage(
               #Application title
               titlePanel("Emotions Graph"),
               sidebarLayout(
                 #Sidebar with a slide and selection inputs
                 sidebarPanel(
                   selectInput("item", "Choose a Word:", choices = c("coffee","starbucks", "dunkin", "shiru")),
                   hr()
                 ),
                 # Show Bar Plot
                 mainPanel (
                   plotOutput("plot3")
                 )
               )
             )
    )
  )
  )
)

  
