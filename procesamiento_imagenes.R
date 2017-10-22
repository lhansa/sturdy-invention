rm(list=ls()); gc()

library(tidyverse)
library(imager)
library(stringr)
library(plot3D)
# library(plot3Drgl)

## Lectura de la imagen ---------------------------------------------------

# fichero <- "images/IMG_20160813_083856251.jpg"
fichero <- system.file('extdata/parrots.png',package='imager')

imagen <- load.image(fichero)
plot(load.image(fichero))

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

imagen_filt <- imagen %>% 
  sample_n(1e5) %>%
  mutate(hex = rgb(R,G,B)) %>% 
  mutate(hex_num = str_replace(hex, "#", "")) %>% 
  mutate(hex_num = as.hexmode(hex_num)) %>% 
  mutate(hex_num = as.integer(hex_num))

scatter3D(x = imagen_filt$R,y = imagen_filt$G, z = imagen_filt$B, 
          colvar = imagen_filt$hex_num, col = imagen_filt$hex, 
          theta = 0, phi = 20,
          xlab = "R", ylab = "G", zlab = "B", colkey = FALSE)
# plotrgl()

dibuja_scatter3d <- function(.theta, .phi = 20){
  scatter3D(x = imagen_filt$R,y = imagen_filt$G, z = imagen_filt$B, 
            colvar = imagen_filt$hex_num, col = imagen_filt$hex, 
            theta = .theta, phi = .phi,
            xlab = "R", ylab = "G", zlab = "B", colkey = FALSE)
}



# saveGIF(for(i in 1:10) plot(runif(10), ylim = 0:1))
saveGIF(walk(seq(0, 360, by = 30), dibuja_scatter3d))


