class Animal{
  //fields
  int age;
  int giraffe;
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
  }

  //methods
  void giveBirth(Animal partner) {
    if (gender == true && partner.gender == false) {
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

void calculateBirths() {
    if (this.gender && this.age > 5 && this.hunger < 5 && timePassed >= this.breedingRate) {
      for (Animal a : animals) {
        float dist = sqrt(pow((this.xPos - a.xPos * -1), 2) + pow((this.yPos - a.yPos * -1), 2));
        
        if (a.timePassed >= breedingRate && this.vision > dist && ! a.gender && a.age > 5) {
          for (int x = 0; x < this.babyAmount; x++) 
            this.giveBirth(a);
          
          this.timePassed = 0;
          a.timePassed = 0;
        }
      }
    }
  }
}
          
