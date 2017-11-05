crea_gif <- function(img, 
                     angulos = seq(0, 360, by = 15), 
                     semilla = NULL, 
                     ruta = fichero){
  
  # if(!is.null(semilla)){
  #   set.seed(semilla)
  #   
  #   img <- img %>% 
  #     sample_n(5000) %>%
  #     arrange(x, y) %>%
  # } 
  
  img <- mutate_hex(img)
  
  # mutate(hex_num = str_replace(hex, "#", "")) %>% 
  # mutate(hex_num = as.hexmode(hex_num)) %>% 
  # mutate(hex_num = as.integer(hex_num))
  
  # scatter3D(x = img$R,y = img$G, z = img$B,
  #           colvar = img$hex_num, col = img$hex,
  #           theta = 0, phi = 0,pch = 16, 
  #           xlab = "R", ylab = "G", zlab = "B", colkey = FALSE)
  # plotrgl()
  
  dibuja_scatter3d <- function(.theta, .phi = 20){
    scatter3D(x = img$R,y = img$G, z = img$B, 
              colvar = img$hex_num, col = img$hex, 
              theta = .theta, phi = .phi, pch = 16, 
              xlab = "R", ylab = "G", zlab = "B", colkey = FALSE)
  }
  
  saveGIF(walk(angulos, dibuja_scatter3d, .phi = 0),
          movie.name = str_replace(ruta, ".jpg|.png" , ".gif"))
  
}