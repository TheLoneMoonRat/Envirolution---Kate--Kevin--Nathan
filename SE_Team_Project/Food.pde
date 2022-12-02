class Food {
  float nutrition;
  float growthRate;
  color foodColour;
  float xPos;
  float yPos;
  
  //constructor
  Food (float n, float gr, color f, float x, float y) {
    this.nutrition = n;
    this.growthRate = gr;
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
