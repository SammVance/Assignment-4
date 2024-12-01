Player player;
ArrayList<Lane> lanes;

boolean gameOver = false;

void setup() {
 size(400,400);
 player = new Player();
 lanes = new ArrayList<Lane>();
 
 // Create various lanes with differinng speeds and directions of obstacles
 for(int i = 0; i < 7; i++) { // Create 6 lanes
   lanes.add(new Lane(i * 50, random(2,5) * (random(1) > 0.5 ? 1 : -1)));
 }
}

void draw() {
  background(255);
  
  // Display Lanes and Obstacles
  for(Lane lane : lanes) {
    if(lane.checkCollision(player)) {
      player.resetPosition(); // Reset the player's position on collision
  } else {
    lane.update();
    lane.display();
  }
  }

  
  // Draw player character
  player.display();
  player.move();
  
  // Display Obstacles & move them
  
  
}
