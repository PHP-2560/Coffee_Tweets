check_packages(c("shiny", "shinythemes", "ggplot2", "devtools", "twitteR", "base64enc", "DT"))
install_github("PHP-2560/r-package-aes/coffee")
library(coffee)

ui <- dget("ui.R")
server <- dget("server.R")
shinyApp(ui = ui, server = server)