Player player;
ArrayList<Lane> lanes;

boolean gameOver = false;

void setup() {
 size(400,400);
 player = new Player();
 lanes = new ArrayList<Lane>();
 
 // Create various lanes with differinng speeds and directions of obstacles
 for(int i = 0; i < 4; i++) {
   lanes.add(new Lane(i * 100, random(2,5) * (random(1) > 0.5 ? 1 : -1)));
 }
}

void draw() {
  background(255);
  
  // Display Lanes and Obstacles
  for(Lane lane : lanes) {
    lane.update();
    lane.display();
  }
  
  if(gameOver == true) {
  } else {
  
  // Draw player character
  player.display();
  player.move();
  
  // Display Obstacles & move them
  
  }
  
}
