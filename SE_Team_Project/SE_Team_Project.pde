import g4p_controls.*;

//Global Variables (Don't Change These!)
int simSpeed = 200;
int timePassed;
int size;
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
Season season;

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
boolean end = false;

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
  
  //Set Temporary Variables
  breedingRate = 0;
  setting = "Aggression";
  size = 1;
  
  //Create Animals
  animals.add(new Animal(breedingRate1.getValueF() * breedingRate1.getValueF(), 3, 8, false, 10, 300, red1.getValueF(), green1.getValueF(), blue1.getValueF(), random(250, 350), random(150, 500))); //male animal
  animals.add(new Animal(breedingRate2.getValueF() * breedingRate2.getValueF(), 2, 5, true, 4, 300, red2.getValueF(), green2.getValueF(), blue2.getValueF(), random (250, 350), random(150, 500))); //female animal
  //breeding rate, speed, size, gender (false == male), aggression, vision, red colour, green colour, blue colour, x coordinate, y coordinate
 
  //Create Habitat
  field = new Habitat(0.5, 20, 10);
  foodRate = growthRate.getValueF();
}


void draw() {
  
  //Genral Setup
  frameRate(simSpeed);
  noStroke();
  guiUpdate();
  
  //Background for Title, Instruction, and End Screens
  if (titleScreen || instructionScreen || end) 
    image(background1, 0, 0);
    
  if (setupScreenEnvironment || setupScreenAnimals) 
    image(background2, 0, 0);
  
  //While on Title Screen
  if (titleScreen) {
    PFont myFont = createFont("Impact", 80);
    textFont(myFont);
    textAlign(LEFT);
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
    text("2)", 80, 410);
    
    fill(255);
    rect(100, 370, 490, 2);
    
    fill(red1.getValueF(), green1.getValueF(), blue1.getValueF());
    circle(465, 335, 50);
    
    fill(red2.getValueF(), green2.getValueF(), blue2.getValueF());
    circle(465, 520, 50);
  }
  
  //While Simulation is Running
  if (simulation) {
    simulationSetup();
    background(150, 150, 255);
    fill(0, 0, 250);
    rect(50, 94, 600, 512);
    fill(10, 75, 200);
    rect(355, 616, 2, 84);
    fill(150, 150, 255);
    triangle(50, 94, 100, 94, 50, 144);
    triangle(650, 94, 600, 94, 650, 144);
    triangle(50, 606, 100, 606, 50, 556);
    triangle(650, 606, 600, 606, 650, 556);
    
    //Simulation is Running but Paused
    if (!play) {
      fill(field.getColour());
      circle(350, 350, 500);
      //fill(114, 92, 66);
      //rect(420, 250, 50, 50);
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
            circle(a.xPos - 3, a.yPos + 3, a.size * 5);
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
  
    //Set Age of Starting Animals
    if (timePassed == 0) {
      for (Animal a : animals) {
        a.age = 1000;
      }
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
    
    //Update Time and Lables
    timePassed++;
    updateLabel();
  
    //Mouse Hovering Over Animal
    for (Animal a: animals) {
      if (a.xPos  < mouseX && mouseX < a.xPos + a.size * 3) {
        if (a.yPos  < mouseY && mouseY < a.yPos + a.size * 3) {
          noFill();
          strokeWeight(2.5);
          stroke(255, 215, 0);
          circle(a.xPos - 3, a.yPos + 3, a.size * 5);
          stroke(0);
          strokeWeight(1);
        }
      }
    }
    
   //Show Selected Animal
   if (selected.size() > 0) {
     Animal a = selected.get(0);
     noFill();
     strokeWeight(2.5);
     stroke(255, 215, 0);
     circle(a.xPos - 3, a.yPos + 3, a.size * 5);
     stroke(0);
     strokeWeight(1);
    }
    
    //If All The Animals Have Died
    if (animals.size() == 0) {
      end = true;
      simulation = false;
    }
  }
  
  //If The Simulation is Finished
  if (end) {
    clearSimulation();
    startButton.setText("Restart");
    startButton.setVisible(true);
    textSize(30);
    fill(255);
    text("Looks like your species couldn't survive . . . ", 350, 200);
    text("Try again?", 350, 225);
  }
}

//Select Animal
void mouseClicked() {
  if (mouseY < 600)
    selected.clear();
  for (Animal a: animals) {
    if (a.xPos < mouseX && mouseX < a.xPos + a.size * 3) {
      if (a.yPos < mouseY && mouseY < a.yPos + a.size * 3) {
        selected.add(a);
      }
    }
  }
}

//Update GUI Based on Selected
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
  
  //Setup Average Values
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
  
  //Add up All Values
  for (Animal a: animals) {
    if (!a.gender)
      averageSizeMale += a.finalSize;
    else 
      averageSizeFemale += a.finalSize;
    averageVision += a.vision;
    averageSpeed += a.speed;
    averageAggression += a.aggression;
    averageRed += a.red;
    averageGreen += a.green;
    averageBlue += a.blue;
    animalCount ++;
    if (a.gender)
      femaleCount ++;
  }
  
  //Get Average Values
  averageSizeFemale /= femaleCount;
  averageSizeMale /= (animalCount - femaleCount);
  averageVision /= animalCount;
  averageSpeed /= animalCount;
  averageAggression /= animalCount;
  averageRed /= animalCount;
  averageGreen /= animalCount;
  averageBlue /= animalCount;
  
  //Display Average Values
  fill(10, 75, 200);
  textSize(16);
  textAlign(CENTER);
  
  text("Average Size (male): " + digitRound(averageSizeMale, 2), 140, 40);
  text("Average Size (female): " + digitRound(averageSizeFemale, 2), 140, 65);
  text("Average vision: " + digitRound(averageVision, 2), 315, 40);
  text("Average speed: " + digitRound(averageSpeed, 2), 315, 65);
  text("Average aggression: " + digitRound(averageAggression, 2), 480, 40);
  text("Population size: " + int(animalCount), 480, 65);
 
  if (selected.size() != 0) {
    try {
      Animal q = selected.get(0);
      
      fill(255, 255, 0);
      textSize(14);
      text("Selected size: " + digitRound(q.size, 2), 100, 85);
      text("Selected vision: " + digitRound(q.vision, 2), 225, 85);
      text("Selected speed: " + digitRound(q.speed, 2), 360, 85);
      text("Selected aggression: " + digitRound(q.aggression, 2), 500, 85);
    } 
    catch (Exception e) {
    }
  }  
  
  fill(10, 75, 200);
  text("Average colour", 640, 30);
  fill(150, 150, 255);
  textSize(24);
  text(season.name, 128, 125);
  fill(averageRed, averageGreen, averageBlue);
  rect(620, 40, 40, 40);

  //Animal Info Tags
  if (hungerTag) {
    for (Animal a: animals) {
      fill(a.red, a.green, a.blue);
      textSize(a.size * 3);
      text(int(a.hunger), a.xPos, a.yPos - a.size * 3);
    }
  }
  if (ageTag) {
    for (Animal a: animals) {
      fill(a.red, a.green, a.blue);
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

//Round Function
float digitRound(float number, int digits) {
  return(int(number * pow(10, digits)) / pow(10.0, digits));
}

//Reset the Simulation
void reset() {
  timePassed = 0;
  animals.clear();
  foods.clear();
  animals.add(new Animal(breedingRate1.getValueF() * breedingRate1.getValueF(), 3, 8, false, 10, 300, red1.getValueF(), green1.getValueF(), blue1.getValueF(), random(250, 350), random(150, 500))); //male animal
  animals.add(new Animal(breedingRate2.getValueF() * breedingRate2.getValueF(), 2, 5, true, 4, 300, red2.getValueF(), green2.getValueF(), blue2.getValueF(), random (250, 350), random(150, 500))); //female animal
}
