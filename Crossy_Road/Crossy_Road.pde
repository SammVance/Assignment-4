Player player;
ArrayList<Lane> lanes;

boolean gameOver = false;
boolean istitlescreen = true;
PImage heart, greyHeart, background;
int lives = 3;
int level = 0; // Initial level
int dist = 60;

PImage[] levelDigits = new PImage[10]; // Array to hold images for 0-9

void setup() {
 size(400,400);
 player = new Player();
 lanes = new ArrayList<Lane>();
 
 // Load heart images
 heart = loadImage("heart.png");
 greyHeart = loadImage("grey_heart.png");
 background = loadImage("grass.png");
 
 // Load digit images
 for(int i = 0; i < 10; i++) {
   levelDigits[i] = loadImage(i + ".png");
 }
 
 // Create various lanes with differinng speeds and directions of obstacles
 for(int i = 0; i < 5; i++) { // Create 6 lanes
   lanes.add(new Lane(i * dist, random(2,5) * (random(1) > 0.5 ? 1 : -1)));
 }
}

void draw() {
   if(istitlescreen) {
    titleScreen();
   } else {
  image(background, 0, 0, width, height);
  
  // Game Over screen  
  if(lives <= 0) {
    gameOver = true;
    textAlign(CENTER);
    textSize(32);
    fill(0);
    text("Game Over", width/2, 160);
    
    textSize(24);
    fill(0);
    text("Click to Main Menu", width/2, height/2);
    
    return;
  }
  
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
  player.update();
  
  // Level Checker
  if(player.position.y <= 0) {
    level++;
    player.resetPosition();
    for(Lane lane : lanes) {
      lane.increaseSpeed(level);
    }
  }
  
  
  // Draw the hearts based on the number of lives
  drawHearts();
  displayLevel(level);
   }
}

void displayLevel(int level) {
  int xPos = width/2 - 15; // Position of the level digits
  int lSize = 35;
  int digit1 = level/10; // Tenths
  int digit2 = level%10; // Ones
  
  if(digit1 > 0) {
    image(levelDigits[digit1], xPos, 10, lSize, lSize); // Displays tenths
    xPos += 20;
  }
  image(levelDigits[digit2], xPos, 10, lSize, lSize); // Displays ones
}

void drawHearts() {
  int hSize = 20;
  for(int i = 0; i < 3; i++) { // Use 3 Hearts
    PImage heartImage = i < lives ? heart : greyHeart; // Use the red heart for remaining lives, use grey for lost lives
    image(heartImage, width - (i + 1) * (hSize + 5), height - hSize - 5, hSize, hSize);
  }
}

void titleScreen() {
  image(background, 0, 0, width, height);
  
  // Display Title text
  textAlign(CENTER);
  textSize(48);
  fill(0);
  text("Crossy River", width/2, height/3);
  
  // Play button
  fill(50,100,200);
  rect(width/2-100, height/2, 200, 50);
  fill(0);
  textSize(32);
  text("Play", width/2, height/2 +35);
}

void mousePressed() {

  if(istitlescreen) {
    // Check where the mouse is
    if(mouseX > width/2-100 && mouseX < width/2+100 && mouseY > height/2 && mouseY < height/2 +50) {
      istitlescreen = false; // Press play
    }
  } else if(gameOver) {
      lives = 3;
      player.resetPosition();
      gameOver = false;
      istitlescreen = true;
      level = 0;
    } 
}
    
    
