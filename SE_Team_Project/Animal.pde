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
    float tempVision = ((this.vision + partner.vision) / 2) * random(0.8, 1.2);
    float tempSpeed = ((this.speed + partner.speed) / 2)  * random(0.8, 1.2);
    float tempAggression = ((this.aggression + partner.aggression) / 2) * random(0.8, 1.2);
    float tempSize = ((this.size + partner.size) / 2) * random(0.8, 1.2);
    float tempBreedingRate = ((this.breedingRate + partner.breedingRate) / 2) * random(0.8, 1.2);
    float tempRed = (red(this.animalColour) + red(partner.animalColour)) / 2;
    float tempGreen = (green(this.animalColour) + green(partner.animalColour)) / 2;
    float tempBlue = (blue(this.animalColour) + blue(partner.animalColour)) / 2;
    if (int(random(0, 2)) == 0 ) {
      tempGender = true;
    } else {
      tempGender = false;
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
        this.currentSpeed.x = random(-2, 2);
        this.currentSpeed.y = sqrt(pow(this.speed, 2) - pow(this.currentSpeed.x, 2));
      } else if (this.vision > dist) {
        this.currentSpeed.x = (this.xPos - this.partner.xPos) / (this.speed * -15);
        this.currentSpeed.y = (this.yPos - this.partner.yPos) / (this.speed * -15);
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
            if (lastSeason.contains(target))
              lastSeason.remove(target);
            target = new Food (700, 700);
          }
          this.currentSpeed.x = random(-2, 2);
          this.currentSpeed.y = sqrt(pow(this.speed, 2) - pow(this.currentSpeed.x, 2));
        } else if (this.vision > target.getDist(this)) {
          this.currentSpeed.x = (this.xPos - target.xPos) / (this.speed * -10);
          this.currentSpeed.y = (this.yPos - target.yPos) / (this.speed * -10);
          moveAnimal();
        }
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
      else
        this.finalSize *= 0.9;
    } else {
      this.hunger += 0.01 * this.size;
    }
    this.age += 1;
    this.timePassedSinceBred++;
  }

  void updatePosition() {
    float dist =  sqrt(pow((this.xPos - width/2), 2) + pow((this.yPos - height/2), 2));
    if (dist >= 245) {
      if (this.xPos < width/2 && this.yPos < height/2) {
        this.currentSpeed.x = random(0, 2);
        this.currentSpeed.y = sqrt(pow(this.speed, 2) - pow(this.currentSpeed.x, 2));
      } else if (this.xPos > width/2 && this.yPos < height/2) {
        this.currentSpeed.x = random(-2, 0);
        this.currentSpeed.y = sqrt(pow(this.speed, 2) - pow(this.currentSpeed.x, 2));
      } else if (this.xPos > width/2 && this.yPos > height/2) {
        this.currentSpeed.x = random(-2, 0);
        this.currentSpeed.y = sqrt(pow(this.speed, 2) - pow(this.currentSpeed.x, 2)) * -1;
      } else if (this.xPos < width/2 && this.yPos > height/2) {
        this.currentSpeed.x = random(0, 2);
        this.currentSpeed.y = sqrt(pow(this.speed, 2) - pow(this.currentSpeed.x, 2)) * -1;
      }
    }

    moveAnimal();
  }

  void calculateDeaths() {
    if (this.hunger > 100 || this.age > 3500) {
      this.animalColour = color(0);
      dying.add(this);
    }
  }
}          
