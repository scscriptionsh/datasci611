

  draw_menu_screen <- function(){
      bg <- load_graphics("background");

      finished <- false;

      while(!finished){
          draw(bg);
          draw_menu();
          finished <- read_input();
      }
  }

