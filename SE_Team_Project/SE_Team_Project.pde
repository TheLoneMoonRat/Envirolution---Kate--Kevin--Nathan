int population;
int timePassed;
ArrayList<Animal> animals;
ArrayList<Food> foods;
Animal jeffrey;
Animal jane;

void setup() {
  size(700, 700);
  jeffrey = new Animal(5, 5, 8, false, 10, 20, color(92, 64, 51), 300, 300);
  jane = new Animal (6, 3, 5, true, 4, 15, color(210, 180, 140), 300, 300);
  animals = new ArrayList<Animal>();
}

void draw() {
  background(0, 0, 255);
  fill(0, 255, 0);
  circle(350, 350, 500);
  jeffrey.drawAnimal();
  jane.drawAnimal();
  if (timePassed % 300 == 0) {
    jane.createChild(jeffrey);
  }
  for (Animal a : animals) {
    a.drawAnimal();
  }
  timePassed++;
  
}
