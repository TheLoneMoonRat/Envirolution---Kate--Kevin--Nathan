class Animal{
  //fields
  int age;
  int timePassed;
  float vision;
  float breedingRate;
  float babyAmt;
  float speed;
  float hunger;
  float xPos;
  float yPos;
  float xMove;
  float yMove;
  float size;
  float aggression;
  float highTemp;
  float lowTemp;
  color animalColour;
  boolean gender;
  String diet;
  Habitat habitat;
  
  //constructor
  Animal(float br, float sp, float si, boolean ge, float ag, float vs, float ht, float lt, color co) {
    this.age = 0;
    this.breedingRate = br;
    this.babyAmt = 0;
    this.speed = sp;
    this.hunger = 0;
    this.size = si;
    this.gender = ge;
    this.aggression = ag;
    this.timePassed = 0;
    this.vision = vs;
    this.highTemp = ht;
    this.lowTemp = lt;
    this.animalColour = co;
  }

  //methods
  
  void drawAnimal() {
    fill(animalColour);
    rect(this.xPos, this.yPos, this.size, this.size);
  }
  
  void createChild(Animal partner) {
    boolean tempGender;
    float tempVision = ((this.vision + partner.vision) / 2) * random(0.8, 1.2);
    float tempSpeed = ((this.speed + partner.speed) / 2)  * random(0.8, 1.2);
    float tempAggression = ((this.aggression + partner.aggression) / 2) * random(0.8, 1.2);
    float tempSize = ((this.size + partner.size) / 2) * random(0.8, 1.2);
    float tempBreedingRate = ((this.breedingRate + partner.breedingRate) / 2) * random(0.8, 1.2);
    float tempHighTemp = ((this.highTemp + partner.highTemp) / 2) * random(0.8, 1.2);
    float tempLowTemp = ((this.lowTemp + partner.lowTemp) / 2) * random(0.8, 1.2);
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
    animals.add(new Animal(tempBreedingRate, tempSpeed, tempSize, tempGender, tempAggression, tempVision, tempHighTemp, tempLowTemp, color(tempRed, tempGreen, tempBlue)));
  }

  void calculateBirths() {
    if (this.gender && this.age > 5 && this.hunger < 5 && timePassed >= this.breedingRate) {
      boolean gaveBirth = false;
      while (! gaveBirth) {
        for (Animal a : animals) {
          float dist = sqrt(pow((this.xPos - a.xPos * -1), 2) + pow((this.yPos - a.yPos * -1), 2));
        
          if (a.timePassed >= breedingRate && this.vision > dist && ! a.gender && a.age > 5) {
            for (int x = 0; x < this.babyAmt; x++) 
              this.createChild(a);
          
            this.timePassed = 0;
            a.timePassed = 0;
            gaveBirth = true;
          }
        }
      }
    }
  }
  
  void eat() {
    for (Food f : foodAmt) {
      float dist = sqrt(pow((this.xPos - f.xPos * -1), 2) + pow((this.yPos - f.yPos * -1), 2));
      
      if (dist < 5) {
        this.hunger += f.nutrition;
        foodAmt.remove(f);
      }
      
      else if (dist < this.vision && hunger > 5) {
        this.xMove = (this.xPos - f.xPos) / (this.yPos - f.yPos) * this.speed;
        this.yMove = (this.xPos - f.xPos) / (this.yPos - f.yPos) * this.speed;
      }
    }
  } 
  
  void updateStats() {
    this.hunger += 0.5 * size;
    this.age += 1;
    this.timePassed += 1;
  }
  
  void calculateDeaths() {
    if (this.hunger > 10 || this.age > 30 || this.habitat.temp > this.highTemp || this.habitat.temp < this.lowTemp) 
      animals.remove(this);
  }
}
          
