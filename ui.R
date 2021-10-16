semanticPage(
  title = "Vessel Dashboard",

  header(),
  br(),
  
  div(class = "ui container grid", style="margin-left:0px;",
      div(class = "row",
          div(class = "column",
              segment(class = "raised segment",
                      selectFilterUI("filter")
              ))),
      
      div(class='ui cards',
          div(class = "ui card", style="margin-right:10px; margin-left:15px;height:100%;background-color:#f0f0f0",
              div(class = "content",
                  div(class = "header", icon("info", style="height:30px;width:30px;"), "Informations"),
                  segment(class = "ui segment", 
                          uiOutput("info"))
                  
                  )),
              
          # uiOutput("info"),
          div(class = "ui card", 
              style="padding-left:0px; padding-right:0px;background-color:#f0f0f0;height:100%;width:800px;",
              div(class = "content", 
                  h3("Longest distance between two consecutive observations")), 
              segment(class = "ui segment", 
                      style = "margin-top:0px;height:90%",
                      textOutput(outputId = "distance"),
                      br(),
                      leafletOutput("map", height = 400))
          )
      )
  )

 )














# div(style="display: inline-block;vertical-align:top;",
#     shiny.semantic::selectInput(inputId = "vessel_type", label = "Vessel type:",
#                                choices = unique(df$ship_type) %>% sort(),
#                                selectize = TRUE, multiple = FALSE, width = "300px")),
#   
#   
# div(style="display: inline-block;vertical-align:top;",
#     shiny.semantic::selectInput(inputId = "vessel_name", label = "Name:",
#                                choices = '',
#                                selectize = TRUE, multiple = FALSE, width = "300px"))

# observationSelectorUI("column")
