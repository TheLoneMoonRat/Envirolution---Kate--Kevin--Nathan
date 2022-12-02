import g4p_controls.*;

int population;
int timePassed;
ArrayList<Animal> animals;
ArrayList<Food> foods;
Habitat field;
ArrayList<Animal> selected;
String setting;

void setup() {
  size(700, 700);
  animals = new ArrayList<Animal>();
  foods = new ArrayList<Food>();
  selected = new ArrayList<Animal>();
  animals.add(new Animal(5, 5, 8, false, 10, 300, color(92, 64, 51), random(250, 350), random(150, 500)));
  animals.add(new Animal (6, 7, 5, true, 4, 300, color(210, 180, 140), random (250, 350), random(150, 500)));
  createGUI();
  setting = variable_adjuster.getSelectedText();
  field = new Habitat(5, -5, 5);
}

void draw() {
  guiUpdate();
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
    //a.calculateBirths();
    //a.calculateDeaths();
  }
  
  for (Food f: foods) {
    f.drawFood();
  }
  if (timePassed % 300 == 0) 
    createFood();
    
  timePassed++;
  
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
      a.speed = variable_slide.getValueF();
    }
  }
}

void createFood() {
    foods.add(new Food(random(25, 40), 10, color(random(0, 255), random(0, 255), random(0, 255)), random(150, 500), random(150, 500)));
  }
