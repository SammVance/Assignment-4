Player player;
ArrayList<Lane> lanes;

boolean gameOver = false;
PImage heart, greyHeart;
int lives = 3;

void setup() {
 size(400,400);
 player = new Player();
 lanes = new ArrayList<Lane>();
 
 // Load heart images
 heart = loadImage("heart.png");
 greyHeart = loadImage("grey_heart.png");
 
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
      lives--;
  } else {
    lane.update();
    lane.display();
  }
  }

  
  // Draw player character
  player.display();
  player.move();
  
  // Draw the hearts based on the number of lives
  drawHearts();
  
  
}

void drawHearts() {
  int hSize = 20;
  for(int i = 0; i < 3; i++) { // Use 3 Hearts
    PImage heartImage = i < lives ? heart : greyHeart; // Use the red heart for remaining lives, use grey for lost lives
    image(heartImage, width - (i + 1) * (hSize + 5), height - hSize - 5, hSize, hSize);
  }
}
