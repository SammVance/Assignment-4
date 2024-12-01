// The obstacles that will move across the screen getting in the way of the player

class Obstacle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float w, h, topspeed;
  
  Obstacle(float x, float y) {
    position = new PVector(x,y);
    velocity = new PVector(random(-2,2), random(-2,2));
    acceleration = new PVector(-0.001, 0.01);
    w = random(25, 125); // Varying obstacle lengths
    h = 25;
    // Limit the velocity of the obstacles so they don't continue increasing speed
    topspeed = 10;
    velocity.limit(topspeed);
  }
  
  void update(float laneY) {
    velocity.add(acceleration);
    position.add(velocity);
    
    position.y = laneY; // Locks the y position within the lane's y axis
  
    // Check edges
    if(position.x > width) {
     position.x = -50;
   } if(position.x < -50) {
       position.x = width;
   }
  }

  
  void display() {
    fill(103,67,19);
    rect(position.x, position.y, w, h);
  }
  
  
  boolean playerCollision(Player p) {
    // Precise collision based on Jeffrey Thompson Collision Detection
    float playerRadius = p.size / 2;
    float playerCenterX = p.position.x;
    float playerCenterY = p.position.y;

    float closestX = constrain(playerCenterX, position.x, position.x + w);
    float closestY = constrain(playerCenterY, position.y, position.y + h);

    float distanceX = playerCenterX - closestX;
    float distanceY = playerCenterY - closestY;

    return (distanceX * distanceX + distanceY * distanceY) < (playerRadius * playerRadius);
  }
  
}
