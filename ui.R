shinyUI( pageWithSidebar(
  # Application title
  headerPanel("BMI Calculation"),
  sidebarPanel(
    numericInput('Weight', 'Weight in Pounds', 0, min = 100, max = 350, step = 5
    ),           
    
    numericInput('Feet', 'Height in Feet', 0, min = 4, max = 6, step = 1
  ),
  numericInput('Inches', 'Height in Inches', 0, min = 0, max = 12, step = 1
  ),
  
  submitButton('Submit') ),
  mainPanel(
    plotOutput('plot1'),
    h3('BMI Value'),
    textOutput("inputValue")
)
)
)
