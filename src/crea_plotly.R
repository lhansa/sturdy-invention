crea_plotly <- function(img = imagen, semilla = NULL, sample_size = NULL){
  
  if(!is.null(semilla)){
    
    set.seed(semilla)
    
    sample_size <- sample_size %||% 5000
    
    img <- img %>% 
      sample_n(sample_size)
  }
  
  img <- mutate_hex(img)
  
  ejes <- list(showgrid = FALSE, backgroundcolor = "rgba(230, 230, 230, 0.5)")
  
  scene <- list(xaxis = ejes, yaxis = ejes, zaxis = ejes)
  
  plot_ly(img, 
          x = ~R, y = ~G, z = ~B, color = I(img$hex), 
          size = I(2)) %>%
    add_markers() %>% 
    layout(scene = scene)
  
}