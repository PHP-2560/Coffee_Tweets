source("check_packages.R")
check_packages(c("shiny", "shinythemes", "ggplot2", "devtools", "twitteR", "base64enc", "httr", "DT", "rmarkdown", "wordcloud2"))
install_github("PHP-2560/final-project-coffee/coffee")
library(coffee)

navbarPage(
  theme = shinytheme("cosmo"),
  collapsible = FALSE,
  fluid = TRUE,
  "Sentiment Analysis of Coffee Tweets",
  id ="main", 
  tabPanel("About", includeMarkdown("Markdown.Rmd")
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
        #Tabs for data tables of original tweets
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
        titlePanel("Word Cloud"),
          sidebarLayout(
            sidebarPanel(
              helpText('You will begin by selecting one of the words listed below. Our app will find the top 500 tweets capturing that specific word. The Word Cloud displays the most frequent words occurring within those specific tweets. You can also choose how many words you would like shown in the word cloud.'),
              hr(),
              selectInput("selection", "Choose a Word:", choices = c("coffee","starbucks", "dunkin", "shiru")),
            # Sidebar with a slider and selection inputs
            sliderInput("num",
              "Number of Words:",
              min = 0,  max = 100,  value = 50)
            ),
            #Show Word Cloud
            mainPanel(
              wordcloud2Output("plot1")
            )
          )
        )
      ),
    tabPanel("Bar Graph",
      fluidPage(
      #Application title
         titlePanel("Bar Graph"),
           sidebarLayout(
             #Sidebar with a slide and selection inputs
              sidebarPanel(
                helpText('You will begin by selecting one of the words listed below. Our app will find the top 500 tweets capturing that specific word. The Bar Graph displays the number of words that are positive and negative for the tweets found capturing the word.'),
                hr(),
                selectInput("word", "Choose a Word:", choices = c("coffee","starbucks", "dunkin", "shiru"))
              ),
              # Show Bar Plot
              mainPanel (
                plotOutput("plot2")
              )
            )
          )
      ),
    tabPanel("Emotions Category Graph",
       fluidPage(
         #Application title
         titlePanel("Emotions Graph"),
          sidebarLayout(
            #Sidebar with a slide and selection inputs
            sidebarPanel(
              helpText('You will begin by selecting one of the words listed below. Our app will find the top 500 tweets capturing that specific word. The Emotions Sentiment Graph displays the top sentiments expressed by the tweets, and the frequency of the words that contribute most to each sentiment.'),
              hr(),
              selectInput("item", "Choose a Word:", choices = c("coffee","starbucks", "dunkin", "shiru"))
              
              ),
            # Show Emotions Plot
              mainPanel (
                plotOutput("plot3")
              )
            )
          )
        )
      )
    )
)

  
