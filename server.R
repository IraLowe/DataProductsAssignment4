wt <- c(60.63,79.61,94.76,111.18,128.94,148.02,168.42,190.13)
ht<-  c(48,55,60,65,70,75,80,85)
mod1 <- data.frame(wt,ht)

wt2 <- c(81.94,107.57,128.02,150.25,174.25,200.04,227.60,256.93)
ht2<-  c(48,55,60,65,70,75,80,85)
mod3 <- data.frame(wt2,ht2)



shinyServer(
  function(input, output) {
    
    BMI <- reactive({
    
      (input$Weight/((input$Feet*12 + input$Inches)^2)) * 703
        
    })
    height <- reactive ({
      (input$Feet*12 + input$Inches)
    })
    
    output$inputValue <- renderPrint({BMI()})
    
  
    output$plot1   <- renderPlot({
       plot(1, type="n", xlab="height in inches", ylab="weight in pounds", main='Healthy Zone',
            sub='Above - over weight Below - under weight',
            xlim=c(48, 84), ylim=c(50, 350))
      abline(lm(wt~ht,data=mod1),col='blue')
      abline(lm(wt2~ht2,data=mod3),col='blue')
      points(x=height(),y=input$Weight, col='red',pch=19, cex= 2)
      
})
    } )    

