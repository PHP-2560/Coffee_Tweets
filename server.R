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
  
  output$plot2 <- renderPlot({
    
    if (input$words == "starbucks") {
      make_bar_graph("clean_starbucks_tweets.csv")
     } else if (input$words == "dunkin") {
        make_bar_graph("clean_dunkin_tweets.csv")
     } else if (input$words == "shiru"){
       make_bar_graph("clean_shiru_tweets.csv")
     } else {
       make_bar_graph("clean_coffee_tweets.csv")
    }
  })
  
}