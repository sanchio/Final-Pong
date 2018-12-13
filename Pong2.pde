Ball ball;
Paddle p1;
Paddle p2;

boolean p1up, p1down, p2up, p2down, sizeUp, sizeDown;
int score1;
int score2;
int oops1, oops2;

void keyPressed() {
  if (key != CODED) {
    if (key == 'w') {
      p1up = true;
    } else if (key == 's') {
      p1down = true;
    }
  } else {
    if (keyCode == UP) {
      p2up = true;
    } else if (keyCode == DOWN) {
      p2down = true;
    }
  }
  if (keyCode != CODED) {
      if (key == '=') {
        sizeUp = true;
      } else if  (key == '-') {
      //} else if { (key == CODED) {
        //if (keyCode == DELETE) {
        sizeDown = true;
      }
      }
      }
        
      
  


void keyReleased() {
  if (key != CODED) {
    if (key == 'w') {
      p1up = false;
    } else if (key == 's') {
      p1down = false;
    }
  } else {
    if (keyCode == UP) {
      p2up = false;
    } else if (keyCode == DOWN) {
      p2down = false;
    }
    if (keyCode != CODED) {
      if (key == ' ') {
        sizeUp = false;
      } else if  (keyCode == DELETE) {
        sizeDown = false;
      }
      }
        
  }
}

color bgcolor;
color paddlecolor;
int a;

void setup() {
  size(1000, 600);
  ball = new Ball();
  p1 = new Paddle(1);
  p2 = new Paddle(2);
  
}

void draw() {
  
  
  background(bgcolor);

  ball.update();
  ball.display();
  ball.sizes(sizeUp, sizeDown);

  p1.update(p1up, p1down);
  p1.display();

  p2.update(p2up, p2down);
  p2.display();
  
  ball.checkCollision(p1);
  ball.checkCollision(p2);  
  
 

  fill(255);
  textSize(64);
  textAlign(CENTER, CENTER);
  text(score1, width/4, height/8);
  text(score2, 3*width/4, height/8);
  
  
  
 
  
  drawCenterLine();
}

void drawCenterLine() {
  rectMode(CENTER);
  fill(255);
  for (int i = 0; i < height; i+=30) {
    rect(width/2, i, 15, 15);
  }
}
