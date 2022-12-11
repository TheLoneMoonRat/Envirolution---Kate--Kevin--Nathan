import g4p_controls.*;

//Global Variables (Don't Change These!)
int simSpeed = 60;
int timePassed;
int size;
Season season;
float breedingRate;
float nutritionAdjuster;
float foodRate;
ArrayList<Animal> animals;
ArrayList<Animal> inLabour;
ArrayList<Animal> dying;
ArrayList<Food> foods;
ArrayList<Animal> selected;
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
boolean genderTag = false;
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
  season = new Season();
  breedingRate = 0;
  setting = "Aggression";
  size = 1;
  
  //Create Animals
  animals.add(new Animal(breedingRate1.getValueF() * breedingRate1.getValueF(), 3, 8, false, 10, 300, color(92, 64, 51), random(250, 350), random(150, 500))); //male animal
  animals.add(new Animal(breedingRate2.getValueF() * breedingRate2.getValueF(), 2, 5, true, 4, 300, color(210, 180, 140), random (250, 350), random(150, 500))); //female animal
  //breeding rate, speed, size, gender (false == male), aggression, vision, colour, x coordinate, y coordinate
 
  //Create Habitat
  field = new Habitat(5, -5, 5);
  foodRate = growthRate.getValueF();
}


void draw() {
  
  //Genral Setup
  frameRate(simSpeed);
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
    environmentSetup();
    
    fill(255);
    PFont myFont1 = createFont("Impact", 40);
    textFont(myFont1);
    text("Environment", 100, 165);
  }
  
  //While on Animal Setup Screen
  else if (setupScreenAnimals) {
    animalsSetup();
    
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
    simulationSetup();
    background(150, 150, 255);
    fill(0, 0, 250);
    rect(50, 94, 600, 512);
    if (!play) {
      fill(field.getColour());
      circle(350, 350, 500);
      for (Food f: foods) {
        f.drawFood();
      }
      for (Animal a : animals) {
        a.drawAnimal();
      }
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
     guiUpdate();
     updateLabel();
    }
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
      if (foods.size() > animals.size()) {
        for (int i = 0; i < size; i++) {
          a.createChild(a.partner);  
        }
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
    
    season.getSeason();
    if (timePassed % foodRate == 0) {
      for (int i = season.bounty; i > 0; i--) 
        season.createFood();
    }
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
  if (mouseY < 600)
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
  if (selected.size() > 0) {
    if (setting.equals("Aggression")) {
      selected.get(0).aggression = animalTraits.getValueF();
    } else if (setting.equals("Size")) {
      selected.get(0).size = animalTraits.getValueF();
    } else if (setting.equals("Speed")) {
      selected.get(0).speed = 85 - animalTraits.getValueF();
    } else if (setting.equals("Vision")) {
      selected.get(0).vision = animalTraits.getValueF();
    }
  }
}


//Update Labels Above Animals
void updateLabel() {
  noStroke();
  float averageSizeMale = 0;
  float averageSizeFemale = 0;
  float averageVision = 0;
  float averageSpeed = 0;
  float averageAggression = 0;
  float averageRed = 0;
  float averageGreen = 0;
  float averageBlue = 0;
  float animalCount = 0;
  float femaleCount = 0;
  for (Animal a: animals) {
    if (!a.gender)
      averageSizeMale += a.finalSize;
    else 
      averageSizeFemale += a.finalSize;
    averageVision += a.vision;
    averageSpeed += a.speed;
    averageAggression += a.aggression;
    averageRed += red(a.animalColour);
    averageGreen += green(a.animalColour);
    averageBlue += blue(a.animalColour);
    animalCount ++;
    if (a.gender)
      femaleCount ++;
  }
  averageSizeFemale /= femaleCount;
  averageSizeMale /= (animalCount - femaleCount);
  averageVision /= animalCount;
  averageSpeed /= animalCount;
  averageAggression /= animalCount;
  averageRed /= animalCount;
  averageGreen /= animalCount;
  averageBlue /= animalCount;
  
  fill(0);
  textSize(14);
  textAlign(CENTER);
  if (selected.size() == 0) { 
    text("Average Size (male): " + digitRound(averageSizeMale, 2), 80, 30);
    text("Average Size (female): " + digitRound(averageSizeFemale, 2), 80, 60);
    text("Average vision: " + digitRound(averageVision, 2), 230, 30);
    text("Average speed: " + digitRound(averageSpeed, 2), 360, 30);
    text("Average aggression: " + digitRound(averageAggression, 2), 504, 30);
  } else {
    try {
      Animal q = selected.get(0);
      
      text("Selected size: " + digitRound(q.size, 2), 80, 30);
      if (q.gender)
        text("Average Size (female): " + digitRound(averageSizeFemale, 2), 80, 60);
      else 
        text("Average size (male): " + digitRound(averageSizeMale, 2), 80, 60);  
      text("Selected vision: " + digitRound(q.vision, 2), 230, 30);
      text("Average vision: " + digitRound(averageVision, 2), 230, 60);
      text("Selected speed: " + digitRound(q.speed, 2), 360, 30);
      text("Average speed: " + digitRound(averageSpeed, 2), 360, 60);
      text("Selected aggression: " + digitRound(q.aggression, 2), 504, 30);
      text("Average aggression: " + digitRound(averageAggression, 2), 504, 60);
    } catch (Exception e) {
    }
  }  
  
  text("Average colour", 640, 30);
  fill(averageRed, averageGreen, averageBlue);
  rect(620, 40, 40, 40);
  fill(0);
  text("Population size: " + int(animalCount), 350, 90);
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
  if (genderTag) {
    for (Animal a: animals) {
      textSize(a.size * 3);
      if (a.gender) {
        fill(255, 177, 203);
        text("♀", a.xPos, a.yPos - a.size * 3);
      } else {
        fill(1, 166, 234);
        text("♂", a.xPos, a.yPos - a.size * 3);
      }
    }
  }
}

float digitRound(float number, int digits) {
  return(int(number * pow(10, digits)) / pow(10.0, digits));
}

//Reset the Simulation
void reset() {
  timePassed = 0;
  animals.clear();
  foods.clear();
  animals.add(new Animal(1000 + breedingRate, 5, 8, false, 10, 300, color(92, 64, 51), random(250, 350), random(150, 500))); //male animal
  animals.add(new Animal (1000 + breedingRate, 3, 5, true, 4, 300, color(210, 180, 140), random (250, 350), random(150, 500))); //female animal
}
