#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Let's Plot!"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            fileInput("file1", "Choose a CSV File",
                      accept = c(
                          "text/csv",
                          "text/comma-separated-values,text/plain",
                          ".csv")),
            tags$hr(),
            checkboxInput("header", "Header", TRUE),uiOutput("selectorX"),
            uiOutput("selectorY"),actionButton("done","Plot!")),
        
        # Show a plot of the generated distribution
        mainPanel(
            #textOutput("contents"))
        plotlyOutput("plot1",height = "80%"))
    )
))
