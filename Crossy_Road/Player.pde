// The character that the player will be capable of controlling and playing the game with

class Player {
  
  PVector position; // Set the position of the player
  float speed = 10; // Bigger movements to better showcase moving across lanes
  
 Player() {
   position = new PVector(200,200); // Initializes starting position of the player character
   
 }
 
 
 void display() {
   fill(0);
   ellipse(position.x, position.y, 25, 25);
   
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
   // If player character goes off screen, initiate game over
   
   
 }
  
  
  
}
