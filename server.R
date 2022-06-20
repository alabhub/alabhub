library(shiny)
library(tidyverse)
library(gplots)
library(bslib)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlotly({

        # generate bins based on input$bins from ui.R
        
        #noe <- 0
        #p <- as.numeric(input$scale)
        #if (input$scale == 7) {noe <- 1}
        #if (input$scale == 6) {noe <- 2}
        #if (input$scale == 5) {noe <- 3}
        #if (input$scale == 4) {noe <- 4}
        #if (input$scale == 3) {noe <- 5}
        #if (input$scale == 2) {noe <- 6}
        #if (input$scale == 1) {noe <- 7}
        #nbr <- as.numeric(input$level)
        #nbr <- nbr/100
        #nbr <- nbr + ((p*0.1428571)-0.1428571)
        #Escala <- c(1, 0.8571429, 0.7142857, 0.5714286, 0.4285714, 0.2857143, 0.1428571)
        #LoE <- c(0,0,0,0,0,0,0)
        #dt <- cbind(Escala, LoE)
        #dt[noe,2] <- nbr
        
        df <- readxl::read_excel("C:\\Users\\hercu\\Downloads\\Evidenciometer\\Evidenciometer.xlsx")
        nbr <- df[input$var,5]
        nbr <- as.numeric(nbr)
        if (nbr >= 0 & nbr < 0.1428571) {noe <- 7}
        if (nbr > 0.1428571 & nbr < 0.2857143) {noe <- 6}
        if (nbr > 0.2857143 & nbr < 0.4285714) {noe <- 5}
        if (nbr > 0.4285714 & nbr < 0.5714286) {noe <- 4}
        if (nbr > 0.5714286 & nbr < 0.7142857) {noe <- 3}
        if (nbr > 0.7142857 & nbr < 0.8571429) {noe <- 2}
        if (nbr > 0.8571429 & nbr <= 1) {noe <- 1}
        Escala <- c(1, 0.8571429, 0.7142857, 0.5714286, 0.4285714, 0.2857143, 0.1428571)
        Evidencia <- c(0,0,0,0,0,0,0)
        dt <- cbind(Escala, Evidencia)
        dt[noe,2] <- nbr
        
        plot_ly(x = c("Escala", "Evidencia"), 
                y = Escala, 
                z = dt, 
                type = "heatmap", 
                colors = RColorBrewer::brewer.pal(7, 'BuGn'))
        
        #heatmap.2(dt, Rowv = NULL, Colv = NULL, 
                  #cexCol = 1.5, colCol =  "black",
                  #keysize = 1.5, key.title = "Escala", 
                  #key.xlab = "Nivel", key.ylab = " ",
                  #vline = NULL, tracecol = "black", 
                  #col = RColorBrewer::brewer.pal(7, 'BuGn'),
                  #cellnote = round(dt, 2),
                  #notecol = "black", 
                  #margins = c(8,8), 
                  #notecex = 1.5, cexRow = 0.1, density.info = 'none')

    })

})