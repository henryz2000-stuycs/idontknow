/*
Team I Don't Know -- Queenie Xiang + Henry Zheng
APCS2 pd3
HW40 -- All That Bouncin'
2017-05-15
*/

class Ball{

  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;

  //default constructor
  Ball(){
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color(r, g, b);
    rad = 50;
    x = random((width - r) + r/2);
    y = random((height - r) + r/2);
    dx = random(10) - 5;
    dy = random(10) - 5;
    state = 0;
  }
  
  //overloaded constructor
  Ball(int xCor, int yCor){
    this();
    x = xCor;
    y = yCor; 
    state = 1;
  }
  
  //accessors
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
  float getRadius(){
    return rad;
  }
  color getColor(){
    return c;
  }
  float getDx(){
    return dx;
  }
  float getDy(){
    return dy;
  }
  int getState(){
    return state;
  }

  //mutators
  void setX(float newX){
    x = newX;
  }
  void setY(float newY){
    y = newY;
  }
  void setRadius(float newRad){
    rad = newRad;
  }
  void setColor(color newC){
    c = newC;
  }
  void setDx(float newDx){
    dx = newDx;
  }
  void setDy(float newDy){
    dy = newDy;
  }
  void setState(int newState){
    state = newState;
  }

  //displays the ball
  void display(){
    fill(150);
    noStroke();
    ellipse(x, y, rad, rad);
  }

  void move() { 
    x = x + dx;
    y = y + dy; 
    bounce();
  }

  void bounce() {
    if (x < 0 || x > width - rad) {
      dx = -dx;
    }
    if (y < 0 || y > height - rad) {
      dy = -dy;
    }
  }
  
  boolean isColliding(Ball other){
    return ((abs(x - other.getX()) < rad/2) && (abs(y - other.getY()) < rad/2));
  }

  void startReaction(ArrayList<Ball> balls, boolean reactionStarted) {
    display();
    
    if (state == -1){//done
      dx = 0;
      dy = 0;
      rad = 50;
    }
    else if (state == 1){//increasing
      if (rad >= 120){
        setState(2);
      }
      else{
        rad++;
      }
    }
    else if (state == 2){//decreasing
      if (rad <= 50){
        setState(-1);
      }
      else{
        rad--;
      }
    }
    else{//normal state
      move();
      for (Ball ball : balls){
        if (reactionStarted && !this.equals(ball) && isColliding(ball)){//if collision
          setState(1);
        }
      }
    }
  }
}