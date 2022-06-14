class Row {

int l;
int y;
ArrayList<Dot> Dots = new ArrayList<Dot>();

ArrayList<Integer> ind_state = new ArrayList<Integer>();


Indicator ind;


  Row(int duljina, int yrow) {
    l = duljina;
    y = yrow;
    
    ind = new Indicator(margin_left+dot_size*code_len+dot_spacing*code_len,y-dot_spacing);
    
    for (int i = 0; i < code_len; i++) {

      ind_state.add(0);
  
    }

  
    for (int i = 0; i < l; i++) {
      int b[] = {255,255,255};
     
      
      
      Dot dot = new Dot(margin_left+dot_size/2+(dot_size+dot_spacing)*i,b);
      
      
      Dots.add(dot);
     }
  }
  
  
  void show() {
    for (Dot d : Dots) {
      
      int col[] = d.col;
      
      fill(col[0],col[1],col[2]);
      circle(d.x,y,dot_size);
      fill(255);
    }
    ind.show(ind_state);
    
  }
  
  boolean contains(int a[][], int b[]) {
  

    
    for (int s[] : a) {
      if (Arrays.equals(s,b)) {
        return true;
      }
    }
    
    return false;
  
  }
  
  void check() {
    boolean dot_color = false;
    boolean dot_position = false;

    int dot_index = 0;
    for (Dot d : Dots) {
      

        dot_color = (contains(solution,d.col)) ? true : false;
        
        dot_position = (Arrays.equals(d.col,solution[dot_index])) ? true : false;
        
        
        if (dot_position) {
          ind_state.set(dot_index,2);
        } else if (dot_color) {
          ind_state.set(dot_index,1);
        } else {
          ind_state.set(dot_index,0);
        }
  
      
    dot_index++;
    } 
    
    int c = 0;
    for (int i : ind_state) {
      if (i == 2) {
        c++;
      }
    }
    
    if (c == code_len) {
      
      win = 1;
    }
    
  }
  
  
  
  
  
}
