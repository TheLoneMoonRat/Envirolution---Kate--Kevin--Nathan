class Food {
  //Fields
  float nutrition;   //how much hunger it fufills
  float growthRate;   //how fast food grows
  color foodColour;   //colour of food
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
  
  //Draw Food
  void drawFood() {
    fill(this.foodColour);
    circle(xPos, yPos, this.nutrition / 10);
  }
  
  //Get Distance From an Animal
  float getDist(Animal a) {
    return(sqrt(pow((a.xPos - this.xPos), 2) + pow((a.yPos - this.yPos), 2)));
  }

}
