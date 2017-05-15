/*
Team I Don't Know -- Queenie Xiang + Henry Zheng
APCS2 pd3
HW40 -- All That Bouncin'
2017-05-15
*/

ArrayList<Ball> balls;  
boolean reactionStarted;

void setup(){
  size(600, 600);
  background(0); 
  reactionStarted = false;
  balls = new ArrayList<Ball>(); 
  for (int i=0; i < 25; i++){
    balls.add(new Ball());
  }
}

void draw(){
  frameRate(30);
  background(0); 
  for (int i=0; i < balls.size(); i++){
    balls.get(i).startReaction(balls, reactionStarted);
  }
}

void mouseClicked(){
  balls.add(new Ball(mouseX, mouseY));
  reactionStarted = true;
}