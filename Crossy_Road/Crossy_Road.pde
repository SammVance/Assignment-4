Player player;


boolean gameOver = false;

void setup() {
 size(400,400);
 player = new Player();
 
  
}

void draw() {
  background(255);
  
  if(gameOver == true) {
  } else {
  
  // Draw player character
  player.display();
  player.move();
  }
  
}
