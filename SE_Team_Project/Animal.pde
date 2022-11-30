class Animal{
  //fields
  int age;
  float xPosition;
  float yPosition;
  float breedingRate;
  float babyAmt;
  float speed;
  float hunger;
  float size;
  float aggression;
  boolean gender;
  String foodSource;
  
  //constructor
  Animal(float br, float sp, float si, boolean ge, float ag) {
    this.age = 0;
    this.breedingRate = br;
    this.babyAmt = 0;
    this.speed = sp;
    this.hunger = 0;
    this.size = si;
    this.gender = ge;
    this.aggression = ag;
    this.xPosition = 350 + random(-250, 250);
    this.yPosition = 350 + random(-250, 250);
  }

  //methods
  void giveBirth(Animal partner) {
    if (this.gender == true && partner.gender == false) {
      boolean tempGender;
      float tempSpeed = ((this.speed + partner.speed) / 2)  * random(0.8, 1.2);
      float tempAggression = ((this.aggression + partner.aggression) / 2) * random(0.8, 1.2);
      float tempSize = ((this.size + partner.size) / 2) * random(0.8, 1.2);
      float tempBreedingRate = ((this.breedingRate + partner.breedingRate) / 2) * random(0.8, 1.2);
      if (int(random(0,2)) == 0 ) {
        tempGender = true;
      } else {
        tempGender = false;
      }
      animals.add (new Animal(tempBreedingRate, tempSpeed, tempSize, tempGender, tempAggression));
      
    }
  }
  void drawAnimal() {
    rect(this.xPosition, this.yPosition, this.size, this.size);
  }
}
