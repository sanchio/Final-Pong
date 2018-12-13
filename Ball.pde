

class Ball {
  PVector pos, vel;
  int s = 25;

  Ball() {
    restart(int(random(1,2)));
    
  }

  void restart(int whichPlayer) {
    float angle = 0;
    if (whichPlayer == 1) {
      angle = random(-45, 45);  
    } else if (whichPlayer == 2) {
      angle = random(135, 225);
    }
    pos = new PVector(width/2, height/2);
    vel = new PVector();
    vel.x = cos(radians(angle));
    vel.y = sin(radians(angle));
    float speed = 5;
    vel.mult(speed);
  }

  void checkCollision(Paddle p) {
    if (ball.pos.x < (p.pos.x + p.w) && 
      ball.pos.x > (p.pos.x) &&
      ball.pos.y > (p.pos.y) && 
      ball.pos.y < (p.pos.y + p.h)) {
      ball.vel.x = -ball.vel.x;
      paddlecolor = color(255, 255, 255, a);
      a-=5;
      
      bgcolor = color(random(0,255), random(0,255), random(0,255));
      bgcolor = color(random(0,255), random(0,255), random(0,255));
    }
  }

  void update() {
    if (pos.y > height || pos.y < 0) {
      vel.y = -vel.y;
    }

    pos.add(vel);

    if (pos.x < 0) {
      restart(2);
      score2++;
      oops1++;
      //bgcolor = color(255,0,0);
      background(255,0,0);
      text("Oops!", width/4, height/2);
      text("Yay!", 3*width/4, height/2);
      
      
    }
    if (pos.x > width) {
      restart(1);
      score1++;
      background(255,0,0);
      text("Oops!", 3*width/4, height/2);
      text("Yay!", width/4, height/2);
      
      
    }
   
  }

  void display() {
    rectMode(CENTER);
    fill(255);
    noStroke();
    rect(pos.x, pos.y, s/2, s/2);
  }
  
  void sizes(boolean big, boolean small) {
    if(big && s >= 25) {
      s += 1;
    }
    if(small && s >= 50) {
      s -= 1;
    }
    
    
  }
  
}
