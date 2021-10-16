function(input, output, session) {
  
  selectFilterServer("filter", df)
  
  selectedData <- datasetServer("filter")
  
  
  # Card info
  output$info <- renderUI({
    # div(class = "ui card five wide column", style="margin-right:10px; margin-left:15px;height:100%;background-color:#f0f0f0",
    #     div(class = "content",
    #         div(class = "header", icon("info", style="height:30px;width:30px;"), "Informations"),
            # div(class = "content", 
                    div(class = "description",
                        br(),
                        strong(selectedData()$SHIPNAME),
                        br(),
                        br(),
                        strong("Type: "), selectedData()$ship_type,
                        br(),
                        br(),
                        br(),
                        strong("Destination: "), ifelse(is.na(selectedData()$DESTINATION), "Not Available", selectedData()$DESTINATION),
                        br(),
                        br(),
                        br(),
                        strong("First AIS signal at: "), br(),
                        selectedData()$min_datetime %>% 
                          str_replace_all(c("T" = "   ", "Z" = "")), 
                        br(),
                        strong("Last AIS signal at: "), br(),
                        selectedData()$max_datetime %>% 
                          str_replace_all(c("T" = "   ", "Z" = "")), 
                        br(),
                        br(),
                        br(),
                        strong("Total Traveled Distance: "), selectedData()$total_distance, "m",
                        br(),
                        br(),
                        br(),
                        br()
                    )
        #     )
        # )
    # )
  })
  
  
  
  # Text output
  output$distance <- renderText({
    glue::glue("{vessel_name} sailed {distance} meters, from {start_dttm} to {end_dttm}",
               vessel_name = selectedData()$SHIPNAME,
               distance    = round(selectedData()$distance,0),
               start_dttm  = selectedData()$prevDATETIME %>% 
                               str_replace_all(c("T" = " at ", "Z" = "")),
               end_dttm    = selectedData()$DATETIME %>% 
                               str_replace_all(c("T" = " at ", "Z" = ""))
    )
  })
  
  
  # Map
  output$map <- renderLeaflet({
    leaflet(data = selectedData()) %>% 
      addTiles() %>%
      addMarkers(~prevLON, ~prevLAT, 
                 popup = ~paste0("Start", "<br>",
                                 "Latitude: ", prevLAT, "<br>",
                                 "Longitude: ", prevLON, "<br>"),
                 label = "Start", icon = shipIcon[1]) %>%
      addMarkers(~LON, ~LAT, 
                 popup = ~paste0("End", "<br>",
                                 "Latitude: ", LAT, "<br>",
                                 "Longitude: ", LON, "<br>"),
                 label = "End")  %>% 
      addPolylines(lat = selectedData()[, c("prevLAT", "LAT")] %>% as.numeric(),
                   lng = selectedData()[, c("prevLON", "LON")] %>% as.numeric(),
                   color = "white", dashArray = "3", weight = 2) 
  })
  
  
}



