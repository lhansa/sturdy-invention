mutate_hex <- function(df){
  df %>% 
    mutate(hex = rgb(R,G,B), 
           hex_num = 1:nrow(.)) %>% 
    return()
}