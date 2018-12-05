runApp(
  
  ui = basicPage(
    h2('The twitter data'),
    dataTableOutput('mytable')
  ),
  
  server = function(input, output) {
    output$mytable = renderDataTable({
      mtcars
    })
  }
  )
