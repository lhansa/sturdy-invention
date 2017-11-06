# sturdy-invention
Visualización de imágenes desde otro punto de vista

Basado en una [idea](https://franciscouzo.github.io/image_colors/) de franciscouzo.

A partir de una imagen, el código genera un gráfico de dispersión en tres dimensiones (rojo (R), verde (G) y azul (B)) cuyos puntos representan cada píxel de la imagen, del color que le corresponde. 

Se genera un GIF (`saveGIF()` y `plot3D::scatter3D()`) y un gráfico interactivo (con `plotly::plot_ly()`)

Dentro de poco esto será una herramienta shiny.
  



