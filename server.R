#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    data <- reactive({
        req(input$file1)
        inFile <- input$file1   
        
            table1<-read.csv(inFile$datapath, header = input$header)
            return(table1)
        
    })
    
    
    output$selectorX <- renderUI({
        selectInput("var1", "Select x-axis:", as.list(colnames(data()))) 
    })
    
    output$selectorY <- renderUI({
        selectInput("var2", "Select y-axis:", as.list(colnames(data()))) 
    })
    
    
    
    fun2<-observeEvent(input$done,{
        
        
            
            output$plot1 <- renderPlotly({
                
                 
                 dat1<-data()
                #xas<-paste("dat1$",input$var1,sep = "")
                #yas<-paste("dat1$",input$var2,sep = "")
                #g1<-paste(xas,yas)
                t<-paste(input$var1,input$var2,sep=" Vs ")
                g1<-ggplot(data(),aes_(as.name(input$var1),as.name(input$var2)))+geom_line(color="red")+xlab(input$var1)+ylab(input$var2)
                ggplotly(g1)
            #output$contents <- renderText(input$var1)
            })
            
    })
   
})  
     
    #output$text1<-renderText({
     #   fun2()
    #})


