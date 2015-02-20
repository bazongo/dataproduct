#Load shiny library
library(shiny)
#Begin the ui.R application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Predict the level of GAG in child's urine given his age"),
    sidebarPanel(
      helpText("Note: This application is build to predict the concentration", 
               "of chemical GAG in the urine of child with his age",
               "as predictor. You are invited to provide a numeric",
              "value of age in the range 0-17 years and the application will",
            "predict the GAG. We applied linear model to GAGurine data to build the application"  ),
      numericInput('age', 'Age of child (year)', 0, min = 0, max = 17),
      submitButton('Submit')
      
    ),
    mainPanel(
      h3('Results of prediction'),
      h4('The age you entered is'),
      verbatimTextOutput("inputValue"),
      h4('The councentration of GAG predicted with the age above is'),
      verbatimTextOutput("prediction")
    )
  )
)
