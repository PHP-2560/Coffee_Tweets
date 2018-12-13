source("check_packages.R")
check_packages(c("shiny", "shinythemes", "ggplot2", "devtools", "twitteR", "base64enc", "httr", "DT", "rmarkdown"))
install_github("PHP-2560/r-package-aes/coffee")
library(coffee)
library(wordcloud2)

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
              helpText('You will begin by selecting one of the words listed below. Our app will find the top 500 tweets capturing that specific word. The WordCloud displayed to the right will display the most frequent words corresponding to those specific tweets. This app also allows you to choose how many words you would like shown in the word cloud.'),
              hr(),
              selectInput("selection", "Choose a Word:", choices = c("coffee","starbucks", "dunkin", "shiru")),
            # Sidebar with a slider and selection inputs
            sliderInput("num",
              "Number of Words:",
              min = 1,  max = 100,  value = 50)
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
                helpText('You will begin by selecting one of the words listed below. Our app will find the top 500 tweets capturing that specific word. The Bar Graph displayed to the right will display the proportion of words that are positive vs. negative for the tweets found capturing the word you chose.'),
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
              helpText('You will begin by selecting one of the words listed below. Our app will find the top 500 tweets capturing that specific word. The Emotions Sentiment Graph displayed to the right will display both word counts that contribute to each sentiment by viewing the top 10 words for each sentiment. Some sentiments have more than 10 words, due to their being a tie in the amount of words per sentiment.'),
              hr(),
              selectInput("item", "Choose a Word:", choices = c("coffee","starbucks", "dunkin", "shiru"))
              
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

  
