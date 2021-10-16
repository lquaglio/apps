# ui
selectFilterUI <- function(id) {
  ns <- NS(id)
  
  tagList(
    div(style="display: inline-block;vertical-align:top; padding-right:10px;",
        selectInput(inputId  = ns("vessel_type"),
                    label    = h4("Type:"),
                    choices  = unique(df$ship_type) %>% sort(),
                    multiple = FALSE,
                    width    = "200px"
        )),
    
    div(style="display: inline-block;vertical-align:top;",
        selectInput(inputId  = ns("vessel_name"),
                    label    = h4("Name:"),
                    choices  = '',
                    multiple = FALSE,
                    width    = "200px"
        ))
  )
}


