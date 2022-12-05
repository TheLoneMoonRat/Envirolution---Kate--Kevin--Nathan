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
  Food target;
  boolean gender;
  String foodSource;
  
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
    float tempVision = ((this.vision + partner.vision) / 2) * random(0.8, 1.2);
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
    animals.add(new Animal(tempBreedingRate, tempSpeed, tempSize, tempGender, tempAggression, tempVision, color(tempRed, tempGreen, tempBlue), this.xPos, this.yPos));
  }

  void calculateBirths() {
    if (this.gender && this.age > 5 && this.hunger < 5 && timePassed >= this.breedingRate) {
      //boolean gaveBirth = false;
      for (Animal a : animals) {
        float dist = sqrt(pow((this.xPos - a.xPos * -1), 2) + pow((this.yPos - a.yPos * -1), 2));
      
        if (a.timePassedSinceBred >= breedingRate && this.vision > dist && !a.gender &&a.age > 300) {
          //for (int x = 0; x < this.babyAmt; x++) 
          this.createChild(a);
          println("I can't see");
        
          this.timePassedSinceBred = 0;
          a.timePassedSinceBred = 0;
          //gaveBirth = true;
        }          
      }
    }
  }
  
  void eat() {
    this.chooseFood();
    if (target.getDist(this) < 10) {
      this.hunger -= target.nutrition;
      foods.remove(target);
      target = new Food (700, 700);
      this.currentSpeed = new PVector(0, 0);
    }
    
    else if (target.xPos < 700){
      if (currentSpeed.x == 0 && currentSpeed.y == 0) {
        this.currentSpeed.x = (this.xPos - target.xPos) / this.speed;
        this.currentSpeed.y = (this.yPos - target.yPos) / this.speed;
      } else {
        this.xPos -= currentSpeed.x;
        this.yPos -= currentSpeed.y;
      }
    }
  } 
  
  void chooseFood () {
    for (Food f: foods) {
      if (f.getDist(this) < this.vision && f.getDist(this) < target.getDist(this)) {
        target = f;  
      }
    }
  }
  
  void updateStats() {
    this.hunger += 0.01 * size;
    this.age += 1;
  }
  
  void updatePosition() {
    float dist =  sqrt(pow((this.xPos - width/2), 2) + pow((this.yPos - height/2), 2));
    if (dist >= 250)
      speed *= -1;
      
    this.xPos += speed;
    this.yPos += speed;
  }
  
  void calculateDeaths() {
    if (this.hunger > 10 || this.age > 30) 
      animals.remove(this);
  }
}
          
