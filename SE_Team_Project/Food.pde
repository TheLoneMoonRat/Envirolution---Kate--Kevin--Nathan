class Food {
  float nutrition;
  color foodColour;
  float xPos;
  float yPos;
  
  //constructor
  Food (float n, color f, float x, float y) {
    this.nutrition = n;
    this.foodColour = f;
    this.xPos = x;
    this.yPos = y;
  }
  
  //methods
  void drawFood() {
    rect(xPos, yPos, 2, 2);
  }
  
  void createFood() {
    foods.add(new Food(random(0.1, 5), color(random(255), random(255), random(255)), random(250, 350), random(250, 350)));
  }
}
