int population;
int timePassed;
ArrayList<Animal> animals;
Animal jeffrey;
Animal jane;

void setup() {
  size(700, 700);
  jeffrey = new Animal(5, 5, 8, false, 10);
  jane = new Animal (6, 3, 5, true, 4);
}

void draw() {
  background(0, 0, 255);
  fill(0, 255, 0);
  circle(350, 350, 500);
  jeffrey.drawAnimal();
}
