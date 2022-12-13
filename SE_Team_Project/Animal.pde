class Animal {
  //Fields
  int age;   
  int timePassedSinceBred;   //how long since it has bred
  int lifespan;   //how long it has to live
  float vision;   //how many pixels it can see
  float breedingRate;   //how long it takes inbetween breeding
  float speed;   //how fast it is
  float hunger;   //how hungry it currently is
  float xPos;   
  float yPos;
  float size;   //how large it is
  float aggression;   //how aggresive it is
  float finalSize;   //how large it will be when it stops growing
  float red;   //red colour
  float green;   //green colour
  float blue;   //blue colour
  PVector currentSpeed;  
  PVector currentLocation; 
  boolean gender;
  Food target;   //what piece of food it is currently targeting
  Animal partner;   //what its current partner is
 
  //Constructors
  Animal(float br, float sp, float si, boolean ge, float ag, float vs, float r, float g, float b, float x, float y) {
    this.age = 0;
    this.breedingRate = br;
    this.speed = sp;
    this.hunger = 0;
    this.size = si;
    this.gender = ge;
    this.aggression = ag;
    this.timePassedSinceBred = 0;
    this.vision = vs;
    this.red = r;
    this.green = g;
    this.blue = b;
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
  
  Animal(float br, float sp, float si, boolean ge, float ag, float vs, float r, float g, float b, float x, float y, float fs) {
    this.age = 0;
    this.breedingRate = br;
    this.speed = sp;
    this.hunger = 0;
    this.size = si;
    this.gender = ge;
    this.aggression = ag;
    this.timePassedSinceBred = 0;
    this.vision = vs;
    this.red = r;
    this.green = g;
    this.blue = b;
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

  //Draw Animal
  void drawAnimal() {
    fill(this.red, this.green, this.blue);
    circle(this.xPos, this.yPos, this.size * 3);
  }

  //Create Child
  void createChild(Animal partner) {
    //Temporrary Variables
    boolean tempGender;
    float tempSpeed;
    float tempSize;
    float tempAggression;
    float tempVision = ((this.vision + partner.vision) / 2) * random(0.8, 1.2);
    float tempBreedingRate = ((this.breedingRate + partner.breedingRate) / 2) * random(0.8, 1.2);
    float tempRed;
    float tempGreen;
    float tempBlue;
    
    //Skew Child's Traits
    if (int(random(0, 100)) < 55 ) {
      //Calculate Traits
      tempGender = true;    
      tempSize = ((this.size + this.partner.size) / 2) * random(0.6, 1.2);
      tempSpeed = ((this.speed + this.partner.speed) / 2)  * random(0.6, 1.0);
      tempAggression = ((this.aggression + this.partner.aggression) / 2) * random(0.4, 0.8);
      tempRed = ( 0.2 * this.red + this.partner.red * 1.8) / 2;
      tempGreen = (0.2 * this.green + this.partner.green * 1.8) / 2;
      tempBlue = (0.2 * this.blue + this.partner.blue * 1.8) / 2;
    } 
    else {
      //Calculate Traits
      tempGender = false;
      tempSize = ((this.size + this.partner.size) / 2) * random(1, 1.6);
      tempSpeed = ((this.speed + this.partner.speed) / 2)  * random(1.0, 1.4);
      tempAggression = ((this.aggression + this.partner.aggression) / 2) * random(1.2, 1.6);
      tempRed = ( 1.8 * this.red + this.partner.red * 0.2) / 2;
      tempGreen = (1.8 * this.green + this.partner.green * 0.2) / 2;
      tempBlue = (1.8 * this.blue + this.partner.blue  * 0.2) / 2;
    }
    //Create New Animal
    animals.add(new Animal(tempBreedingRate, tempSpeed, tempSize / 10, tempGender, tempAggression, tempVision, tempRed, tempGreen, tempBlue, this.xPos - random(-20, 20), this.yPos - random(-20, 20), tempSize));
  }

  //Choose Partner When It's Time to Breed
  void choosePartner() {
    //Make Sure Animal Can Breed
    if (!this.gender && this.age > 1500 && this.hunger < 15 && timePassedSinceBred >= this.breedingRate) {
      
      //Calculate If There Are Nearby Mates
      for (Animal a : animals) {
        float dist = sqrt(pow((this.xPos - a.xPos), 2) + pow((this.yPos - a.yPos), 2));
        
        //If a Suitable Mate is Found
        if (a.timePassedSinceBred >= a.breedingRate && dist < this.vision && a.gender && a.age > 1500) {
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

  //Calculate Births For Each Frame
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

  //Eat
  void eat() {
    if (foods.size() > 0) {
      this.chooseFood();   //get target for food
      if (target.foodColour != color(0)) {
        if (target.getDist(this) < this.aggression) {
          for (Animal a: animals) {
            if (a.target == this.target && a.aggression *a.size > this.aggression * this.size && target.getDist(a) < a.aggression * 1.5) {
              target = new Food(700, 700);
              break;
            }
          }
          if (target.xPos < 700) {
            this.hunger -= target.nutrition;   //eat target food
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
  
  //Move Animal Randomly
  void moveAnimal() {
    this.xPos += currentSpeed.x;
    this.yPos += currentSpeed.y;
  }

  //Choose Food from Nearby
  void chooseFood () {
    for (Food f : foods) {
      if (f.getDist(this) < this.vision && f.getDist(this) < target.getDist(this)) {
        target = f;
      }
    }
  }

  //Update Stats For Each Frame
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


  //Update Position
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
  
  //Calculate Distances Function
  float calcDist(float x1, float x2, float y1, float y2) {
    return(sqrt(pow((x1 - x2), 2) + pow((y1 - y2), 2)));
  }
  
  //Migrate Animals Based off Season
  void setPosition() {
    PVector newPosition = new PVector(random(season.lowLocation.x, season.highLocation.x), random(season.lowLocation.y, season.highLocation.y));
    while (calcDist(xPos, newPosition.x, yPos, newPosition.y) < 70) {
      newPosition.x = random(season.lowLocation.x, season.highLocation.x);
      newPosition.y = random(season.lowLocation.y, season.highLocation.y);
    }
    this.currentLocation.x = newPosition.x;
    this.currentLocation.y = newPosition.y;
  }
  
  //Calculate Deaths
  void calculateDeaths() {
    if (this.hunger > 100 || this.age > this.lifespan) {
      dying.add(this);
      if (selected.size() != 0) {
        if (selected.get(0) == this) {
          selected.clear();
        }
      }
    }
  }
}          
