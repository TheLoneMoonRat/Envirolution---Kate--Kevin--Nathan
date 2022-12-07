class Animal{
  //fields
  int age;
  int timePassedSinceBred;
  float vision;
  float breedingRate;
  float babyAmt;
  float speed;
  float hunger;
  float xPos;
  float yPos;
  float size;
  float aggression;
  color animalColour;
  PVector currentSpeed;
  PVector newLocation;
  Food target;
  boolean gender;
  String foodSource;
  Animal partner;
  float finalSize;
  
  //constructor
  Animal(float br, float sp, float si, boolean ge, float ag, float vs, color co, float x, float y) {
    this.age = 0;
    this.breedingRate = br;
    this.babyAmt = 0;
    this.speed = sp;
    this.hunger = 0;
    this.size = si;
    this.gender = ge;
    this.aggression = ag;
    this.timePassedSinceBred = 0;
    this.vision = vs;
    this.animalColour = co;
    this.xPos = x;
    this.yPos = y;
    this.currentSpeed = new PVector(0, 0);
    this.target = new Food(700, 700);
    this.partner = null;
    this.finalSize = this.size;
    this.newLocation = null;
    
    //this.currentSpeed.x = random(0, 4);
    //this.currentSpeed.y = sqrt(pow(this.speed, 2) - pow(this.currentSpeed.x, 2));
  }
  Animal(float br, float sp, float si, boolean ge, float ag, float vs, color co, float x, float y, float fs) {
    this.age = 0;
    this.breedingRate = br;
    this.babyAmt = 0;
    this.speed = sp;
    this.hunger = 50;
    this.size = si;
    this.gender = ge;
    this.aggression = ag;
    this.timePassedSinceBred = 0;
    this.vision = vs;
    this.animalColour = co;
    this.xPos = x;
    this.yPos = y;
    this.currentSpeed = new PVector(0, 0);
    this.target = new Food(700, 700);
    this.partner = null;
    this.finalSize = fs;
    this.newLocation = null; 
    
    //this.currentSpeed.x = random(0, 4);
    //this.currentSpeed.y = sqrt(pow(this.speed, 2) - pow(this.currentSpeed.x, 2));
  }

  //methods
  void guiUpdate() {
    if (setting.equals("Aggression")) {
      this.aggression = variable_slide.getValueF();
    } else if (setting.equals("Size")) {
      this.size = variable_slide.getValueF();
    } else if (setting.equals("Speed")) {
      this.speed = variable_slide.getValueF();
    }
  }
  
  void drawAnimal() {
    fill(animalColour);
    //draw head
    rect(this.xPos, this.yPos, this.size, this.size);
    //draw body
    rect(this.xPos + this.size, this.yPos - (this.size/2), this.size * 3, this.size * 2);
  }
  
  void createChild(Animal partner) {
    boolean tempGender;
    float tempSize;
    float tempVision = ((this.vision + partner.vision) / 2) * random(0.8, 1.2);
    float tempSpeed = ((this.speed + partner.speed) / 2)  * random(0.8, 1.2);
    float tempAggression = ((this.aggression + partner.aggression) / 2) * random(0.8, 1.2);
      float tempBreedingRate = ((this.breedingRate + partner.breedingRate) / 2) * random(0.8, 1.2);
    float tempRed = (red(this.animalColour) + red(partner.animalColour)) / 2;
    float tempGreen = (green(this.animalColour) + green(partner.animalColour)) / 2;
    float tempBlue = (blue(this.animalColour) + blue(partner.animalColour)) / 2;
    if (int(random(0,2)) == 0 ) {
      tempGender = true;
      tempSize = ((this.size + partner.size) / 2) * random(0.6, 1);
    
    } else {
      tempGender = false;
      tempSize = ((this.size + partner.size) / 2) * random(1, 1.6);

    }
    animals.add(new Animal(tempBreedingRate, tempSpeed, tempSize / 10, tempGender, tempAggression, tempVision, color(tempRed, tempGreen, tempBlue), this.xPos - random(-30, 30), this.yPos - random(-30, 30), tempSize));
  }

  void choosePartner() {
    if (this.gender && this.age > 1500 && this.hunger < 15 && timePassedSinceBred >= this.breedingRate) {
      for (Animal a : animals) {
        float dist = sqrt(pow((this.xPos - a.xPos), 2) + pow((this.yPos - a.yPos), 2));
        if (a.timePassedSinceBred >= a.breedingRate && dist < this.vision && !a.gender && a.age > 1500) {
          this.partner = a;
          this.timePassedSinceBred = 0;
          this.partner.timePassedSinceBred = 0;
          break;
        }
      }
    }
  }
  
  void calculateBirths() {
    try {
      float dist = sqrt(pow((this.xPos - this.partner.xPos), 2) + pow((this.yPos - this.partner.yPos), 2));
      if (dist < 10) {
          inLabour.add(this);
          //this.currentSpeed.x = random(0, 4);
          //this.currentSpeed.y = sqrt(pow(this.speed, 2) - pow(this.currentSpeed.x, 2));
          this.currentSpeed = new PVector(0, 0);
        }
      else if (this.vision > dist) {
          this.currentSpeed.x = (this.xPos - this.partner.xPos) / this.speed * -1;
          this.currentSpeed.y = (this.yPos - this.partner.yPos) / this.speed * -1;
          this.xPos += this.currentSpeed.x;
          this.yPos += this.currentSpeed.y;
        }
      }
  
  catch (Exception e) {
    choosePartner();
  }
}
  
  void eat() {
    if (foods.size() > 0) {
      this.chooseFood();
      if (foods.contains(target)) {
        if (this.target.getDist(this) < this.aggression) {
          for (Animal a: animals) {
            if (a.target == this.target && a.aggression * a.size > this.aggression * this.size && target.getDist(a) < a.aggression * 1.5) {
              target = new Food (700, 700);
              break;
            }
          }
          if (target.xPos < 700) {
            this.hunger -= this.target.nutrition;
            foods.remove(foods.indexOf(this.target));
            this.target = new Food (700, 700);
            //this.currentSpeed.x = random(0, 4);
            //this.currentSpeed.y = sqrt(pow(this.speed, 2) - pow(this.currentSpeed.x, 2));
            this.currentSpeed = new PVector(0, 0);
          }
        }
        
        else if (this.vision > this.target.getDist(this)){
          this.currentSpeed.x = (this.xPos - this.target.xPos) / this.speed * -1;
          this.currentSpeed.y = (this.yPos - this.target.yPos) / this.speed * -1;
          moveAnimal();
        }
      }
    }
  }
  
  
  void chooseFood () {
    if (!foods.contains(target)) 
      target = new Food (700, 700);
    for (Food f: foods) {
      if (f.getDist(this) < this.vision && f.getDist(this) < this.target.getDist(this)) {
        target = f;  
      }
    }
  }
  void updateStats() {
    if (this.size < this.finalSize) {
      this.hunger += 0.02 * this.finalSize;
      if (this.age % 150 == 0)
        this.size += this.finalSize / 10; 
    } else {
      this.hunger += 0.01 * this.size;
    }
    this.age += 1;
    this.timePassedSinceBred++;
  }
  
  void updatePosition() {
  }
  
  void moveAnimal () {
    this.xPos += currentSpeed.x;
    this.yPos += currentSpeed.y;
  }
  
  void calculateDeaths() {
    if (this.hunger > 100 || this.age > 3500) {
      dying.add(this);
    }
  }
}          
