import g4p_controls.*;

//Global Variables (Don't Change These!)
String season;
int bounty;
int simSpeed = 60;
int population;
int timePassed;
int speed;
int size;
float breedingRate;
float agression;
float vision;
float nutritionAdjuster;
float foodRate;
ArrayList<Animal> animals;
ArrayList<Animal> inLabour;
ArrayList<Animal> dying;
ArrayList<Food> foods;
ArrayList<Animal> selected;
ArrayList<Food> decay;
String setting;
boolean gender;
Habitat field;

PImage background1; 
PImage background2;
boolean titleScreen = true;
boolean instructionScreen = false;
boolean setupScreenEnvironment = false;
boolean setupScreenAnimals = false;
boolean simulation = false;
boolean hungerTag = true;
boolean ageTag = false;
boolean play = true;


void setup() {
  //Visual Setup
  size(700, 700);
  frameRate(simSpeed);
  background1 = loadImage("tree.jpg");
  background2 = loadImage("leaves.jpg");
  createGUI();
  clearForStart();

  //Create Array Lists
  animals = new ArrayList<Animal>();
  foods = new ArrayList<Food>();  
  selected = new ArrayList<Animal>();
  inLabour = new ArrayList<Animal>();
  dying = new ArrayList<Animal>();
  decay = new ArrayList<Food>();
  breedingRate = 0;
  
  //Create Animals
  animals.add(new Animal(1000 + breedingRate, 3, 8, false, 10, 300, color(92, 64, 51), random(250, 350), random(150, 500))); //male animal
  animals.add(new Animal(1000 + breedingRate, 2, 5, true, 4, 300, color(210, 180, 140), random (250, 350), random(150, 500))); //female animal
  //breeding rate, speed, size, gender (false == male), aggression, vision, colour, x coordinate, y coordinate
 
  //Create Habitat
  field = new Habitat(5, -5, 5);
  foodRate = growthRate.getValueF();
}


