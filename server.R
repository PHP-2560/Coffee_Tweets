function(input, output){
  
  selection <- reactive({
    input$selection
  })
  
  output$plot <- renderPlot({
    if (selection == "starbucks") {
      get_tweets("starbucks")
      clean_tweets("starbucks_tweets.csv")
      make_wordcloud("clean_starbucks_tweets.csv")
    }
    if (selection == "coffee") {
      get_tweets("coffee")
      clean_tweets("coffee_tweets.csv")
      make_wordcloud("clean_coffee_tweets.csv")
    }
  })
}