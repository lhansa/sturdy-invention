rm(list=ls()); gc()

library(tidyverse)
library(imager)
library(stringr)
library(plot3D)
# library(plot3Drgl)
library(animation)

## Lectura de la imagen ---------------------------------------------------

fichero <- "images/IMG_20160813_083856251.jpg"
# fichero <- system.file('extdata/parrots.png',package='imager')

imagen <- load.image(fichero)
# plot(load.image(fichero))

## Tratamiento ---------------------------------------------------------

imagen <- imagen %>% 
  as.data.frame() %>% 
  as_tibble() %>% 
  mutate(
    cc = case_when(
      cc == 1 ~ "R",
      cc == 2 ~ "G",
      cc == 3 ~ "B"
      )
  ) %>% 
  spread(cc, value) %>% 
select(x, y, R, G, B)

## Visualización RGB ------------------------------------------------------

# set.seed(31818)

imagen <- imagen %>% 
  # sample_n(1e5) %>%
  mutate(hex = rgb(R,G,B)) %>% 
  mutate(hex_num = 1:nrow(.))
  # mutate(hex_num = str_replace(hex, "#", "")) %>% 
  # mutate(hex_num = as.hexmode(hex_num)) %>% 
  # mutate(hex_num = as.integer(hex_num))

scatter3D(x = imagen$R,y = imagen$G, z = imagen$B,
          colvar = imagen$hex_num, col = imagen$hex,
          theta = 0, phi = 0,
          xlab = "R", ylab = "G", zlab = "B", colkey = FALSE)
# plotrgl()

dibuja_scatter3d <- function(.theta, .phi = 20){
  scatter3D(x = imagen$R,y = imagen$G, z = imagen$B, 
            colvar = imagen$hex_num, col = imagen$hex, 
            theta = .theta, phi = .phi,
            xlab = "R", ylab = "G", zlab = "B", colkey = FALSE)
}

saveGIF(walk(seq(0, 360, by = 15),
             dibuja_scatter3d, .phi = 0),
        movie.name = str_replace(fichero, ".jpg|.png" , ".gif"))


# for(i in seq(0,1,by = 0.1)){
#   plot(x = 1:10, y = 1:10, col = rgb(i, i, i))
# }
# 
# as.hexmode("ffffff") %>% as.numeric()
