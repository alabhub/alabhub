library(shiny)
library(tidyverse)
library(gplots)
library(bslib)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel(" "), 
    theme = bslib::bs_theme(bootswatch = "lux"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(img(src = "labhub.png", height = 120, width = 240),
                     h5("Seletor de alegacao"),
            #sliderInput(inputId = "scale", label = h5("Escala de evidencia (1-7):"), min = 1, max = 7, value = 1, step = 1),
            #sliderInput(inputId = "level", label = h5("Nivel de evidencia (0-14):"), min = 0, max = 14, value = 0, step = 1),
            
            selectInput(inputId = "var", 
                        label = h6("Selecione:"),
                        choices = c("Alegacao 1" = 1, 
                                    "Alegacao 2" = 2, 
                                    "Alegacao 3" = 3, 
                                    "Alegacao 4" = 4, 
                                    "Alegacao 5" = 5), 
                        selected = c("Alegacao 1" = 1))
        ),

        # Show a plot of the generated distribution
        mainPanel(
          h4("Seja bem-vindo(a) ao EVIDENCIOMETRO!"),
          p(""),
          strong("O projeto", span("EVIDENCIOMETRO", style = "color:black"), "e uma 
            iniciativa do", span("Squad 2 do Health Lab IBMR.", style = "color:black")), 
          p(""),
          strong("Para usar a ferramenta, basta selecionar 
                 as alegacoes no", span("menu a esqueda", style = "color:black"), 
                 "e observar o nivel de evidencia no", 
                 span("grafico abaixo.", style = "color:black")), 
          p(""),
          strong("Numeros mais", span("proximos de 0", style = "color:red"), 
          "significam", span("baixo nivel de evidencia,", style = "color:red"), 
          "enquanto numeros mais", span("proximos de 1", style = "color:blue"), 
          "significam", span("elevado nivel de evidencia.", style = "color:blue"), 
          span("Experimente!", style = "color:black")),
            
          plotlyOutput("distPlot")
        )
    )
))
