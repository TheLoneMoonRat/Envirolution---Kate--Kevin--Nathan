class Food {
  //Fields
  float nutrition;
  float growthRate;
  color foodColour;
  float xPos;
  float yPos;
  
  //Constructors
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
  
  //Methods
  void drawFood() {
    fill(this.foodColour);
    circle(xPos, yPos, this.nutrition / 10);
  }
  
  float getDist(Animal a) {
    return(sqrt(pow((a.xPos - this.xPos), 2) + pow((a.yPos - this.yPos), 2)));
  }

}
