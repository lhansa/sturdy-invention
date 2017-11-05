set.seed(2)

img <- imagen %>% 
  sample_n(100) %>% 
  distinct(R,G,B) %>% 
  mutate(hex = rgb(R,G,B)) %>% 
  # arrange(R,G,B) %>% 
  mutate(hex_num = 1:nrow(.))

img %>% filter(hex == "#A45B3A")
img %>% filter(hex_num == )

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

img <- img %>% 
  filter(hex != "#700000")

scatter3D(x = img$R,y = img$G, z = img$B,
          col = img$hex,colvar = 1:nrow(img), 
          theta = 0, phi = 0,pch = 16,
          xlab = "R", ylab = "G", zlab = "B", colkey = FALSE, 
          xlim = c(0,1), ylim = c(0, 1), zlim = c(0,1))



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
