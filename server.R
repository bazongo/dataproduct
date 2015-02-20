#Load shiny library
library(shiny)
#Define gag function that predict 
gag <- function(age)
{
  #Load GAGurine data available in R datasets 
  data(GAGurine,package="MASS")
  #Begin the ui.R application
  reg=lm(GAG~log(Age+0.02),data=GAGurine)
  summary(reg)
  newage=data.frame(Age = age)
  predict(reg, newage)
}
  
shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$age})
    output$prediction <- renderPrint({gag(input$age)})
  }
)