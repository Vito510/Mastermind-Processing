import java.util.*;
import processing.sound.*;

SoundFile fwin, flose;


int code_len = 5;

int x = 0;
int y = 0;

int dot_spacing = 5;
int dot_size = 50;
int margin_left = 20;
int margin_bottom = 150;
int row_amount = 10;

int win = 0;


ArrayList<Row> rows = new ArrayList<Row>();


int solution[][] = new int[code_len][3];

int colors[][] = {
  {255,0,0},
  {0,255,0},
  {0,0,255},
  {255,255,0},
  {0,255,255},
  {155,0,60}
};

void winner() {

try {
  fwin.play();
} catch (Exception e) {
  println("Winner!!!");
}


}

void lose() {

try {
  flose.play();
} catch (Exception e) {
  println(":(");
}
  
}


void setup() {  
  frameRate(144);
  size(500,800);
  background(255);
  
  try {
  fwin = new SoundFile(this, "win.wav");
  flose = new SoundFile(this, "lose.wav");
  } catch (Exception e) {
  }

  
  for (int i = 0; i < row_amount; i++) {
    rows.add(new Row(code_len,height-dot_size/2-margin_bottom-(dot_size+dot_spacing)*i));
  }
  
  for (int i = 0; i < code_len; i++) {
    int index = int(random(colors.length));
    solution[i] = colors[index];
  }
  
  
  
}

void draw() {
  background(255);
  
  fill(255);
  stroke(0);

  
  //draw guess board + indicators
  for (Row r : rows) {
    r.show();
  }
  
  
  //selection box
  int c = 0;
  for (int b[] : colors) {
    fill(b[0],b[1],b[2]);
    square(margin_left+c*(dot_spacing+dot_size),height-(dot_size+dot_spacing),dot_size);
    c++;
  }
  
  if (win == 1) {
    win++;
    winner();
  }
  
  

}

void mouseClicked() {
  
  if (win > 0) {
    return;
  }
  
  for (int i = 0; i < colors.length; i++) {
      if (margin_left+i*(dot_spacing+dot_size) < mouseX && margin_left+i*(dot_spacing+dot_size) + dot_size > mouseX && height-dot_spacing > mouseY && height-(dot_size+dot_spacing) < mouseY) {
        try {
          Row r = rows.get(y);
          Dot d = r.Dots.get(x);
          
          d.col = colors[i];
          
                  if (x == code_len-1) {
         //row end
        x = 0;
        y++;
        r.check();
        } else {
        x++;
        }
          
        } catch (Exception e) {
          win = 2;
          lose();
        }
          
      }
  }
 
  
  
}

void keyPressed() {

  
}
