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
    h = 50;
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
     position.x = 0;
   } if(position.x < 0) {
       position.x = width;
   }
  }

  
  void display() {
    fill(255,0,0);
    rect(position.x, position.y, w, h);
  }
  
  
}
