function(input, output){
  
  reactive({
    input$selection1
    input$selection2
  })
  
  get_tweets("coffee")
  clean_tweets("coffee_tweets.csv")

  get_tweets("starbucks")
  clean_tweets("starbucks_tweets.csv")

  get_tweets("dunkin")
  clean_tweets("dunkin_tweets.csv")

  get_tweets("shiru")
  clean_tweets("shiru_tweets.csv")
  
  output$table1 <- DT::renderDataTable({
    DT::datatable(read.csv("coffee_tweets.csv")[1:2])
  })
  output$table2 <- DT::renderDataTable({
    DT::datatable(read.csv("starbucks_tweets.csv")[1:2])
  })
  output$table3 <- DT::renderDataTable({
    DT::datatable(read.csv("dunkin_tweets.csv")[1:2])
  })
  output$table4 <- DT::renderDataTable({
    DT::datatable(read.csv("shiru_tweets.csv")[1:2])
  })
  
  output$plot1 <- renderPlot({
    if (input$selection1 == "coffee") {
      make_wordcloud("clean_coffee_tweets.csv")
    }
    if (input$selection1 == "starbucks") {
      make_wordcloud("clean_starbucks_tweets.csv")
    }
    if (input$selection1 == "dunkin") {
      make_wordcloud("clean_dunkin_tweets.csv")
    }
    if (input$selection1 == "shiru") {
      make_wordcloud("clean_shiru_tweets.csv")
    }
  })
  
  output$plot2 <- renderPlot({
    if (input$selection2 == "coffee") {
      make_wordcloud("clean_coffee_tweets.csv")
    }
    if (input$selection2 == "starbucks") {
      make_wordcloud("clean_starbucks_tweets.csv")
    }
    if (input$selection2 == "dunkin") {
      make_wordcloud("clean_dunkin_tweets.csv")
    }
    if (input$selection2 == "shiru") {
      make_wordcloud("clean_shiru_tweets.csv")
    }
  })
  
}