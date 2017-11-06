rm(list=ls()); gc()

library(tidyverse)
library(imager)
library(stringr)
library(plot3D)
# library(plot3Drgl)
library(animation)
library(plotly)

walk(list.files("src", pattern = ".R$", full.names = TRUE), source)

## Lectura de la imagen ---------------------------------------------------

# fichero <- "images/IMG_20160813_083856251.jpg"
fichero <- "images/pintura/antonio_garcia.jpg"
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

## GIF RGB ------------------------------------------------------

crea_gif(imagen)

## Con plotly ------------------------------------------------------

crea_plotly(imagen)

## Agregación por cuadro -------------------------------------------

imagen %>% 
  summarise_at(.vars = vars(R,G,B), .funs = funs(mean)) 
