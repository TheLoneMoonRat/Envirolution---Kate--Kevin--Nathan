class Animal{
  //fields
  color animalColour;
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
  Animal(float br, float sp, float si, boolean ge, float ag, color co) {
    this.age = 0;
    this.animalColour = co;
    this.breedingRate = br;
    this.babyAmt = 0;
    this.speed = sp;
    this.hunger = 0;
    this.size = si;
    this.gender = ge;
    this.aggression = ag;
    this.xPosition = 350 + random(-200, 200);
    this.yPosition = 350 + random(-200, 200);
  }

  //methods
  void createChild(Animal partner) {
    boolean tempGender;
    float tempSpeed = ((this.speed + partner.speed) / 2)  * random(0.8, 1.2);
    float tempAggression = ((this.aggression + partner.aggression) / 2) * random(0.8, 1.2);
    float tempSize = ((this.size + partner.size) / 2) * random(0.8, 1.2);
    float tempBreedingRate = ((this.breedingRate + partner.breedingRate) / 2) * random(0.8, 1.2);
    float tempRed = (red(this.animalColour) + red(partner.animalColour)) / 2;
    float tempGreen = (green(this.animalColour) + green(partner.animalColour)) / 2;
    float tempBlue = (blue(this.animalColour) + blue(partner.animalColour)) / 2;
    if (int(random(0,2)) == 0 ) {
      tempGender = true;
    } else {
      tempGender = false;
    }
    println(tempGender);
    println(tempSpeed);
    println(tempAggression);
    println(tempSize);
    println(tempBreedingRate);
    println(tempRed);
    println(tempGreen);
    println(tempBlue);
    animals.add(new Animal(tempBreedingRate, tempSpeed, tempSize, tempGender, tempAggression, color(tempRed, tempGreen, tempBlue)));
  }
  void drawAnimal() {
    fill(animalColour);
    rect(this.xPosition, this.yPosition, this.size, this.size);
  }
}
