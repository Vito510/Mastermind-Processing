class Indicator {


  int size = floor(dot_size/4);
  
  int x;
  int y;
  
  
  int y_margin = 2;
  int x_margin = 2;
  
  Indicator(int x, int y) {
  this.x = x+size/2;
  this.y = y+size/2;
  }
  

  void show(ArrayList<Integer> state) {
  
    boolean up = false;
  
    int u = 0;
    int d = 0;
    
    
    for (int i = 0; i < code_len; i++) {
      
      switch(state.get(i)) {
      case 0:
      fill(255);
      break;
      case 1:
      fill(0);
      break;
      case 2:
      fill(255,0,0);
      break;
      }
      
      up = !up;
    
      
      if (up) {
      circle(x+size*u+u*x_margin,y,size);
      u++;
      } else {
      circle(x+size*d+d*x_margin,y+size+y_margin,size);
      d++;
      }
     
    }
    
    fill(255);
  
  }








}
