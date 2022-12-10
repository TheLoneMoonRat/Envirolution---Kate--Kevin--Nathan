class Season {
  String name;
  int bounty;
  ArrayList<Food> lastSeason;
  ArrayList<Food> decay;
  PVector lowLocation;
  PVector highLocation;
  
  Season() {
    decay = new ArrayList<Food>();
    lastSeason = new ArrayList<Food>();
    lowLocation = new PVector(0, 0);
    highLocation = new PVector(0, 0);
  }
  void getSeason () {
    if (timePassed % 2000 < 500) {
      this.name = "Spring";
      this.bounty = 6;
      this.lowLocation.x = 225;
      this.lowLocation.y = 225;
      this.highLocation.x = 475;
      this.highLocation.y = 475;
    } else if (timePassed % 2000 < 1000) {
      this.name = "Summer";
      this.bounty = 3;
      this.lowLocation.x = 225;
      this.lowLocation.y = 225;
      this.highLocation.x = 475;
      this.highLocation.y = 350;
    } else if (timePassed % 2000 < 1500) {
      this.name = "Fall";
      this.bounty = 4;
      this.lowLocation.x = 225;
      this.lowLocation.y = 350;
      this.highLocation.x = 475;
      this.highLocation.y = 475;
    } else {
      this.name = "Winter";
      this.bounty = 1;
      this.lowLocation.x = 350;
      this.lowLocation.y = 350;
      this.highLocation.x = 475;
      this.highLocation.y = 475;
    }
    if (timePassed % 500 == 0) {
      for (Animal a: animals)
        a.setPosition();
      for (Food f: foods) 
        lastSeason.add(f);
    }
    for (Food f: lastSeason) {
      if (int(random(0, 300)) == 0)
        decay.add(f);
    }
    for (Food f: decay) {
      
      try {
        foods.remove(foods.indexOf(f));
      } catch (Exception e) {
      
      }
      lastSeason.remove(lastSeason.indexOf(f));
    }
    decay.clear();
  }
  
    
  
  void createFood() {
    float nutritionValue = random(40 + nutritionAdjuster, 80 + nutritionAdjuster);
    color borange;
    switch (this.name) {
      case "Spring":
        borange = color(random(125, 255), 255, 125);
        break;
      case "Summer":
        borange = color(random(45, 133), 133, 45); 
        break;
      case "Fall":
        borange = color(189, random(57, 189), 80);
        break;
      default:
        borange = color(133, random(45, 133), 45);
        break;
    }
    
    
    foods.add(new Food(nutritionValue, 10, borange, random(this.lowLocation.x, this.highLocation.x), random(this.lowLocation.y, this.highLocation.y)));
    //foods.add(new Food(nutritionValue, 10, color((nutritionValue / (80 + nutritionAdjuster)) * 255, 252, 3), x, y));
  }
}
