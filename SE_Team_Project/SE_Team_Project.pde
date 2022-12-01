int population;
int timePassed;
ArrayList<Animal> animals;
ArrayList<Food> foods;
Animal jeffrey;
Animal jane;

void setup() {
  size(700, 700);
  animals = new ArrayList<Animal>();
  foods = new ArrayList<Food>();
  animals.add(new Animal(5, 5, 8, false, 10, 20, color(92, 64, 51), random(250, 350), random(250, 350)));
  animals.add(new Animal (6, 3, 5, true, 4, 15, color(210, 180, 140), random (250, 350), random(250, 350)));
}

void draw() {
  background(0, 0, 255);
  fill(0, 255, 0);
  circle(350, 350, 500);
  //update animals
  for (Animal a : animals) {
    a.drawAnimal();
    if (a.hunger < 20)
      a.eat();
    a.calculateBirths();
    a.calculateDeaths();
  }
  for (Food f: foods) {
    f.drawFood();
  }
  if (timePassed % 300 ==0) 
    createFood();
    
  timePassed++;
  
}

void createFood() {
    foods.add(new Food(random(0.1, 5), color(random(0, 255), random(0, 255), random(0, 255)), random(250, 350), random(250, 350)));
  }
