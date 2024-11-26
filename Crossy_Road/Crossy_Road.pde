Player player;


boolean gameOver = false;

void setup() {
 size(400,400);
 player = new Player();
 
 gameOver = true;
  
}

void draw() {
  background(255);
  
  if(gameOver == true) {
    title();
  } else {
  
  // Draw player character
  player.display();
  player.move();
  }
  
}

void title() {
  fill(0);
  textSize(36);
  textAlign(CENTER);
  text("Crossy River", width/2, 100);
  textSize(24);
  text("Play", width/2, height/2);
  
  fill(0, 10);
  rectMode(CENTER);
  rect(width/2, height/2-10, 100, 50);
    
  
}


boolean isMouseOver(int x, int y, int w, int h) {
  if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {
    return true;
  }
  return false;
}
  
void mousePressed() {
  if(isMouseOver(width/2, height/2-10, 100, 50) == true) {
    gameOver == false;
  }
  
