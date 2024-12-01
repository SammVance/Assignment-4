// Create lanes for the obstacles to move across and a way for the player to score points

class Lane {
  float laneY;
  float laneSpeed;
  ArrayList<Obstacle> obstacles; // Create an ArrayList of obstacles for the Lanes to have
  
 Lane(float y, float speed) {
   laneY = y;
   laneSpeed = speed;
   obstacles = new ArrayList<Obstacle>();
   
   // Referring to the ArrayList, add random obstacles to the lane
   for(int i = 0; i < 2; i++) { // How many obstacles are in a lane
     float x = random(width);
     obstacles.add(new Obstacle(x, laneY));
   }
 }
 
 void update() {
   // Implementing Obstacle functions when the Lane update function is called
   for(Obstacle obs : obstacles) {
     obs.update(laneY);
   }
 }
 
 void display() {
  fill(83,213,234);
  rect(0, laneY, width, 25);
  // Obstacles will display within the lanes
  for(Obstacle obs : obstacles) {
    obs.display();
 }
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
