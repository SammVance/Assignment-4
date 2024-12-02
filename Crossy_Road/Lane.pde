// Create lanes for the obstacles to move across and a way for the player to score points

class Lane {
  float laneY, laneSpeed, defspeed;
  ArrayList<Obstacle> obstacles; // Create an ArrayList of obstacles for the Lanes to have
  PImage water;
  
 Lane(float y, float speed) {
   laneY = y+50;
   laneSpeed = speed;
   obstacles = new ArrayList<Obstacle>();
   
   water = loadImage("water.jpg");
   
   // Referring to the ArrayList, add random obstacles to the lane
   for(int i = 0; i < 3; i++) { // How many obstacles are in a lane
     float x = random(width);
     obstacles.add(new Obstacle(x, laneY));
   }
 }
 
 void reset() {
   laneSpeed = defspeed;
   for(Obstacle obs : obstacles) {
     obs.reset(laneSpeed);
   }
 }
 
 void update() {
   // Implementing Obstacle functions when the Lane update function is called
   for(Obstacle obs : obstacles) {
     obs.update(laneY);
   }
 }
 
 void display() {
   image(water, 0, laneY, width, 25);
   
   // Obstacles will display within the lanes
   for(Obstacle obs : obstacles) {
     obs.display();
   }
 } 
 
 void increaseSpeed(int level) {
   laneSpeed += level * 0.5; // Increase the lane speed based on the current level
 }
 
  boolean checkCollision(Player p) {
    for (Obstacle obs : obstacles) {
      if (obs.playerCollision(p)) {
        return true;
      }
    }
    return false;
  }
}
