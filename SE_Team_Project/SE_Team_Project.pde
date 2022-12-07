import g4p_controls.*;

int population;
float breedingRate;
int litterSize;
int speed;
int size;
boolean gender;
float agression;
float vision;
int timePassed;
float foodRate;
ArrayList<Animal> animals;
ArrayList<Animal> inLabour;
ArrayList<Animal> dying;
ArrayList<Food> foods;
Habitat field;
ArrayList<Animal> selected;
String setting;
boolean hungerTag;
boolean ageTag;
boolean play;
float nutritionAdjuster;

void setup() {
  size(700, 700);
  animals = new ArrayList<Animal>();
  foods = new ArrayList<Food>();  
  selected = new ArrayList<Animal>();
  inLabour = new ArrayList<Animal>();
  dying = new ArrayList<Animal>();
  breedingRate = 0;
  litterSize = 2;
  //breeding rate, speed, size, gender (false == male), aggression, vision, colour, x coordinate, y coordinate
  animals.add(new Animal(1000 + breedingRate, 40, 8, false, 20, 200, color(92, 64, 51), random(250, 350), random(150, 500))); //male animal
  animals.add(new Animal(1000 + breedingRate, 30, 5, true, 4, 200, color(210, 180, 140), random (250, 350), random(150, 500))); //female animal
  createGUI();
  setting = variable_adjuster.getSelectedText();
  field = new Habitat(5, -5, 5);
  foodRate = food_growth.getValueF();
  shouldShow.setText("Hide Variables");
  shouldShow.setLocalColorScheme(0);
  hungerTag = true;
  ageTag = false;
  play = true;
}

void draw() {
  noStroke();
  guiUpdate();
  
  if (play == true) {
    background(0, 0, 255);
    fill(field.getColour());
    circle(350, 350, 500);
  
    //update animals
    for (Animal a : animals) {
      a.updateStats();
      a.drawAnimal();
      if (a.hunger > 20) {
        a.eat();
      }
      a.calculateBirths();
      a.calculateDeaths();
      a.updatePosition();
    }
  
    //birth and death
    for (Animal a: inLabour) {
      for (int i = litterSize; i > 0; i--) {
        a.createChild(a.partner); 
      }
      a.partner = null; }
    for (Animal a: dying) {
      animals.remove(animals.indexOf(a));
    }
    dying.clear();
    inLabour.clear();
    
    for (Food f: foods) {
      f.drawFood();
    }
    if (timePassed % int(400 - foodRate) == 0) 
      createFood();
    
    timePassed++;
    updateLabel();
  
    //mouse hovering over animal
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
      a.aggression = variable_slide.getValueF();
    } else if (setting.equals("Size")) {
      a.size = variable_slide.getValueF();
    } else if (setting.equals("Speed")) {
      a.speed = 85 - variable_slide.getValueF();
    } else if (setting.equals("Vision")) {
      a.vision = variable_slide.getValueF();
    }
  }
  
}

void createFood() {
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

void reset() {
  animals.clear();
  foods.clear();
  animals.add(new Animal(1000 + breedingRate, 40, 8, false, 10, 300, color(92, 64, 51), random(250, 350), random(150, 500))); //male animal
  animals.add(new Animal (1000 + breedingRate, 35, 5, true, 4, 300, color(210, 180, 140), random (250, 350), random(150, 500))); //female animal
}
  
  
