class Paddle { 
  PVector pos;
  int w, h;
  

  Paddle(int whichPlayer) {
    w = 25;
    h = 100;
    if (whichPlayer == 1) {
      pos = new PVector(50, height/2 - h/2);
    } else if (whichPlayer == 2) {
      pos = new PVector(width-50-w, height/2-h/2);
    }
  }

  void update(boolean up, boolean down) {
    if (up && pos.y > 5) {
      pos.y -= 5;
    }
    if (down && pos.y + h < height - 5) {
      pos.y += 5;
    }
  }

  void display() {
    rectMode(CORNER);
    fill(paddlecolor);
    stroke(255);
    rect(pos.x, pos.y, w, h);
  }
}
