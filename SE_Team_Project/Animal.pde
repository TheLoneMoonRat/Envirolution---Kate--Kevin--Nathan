class Animal {
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
  PVector currentLocation; 
  Food target;
  boolean gender;
  String foodSource;
  Animal partner;
  float finalSize;
  int lifespan;

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
    this.currentLocation = new PVector(0, 0);
    this.target = new Food(700, 700);
    this.partner = null;
    this.finalSize = this.size;
    this.lifespan = 3500;

    this.currentSpeed.x = random(-2, 2);
    this.currentSpeed.y = sqrt(pow(this.speed, 2) - pow(this.currentSpeed.x, 2));
  }
  Animal(float br, float sp, float si, boolean ge, float ag, float vs, color co, float x, float y, float fs) {
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
    this.finalSize = fs;
    this.lifespan = 3500 - (int(aggression) * 20);
    this.currentLocation = new PVector(random(season.lowLocation.x, season.highLocation.x), random(season.lowLocation.y, season.highLocation.y));
    this.currentSpeed.x = random(-2, 2);
    this.currentSpeed.y = sqrt(pow(this.speed, 2) - pow(this.currentSpeed.x, 2));
  }

  //methods
  void guiUpdate() {
    if (setting.equals("Aggression")) {
      this.aggression = animal1Traits.getValueF();
    } else if (setting.equals("Size")) {
      this.size = animal1Traits.getValueF();
    } else if (setting.equals("Speed")) {
      this.speed = animal1Traits.getValueF();
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
    float tempSpeed;
    float tempSize;
    float tempAggression;
    float tempVision = ((this.vision + partner.vision) / 2) * random(0.8, 1.2);
    float tempBreedingRate = ((this.breedingRate + partner.breedingRate) / 2) * random(0.8, 1.2);
    float tempRed;
    float tempGreen;
    float tempBlue;
    if (int(random(0, 100)) < 55 ) {
      tempGender = true;    
      tempSize = ((this.size + this.partner.size) / 2) * random(0.6, 1.2);
      tempSpeed = ((this.speed + this.partner.speed) / 2)  * random(0.6, 1.0);
      tempAggression = ((this.aggression + this.partner.aggression) / 2) * random(0.4, 0.8);
      tempRed = ( 0.2 * red(this.animalColour) + red(this.partner.animalColour) * 1.8) / 2;
      tempGreen = (0.2 *green(this.animalColour) + green(this.partner.animalColour) * 1.8) / 2;
      tempBlue = (0.2 * blue(this.animalColour) + blue(this.partner.animalColour) * 1.8) / 2;
    } else {
      tempGender = false;
      tempSize = ((this.size + this.partner.size) / 2) * random(1, 1.6);
      tempSpeed = ((this.speed + this.partner.speed) / 2)  * random(1.0, 1.4);
      tempAggression = ((this.aggression + this.partner.aggression) / 2) * random(1.2, 1.6);
      tempRed = ( 1.8 * red(this.animalColour) + red(this.partner.animalColour) * 0.2) / 2;
      tempGreen = (1.8 *green(this.animalColour) + green(this.partner.animalColour) * 0.2) / 2;
      tempBlue = (1.8 *blue(this.animalColour) + blue(this.partner.animalColour) * 0.2) / 2;
    }
    animals.add(new Animal(tempBreedingRate, tempSpeed, tempSize / 10, tempGender, tempAggression, tempVision, color(tempRed, tempGreen, tempBlue), this.xPos - random(-20, 20), this.yPos - random(-20, 20), tempSize));
  }

  void choosePartner() {
    if (!this.gender && this.age > 1500 && this.hunger < 15 && timePassedSinceBred >= this.breedingRate) {
      //boolean gaveBirth = false;
      for (Animal a : animals) {
        float dist = sqrt(pow((this.xPos - a.xPos), 2) + pow((this.yPos - a.yPos), 2));
        if (a.timePassedSinceBred >= a.breedingRate && dist < this.vision && a.gender && a.age > 1500) {
          //for (int x = 0; x < this.babyAmt; x++) 
          this.partner = a;
          for (Animal b: animals)
            if (!b.gender && calcDist(b.xPos, a.xPos, b.yPos, a.yPos) < b.vision && b.size > this.size) {
              this.partner = null;
              b.partner = a;
              b.timePassedSinceBred = 0;
              b.partner.timePassedSinceBred = 0;
              break;
            }
          this.timePassedSinceBred = 0;
          if (this.partner != null)
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
        this.currentSpeed.x = random(-2, 2);
        this.currentSpeed.y = sqrt(pow(this.speed, 2) - pow(this.currentSpeed.x, 2));
      } else if (this.vision > dist) {
        this.currentSpeed.x = (this.xPos - this.partner.xPos) / (this.speed * -7);
        this.currentSpeed.y = (this.yPos - this.partner.yPos) / (this.speed * -7);
        moveAnimal();
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
        if (target.getDist(this) < this.aggression) {
          for (Animal a: animals) {
            if (a.target == this.target && a.aggression *a.size > this.aggression * this.size && target.getDist(a) < a.aggression * 1.5) {
              target = new Food(700, 700);
              break;
            }
          }
          if (target.xPos < 700) {
            this.hunger -= target.nutrition;
            foods.remove(target);
            if (season.lastSeason.contains(target))
              season.lastSeason.remove(target);
            target = new Food (700, 700);
          }
          this.currentSpeed.x = random(-2, 2);
          this.currentSpeed.y = sqrt(pow(this.speed, 2) - pow(this.currentSpeed.x, 2));
        } else if (this.vision > target.getDist(this)) {
          this.currentSpeed.x = (this.xPos - target.xPos) / (this.speed * -7);
          this.currentSpeed.y = (this.yPos - target.yPos) / (this.speed * -7);
          moveAnimal();
        }
      } else {
        target = new Food (700, 700);
        updatePosition();
      }
    }
  }
  
  void moveAnimal() {
    this.xPos += currentSpeed.x;
    this.yPos += currentSpeed.y;
  }


  void chooseFood () {
    for (Food f : foods) {
      if (f.getDist(this) < this.vision && f.getDist(this) < target.getDist(this)) {
        target = f;
      }
    }
  }

  void updateStats() {
    if (this.size < this.finalSize) {
      this.hunger += 0.05 * this.finalSize;
      if (this.age % 150 == 0)
        if (this.age < 50 || this.hunger < 20) 
          this.size += this.finalSize / 10;
        else if (this.hunger > 20 && this.age > 50)
          this.finalSize *= 0.9;
    } else {
      this.hunger += 0.01 * this.size;
    }
    this.age += 1;
    this.timePassedSinceBred++;
  }


  void updatePosition() {
    if (this.target.xPos == 700 && this.partner == null) {
      float dist = calcDist(this.xPos, this.currentLocation.x, this.yPos, this.currentLocation.y);
      if (dist > 30) {
          if (this.xPos < this.currentLocation.x - 15) {
            this.currentSpeed.x = this.speed / 3;
          } else if (this.xPos > this.currentLocation.x + 15) {
            this.currentSpeed.x = -this.speed / 3;
          }
          if (this.yPos < this.currentLocation.y - 15) 
            this.currentSpeed.y = this.speed / 3;
          else if (this.yPos > this.currentLocation.y + 15)
            this.currentSpeed.y = -this.speed / 3;
            
        moveAnimal();
      } else { 
        this.setPosition();
      }
    }
  }
  
  float calcDist(float x1, float x2, float y1, float y2) {
    return(sqrt(pow((x1 - x2), 2) + pow((y1 - y2), 2)));
  }
  
  void setPosition() {
    PVector newPosition = new PVector(random(season.lowLocation.x, season.highLocation.x), random(season.lowLocation.y, season.highLocation.y));
    while (calcDist(xPos, newPosition.x, yPos, newPosition.y) < 70) {
      newPosition.x = random(season.lowLocation.x, season.highLocation.x);
      newPosition.y = random(season.lowLocation.y, season.highLocation.y);
    }
    this.currentLocation.x = newPosition.x;
    this.currentLocation.y = newPosition.y;
  }
  
  void calculateDeaths() {
    if (this.hunger > 100 || this.age > this.lifespan) {
      dying.add(this);
    }
  }
}          