void draw() {
  //Genral Setup
  noStroke();
  guiUpdate();
  
  //Background for Title and Instruction Screens
  if (titleScreen || instructionScreen) 
    image(background1, 0, 0);
    
  if (setupScreenEnvironment || setupScreenAnimals) 
    image(background2, 0, 0);
  
  //While on Title Screen
  if (titleScreen) {
    PFont myFont = createFont("Impact", 80);
    textFont(myFont);
    text("ENVIROLUTION", 125, 150);
    
    instructionsButton.setVisible(true);
    startButton.setVisible(true);
  }
  
  //While on Instruction Screen
  else if (instructionScreen) {
    instructions.setVisible(true);
    returnButton.setVisible(true);
  }
  
  //While on Environment Setup Screen
  else if (setupScreenEnvironment) {
    growthRate.setVisible(true);
    nutrition_.setVisible(true);
    averageTemp.setVisible(true);
    tempRange.setVisible(true);
    humidity_.setVisible(true);
    medow.setVisible(true);
    artic.setVisible(true);
    beginButton.setVisible(true);
    backButton.setVisible(true);
    growthRateText.setVisible(true);
    nutritionText.setVisible(true);
    humidityText.setVisible(true);
    avgTempText.setVisible(true);
    tempRangeText.setVisible(true);
    
    fill(255);
    PFont myFont1 = createFont("Impact", 40);
    textFont(myFont1);
    text("Environment", 100, 165);
  }
  
  //While on Animal Setup Screen
  else if (setupScreenAnimals) {
    breedingRate1.setVisible(true);
    litterSize1.setVisible(true);
    breedingRate2.setVisible(true);
    litterSize2.setVisible(true);
    animal1Traits.setVisible(true);
    animal1Trait.setVisible(true);
    animal2Traits.setVisible(true);
    animal2Trait.setVisible(true);
    sheepButton.setVisible(true);
    frogButton.setVisible(true);
    polarBearButton.setVisible(true);
    avgInnerTemp1.setVisible(true);
    avgInnerTemp2.setVisible(true);
    beginButton.setText("Start");
    breedingRate1Text.setVisible(true);
    breedingRate2Text.setVisible(true);
    litterSize1Text.setVisible(true);
    litterSize2Text.setVisible(true);
    temp1Text.setVisible(true);
    temp2Text.setVisible(true);
    
    fill(255);
    PFont myFont1 = createFont("Impact", 40);
    textFont(myFont1);
    text("Animals", 115, 165);
    
    PFont myFont2 = createFont("Impact", 30);
    textFont(myFont2);
    text("1)", 80, 222);
    text("2)", 80, 352);
  }
  
  //While Simulation is Running
  if (simulation) {
    pauseButton1.setVisible(true);
    resetButton1.setVisible(true);
    showVariables1.setVisible(true);
    shouldVariables.setVisible(true);
    breedingRates.setVisible(true);
    litterSize.setVisible(true);
    animalTrait.setVisible(true);
    animalTraits.setVisible(true);
    animationSpeed.setVisible(true);
    breedingRateText.setVisible(true);
    litterSizeText.setVisible(true);
    animationSpeedText.setVisible(true);
    
    background(150, 150, 255);
    fill(0, 0, 250);
    rect(50, 94, 600, 512);
  }
  
  //Animation
  if (play && simulation) {
    fill(field.getColour());
    circle(350, 350, 500);
  
    //Update Animals
    for (Animal a : animals) {
      a.updateStats();
      a.drawAnimal();
      a.updatePosition();
      if (a.hunger > 20) {
        a.eat();
      }
      a.calculateBirths();
      a.calculateDeaths();
    }
  
    //Birth and Death
    for (Animal a: inLabour) {
      for (int i = 0; i < size; i++) {
        a.createChild(a.partner);  
      }
      a.partner = null; 
    }
    for (Animal a: dying) {
      animals.remove(animals.indexOf(a));
    }
    dying.clear();
    inLabour.clear();
  
    for (Food f: foods) {
      f.drawFood();
    }
    if (timePassed % foodRate == 0) 
      createFood();
    
    timePassed++;
    updateLabel();
  
    //Mouse Hovering Over Animal
    for (Animal a: animals) {
      if (a.xPos + a.size < mouseX && mouseX < (a.xPos + a.size) * 3) {
        if (a.yPos - (a.size/2) < mouseY && mouseY < a.yPos - (a.size/2) + a.size *2) {
          noFill();
          strokeWeight(2.5);
          stroke(255, 215, 0);
          circle(a.xPos + a.size * 2, a.yPos + (a.size/2), a.size * 5);
          stroke(0);
          strokeWeight(1);
        }
      }
    }
  }
}

void mouseClicked() {
  selected.clear();
  for (Animal a: animals) {
    if (a.xPos + a.size < mouseX && mouseX < (a.xPos + a.size) * 3) {
      if (a.yPos - (a.size/2) < mouseY && mouseY < a.yPos - (a.size/2) + a.size *2) {
        selected.add(a);
      }
    }
  }
}

void guiUpdate() {
  for (Animal a: selected) {
    if (setting.equals("Aggression")) {
      a.aggression = animal1Traits.getValueF();
    } else if (setting.equals("Size")) {
      a.size = animal1Traits.getValueF();
    } else if (setting.equals("Speed")) {
      a.speed = 85 - animal1Traits.getValueF();
    } else if (setting.equals("Vision")) {
      a.vision = animal1Traits.getValueF();
    }
  }
  
}

void createFood2() {
  float nutritionValue = random(40 + nutritionAdjuster, 80 + nutritionAdjuster);
  float dist = 500;
  float x = 0;
  float y = 0;
  
  while (dist >= 230) {
    x = random(150, 500);
    y = random(150, 500);
    dist = sqrt(pow(x - width/2, 2) + pow(y - height/2, 2));
  }
    
  foods.add(new Food(nutritionValue, 10, color((nutritionValue / (80 + nutritionAdjuster)) * 255, 252, 3), x, y));
}

