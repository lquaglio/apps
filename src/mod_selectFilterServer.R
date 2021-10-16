# Update selectinput based on a previous selection
selectFilterServer <- function(id, df){
  moduleServer(id, function(input, output, session){
    
    observe({
      x = input$vessel_type
      
      selected_cols <- df %>% 
        dplyr::filter(ship_type == x) %>% 
        dplyr::pull(SHIPNAME) %>% 
        unique() %>% sort()
      
      freezeReactiveValue(input, "vessel_name")
      
      updateSelectInput(session  = session,
                        inputId  = "vessel_name",
                        choices  = selected_cols,
                        selected = selected_cols[1])
    })
  })
}