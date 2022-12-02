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
  
  Food (float x, float y){
    this.xPos = x;
    this.yPos = y;
  }
  
  //methods
  void drawFood() {
    rect(xPos, yPos, 5, 5);
  }
  
  float getDist(Animal a) {
    return(sqrt(pow((a.xPos - this.xPos), 2) + pow((a.yPos - this.yPos), 2)));
  }

}
