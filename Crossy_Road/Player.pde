// The character that the player will be capable of controlling and playing the game with

class Player {
  
  PVector position; // Set the position of the player
  float speed = 5; // Bigger movements to better showcase moving across lanes
  float size;
  
 Player() {
   position = new PVector(200,400); // Initializes starting position of the player character
   size = 20;
   
 }
 
 void update() {
    // Check edges
    if(position.x > width) {
     position.x = -10;
   } if(position.x < -10) {
       position.x = width;
   }
  }
 
 void display() {
   fill(0);
   ellipse(position.x, position.y, size, size);
   
 }
 
 void move() {
   // Move the player character using the arrow keys
   if(keyPressed) {
     if(keyCode == UP) {
       position.y -= speed;
     }
     if(keyCode == DOWN) {
       position.y += speed;
     }
     if(keyCode == LEFT) {
       position.x -= speed;
     }
     if(keyCode == RIGHT) {
       position.x += speed;
     }
   }
 }
 
 void resetPosition() {
    position.set(200, 400); // Reset to the starting position
  }
}
