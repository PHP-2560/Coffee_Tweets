function(input, output){
  
  reactive({
    input$selection
  })
  
  get_tweets("coffee")
  clean_tweets("coffee_tweets.csv")

  get_tweets("starbucks")
  clean_tweets("starbucks_tweets.csv")

  get_tweets("dunkin")
  clean_tweets("dunkin_tweets.csv")

  get_tweets("shiru")
  clean_tweets("shiru_tweets.csv")
  
  output$plot <- renderPlot({
    if (input$selection == "coffee") {
      make_wordcloud("clean_coffee_tweets.csv")
    }
    if (input$selection == "starbucks") {
      make_wordcloud("clean_starbucks_tweets.csv")
    }
    if (input$selection == "dunkin") {
      make_wordcloud("clean_dunkin_tweets.csv")
    }
    if (input$selection == "shiru") {
      make_wordcloud("clean_shiru_tweets.csv")
    }
  })
}