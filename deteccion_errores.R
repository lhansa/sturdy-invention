set.seed(2)

img <- imagen %>% 
  sample_n(100) %>% 
  distinct(R,G,B) %>% 
  mutate(hex = rgb(R,G,B)) %>% 
  arrange(hex) %>%
  mutate(hex_num = 1:nrow(.))


img %>% 
  filter(hex_num %in%  25:30)


img %>% filter(hex == "#A45B3A")

img %>% 
  mutate(aux = 1:nrow(img)) %>% 
  filter(aux == 28)


scatter3D(x = img$R,y = img$G, z = img$B,
          col = img$hex,colvar = 1:nrow(img), 
          theta = 0, phi = 0,pch = 16, type = "h", 
          xlab = "R", ylab = "G", zlab = "B", colkey = FALSE, 
          xlim = c(0,1), ylim = c(0, 1), zlim = c(0,1))

text3D(x = img$R,y = img$G, z = img$B,  labels = img$hex,
       add = TRUE, colkey = FALSE, cex = 0.5)

img <- img %>% filter(hex == "#A45B3A")


scatter3D(x = img$R,y = img$G, z = img$B,
          col = img$hex,colvar = 1:nrow(img), 
          theta = 0, phi = 0,pch = 16,
          xlab = "R", ylab = "G", zlab = "B", colkey = FALSE, 
          xlim = c(0,1), ylim = c(0, 1), zlim = c(0,1))

text3D(x = img$R,y = img$G, z = img$B,  labels = img$hex,
       add = TRUE, colkey = FALSE, cex = 0.5)

img <- img %>% 
  mutate(hex_num = 1:nrow(.))


scatter3D(x = img$R,y = img$G, z = img$B,
          colvar = img$hex_num, col = img$hex,
          theta = 0, phi = 0,pch = 16,
          xlab = "R", ylab = "G", zlab = "B", colkey = FALSE, 
          xlim = c(0,1), ylim = c(0, 1), zlim = c(0,1))

img <- img_orig %>% 
  mutate(hex_num = 1:nrow(.))
  

img %>% filter(x == 152 & y == 161)
img_orig %>% filter(x == 152 & y == 161)

## --------------------------------------------------------------

img <- imagen %>% 
  distinct(R,G,B) %>% 
  mutate(hex = rgb(R,G,B))

imagen %>% 
  distinct(R,G,B) %>% 
  mutate(hex = rgb(R,G,B)) %>% 
  distinct(hex)

scatter3D(x = img$R,y = img$G, z = img$B,
          col = img$hex,colvar = 1:nrow(img), 
          theta = 90, phi = 0,pch = 16, # type = "h", 
          xlab = "R", ylab = "G", zlab = "B", colkey = FALSE, 
          xlim = c(0,1), ylim = c(0, 1), zlim = c(0,1))

img <- img %>% 
  filter(B >= 0.90)

scatter3D(x = img$R,y = img$G, z = img$B,
          col = img$hex,colvar = 1:nrow(img), 
          theta = 90, phi = 0,pch = 16, # type = "h", 
          xlab = "R", ylab = "G", zlab = "B", colkey = FALSE, 
          xlim = c(0,1), ylim = c(0, 1), zlim = c(0,1))

colores <- img$hex


img %>% 
  filter(hex %in% colores)
