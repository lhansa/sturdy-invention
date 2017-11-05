mutate_hex <- function(df){
  df %>% 
    distinct(R,G,B) %>% 
    mutate(hex = rgb(R,G,B)) %>% 
    # arrange(hex) %>% 
    # mutate(hex_num = 1:nrow(.)) %>% 
    return()
}