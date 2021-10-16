# Mutate and filter Dataframe
datasetServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    data <- reactive({
      var_type = input$vessel_type
      var_name = input$vessel_name
      
      df %>%
        dplyr::filter(SHIPNAME == var_name, ship_type == var_type) %>%
        dplyr::arrange(DATETIME) %>% 
        dplyr::mutate(prevLAT        = lag(LAT), prevLON = lag(LON),
                      distance       = distHaversine(cbind(LON, LAT),
                                                     cbind(prevLON, prevLAT)),
                      total_distance = round(sum(distance, na.rm = TRUE),0),
                      prevDATETIME   = lag(DATETIME),
                      min_datetime   = min(DATETIME),
                      max_datetime   = max(DATETIME)) %>% 
        dplyr::filter(!is.na(distance)) %>%
        dplyr::arrange(desc(distance), desc(DATETIME)) %>%
        dplyr::slice(1)
      
    })
    return(data)
  }
  )
}