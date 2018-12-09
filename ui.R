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
    tabPanel("Word Cloud"),
    tabPanel("xx"),
    tabPanel("xx")
    )
  )
)