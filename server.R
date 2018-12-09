function(input, output){
  
  reactive({
    input$selection
  })
  
  output$plot <- renderPlot({
    if (input$selection == "coffee") {
      get_tweets("coffee")
      clean_tweets("coffee_tweets.csv")
      make_wordcloud("clean_coffee_tweets.csv")
    }
    if (input$selection == "starbucks") {
      get_tweets("starbucks")
      clean_tweets("starbucks_tweets.csv")
      make_wordcloud("clean_starbucks_tweets.csv")
    }
    if (input$selection == "dunkin") {
      get_tweets("dunkin")
      clean_tweets("dunkin_tweets.csv")
      make_wordcloud("clean_dunkin_tweets.csv")
    }
    if (input$selection == "shiru") {
      get_tweets("shiru")
      clean_tweets("shiru_tweets.csv")
      make_wordcloud("clean_shiru_tweets.csv")
    }
  })
}