//Update Labels Above Animals
void updateLabel() {
  if (hungerTag) {
    for (Animal a: animals) {
      fill(a.animalColour);
      textSize(a.size * 3);
      text(int(a.hunger), a.xPos, a.yPos - a.size * 3);
    }
  }
  if (ageTag) {
    for (Animal a: animals) {
      fill(a.animalColour);
      textSize(a.size * 3);
      text(int(a.age), a.xPos, a.yPos - a.size * 3);
    }
  }
}

//Reset the Simulation
void reset() {
  animals.clear();
  foods.clear();
  animals.add(new Animal(1000 + breedingRate, 5, 8, false, 10, 300, color(92, 64, 51), random(250, 350), random(150, 500))); //male animal
  animals.add(new Animal (1000 + breedingRate, 3, 5, true, 4, 300, color(210, 180, 140), random (250, 350), random(150, 500))); //female animal
}
  
//Clear GUI Screen
void clearEnvironmentSetupScreen () {
  growthRate.setVisible(false);
  nutrition_.setVisible(false);
  averageTemp.setVisible(false);
  tempRange.setVisible(false);
  humidity_.setVisible(false);
  medow.setVisible(false);
  artic.setVisible(false);
  growthRateText.setVisible(false);
  nutritionText.setVisible(false);
  humidityText.setVisible(false);
  avgTempText.setVisible(false);
  tempRangeText.setVisible(false);
}

//Clear GUI Screen
void clearAnimalsSetupScreen () {
  breedingRate1.setVisible(false);
  litterSize1.setVisible(false);
  breedingRate2.setVisible(false);
  litterSize2.setVisible(false);
  animal1Traits.setVisible(false);
  animal1Trait.setVisible(false);
  animal2Traits.setVisible(false);
  animal2Trait.setVisible(false);
  sheepButton.setVisible(false);
  frogButton.setVisible(false);
  polarBearButton.setVisible(false);
  avgInnerTemp1.setVisible(false);
  avgInnerTemp2.setVisible(false);
  beginButton.setVisible(false);
  backButton.setVisible(false);
  breedingRate1Text.setVisible(false);
  breedingRate2Text.setVisible(false);
  litterSize1Text.setVisible(false);
  litterSize2Text.setVisible(false);
  temp1Text.setVisible(false);
  temp2Text.setVisible(false);
}

//Clear GUI Screen
void clearForStart() {
  instructions.setVisible(false);
  returnButton.setVisible(false);
  growthRate.setVisible(false);
  nutrition_.setVisible(false);
  averageTemp.setVisible(false);
  tempRange.setVisible(false);
  humidity_.setVisible(false);
  medow.setVisible(false);
  artic.setVisible(false);
  breedingRate1.setVisible(false);
  litterSize1.setVisible(false);
  breedingRate2.setVisible(false);
  litterSize2.setVisible(false);
  animal1Traits.setVisible(false);
  animal1Trait.setVisible(false);
  animal2Traits.setVisible(false);
  animal2Trait.setVisible(false);
  pauseButton1.setVisible(false);
  resetButton1.setVisible(false);
  showVariables1.setVisible(false);
  shouldVariables.setVisible(false);
  breedingRates.setVisible(false);
  litterSize.setVisible(false);
  animalTrait.setVisible(false);
  animalTraits.setVisible(false);
  sheepButton.setVisible(false);
  frogButton.setVisible(false);
  polarBearButton.setVisible(false);
  avgInnerTemp1.setVisible(false);
  avgInnerTemp2.setVisible(false);
  animationSpeed.setVisible(false);
  beginButton.setVisible(false);
  backButton.setVisible(false);
  
  
  breedingRateText.setVisible(false);
  litterSizeText.setVisible(false);
  growthRateText.setVisible(false);
  nutritionText.setVisible(false);
  humidityText.setVisible(false);
  avgTempText.setVisible(false);
  tempRangeText.setVisible(false);
  breedingRate1Text.setVisible(false);
  breedingRate2Text.setVisible(false);
  litterSize1Text.setVisible(false);
  litterSize2Text.setVisible(false);
  temp1Text.setVisible(false);
  temp2Text.setVisible(false);
  animationSpeedText.setVisible(false);
}
