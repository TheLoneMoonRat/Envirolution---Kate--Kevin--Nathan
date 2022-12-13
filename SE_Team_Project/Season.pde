class Season {
  //Fields
  String name;   //name of season
  int bounty;   //how much food should grow
  ArrayList<Food> lastSeason;   //food from last season
  ArrayList<Food> decay;   //food that is currently decaying
  PVector lowLocation;   //lowest location of food growth
  PVector highLocation;   //highest location of food growth
  
  //Constructor
  Season() {
    decay = new ArrayList<Food>();
    lastSeason = new ArrayList<Food>();
    lowLocation = new PVector(0, 0);
    highLocation = new PVector(0, 0);
  }
  
  //Get Season Values
  void getSeason () {
    //Set Season
    if (timePassed % 2000 < 500) {
      this.name = "Spring";
      this.bounty = 6;
      this.lowLocation.x = 225;
      this.lowLocation.y = 225;
      this.highLocation.x = 475;
      this.highLocation.y = 475;
      field.temp = field.avgTemp;  //change temperature
      
    } else if (timePassed % 2000 < 1000) {
      this.name = "Summer";
      this.bounty = 3;
      this.lowLocation.x = 225;
      this.lowLocation.y = 225;
      this.highLocation.x = 475;
      this.highLocation.y = 350;
      field.temp = field.avgTemp + field.tempRange;  //change temperature
      
    } else if (timePassed % 2000 < 1500) {
      this.name = "Fall";
      this.bounty = 4;
      this.lowLocation.x = 225;
      this.lowLocation.y = 350;
      this.highLocation.x = 475;
      this.highLocation.y = 475;
      field.temp = field.avgTemp - field.tempRange / 2;   //change temperature
      
    } else {
      this.name = "Winter";
      this.bounty = 1;
      this.lowLocation.x = 350;
      this.lowLocation.y = 350;
      this.highLocation.x = 475;
      this.highLocation.y = 475;
      field.temp = field.avgTemp - field.tempRange;   //change temperature
    }
    
    //Change Values From Last Season
    if (timePassed % 500 == 0) {
      for (Animal a: animals)
        a.setPosition();  
      for (Food f: foods) 
        lastSeason.add(f);  //convert food from current season to last season
    }
    for (Food f: lastSeason) {
      if (int(random(0, 300)) == 0)
        decay.add(f);  //randomly decay food from last season
    }
    
    for (Food f: decay) {  //get rid of decaying food
      try {
        foods.remove(foods.indexOf(f));
      } catch (Exception e) {
      
      }
      lastSeason.remove(lastSeason.indexOf(f));
    }
    decay.clear();
  }
  
  //Create New Food
  void createFood() {
    float nutritionValue = random(40 + nutritionAdjuster, 80 + nutritionAdjuster);    
    foods.add(new Food(nutritionValue, 10, getSeasonColour(), random(this.lowLocation.x, this.highLocation.x), random(this.lowLocation.y, this.highLocation.y)));
  }

  //Get Colour For Food Based on Season
  color getSeasonColour () {
    switch (this.name) {
      case "Spring":
        return(color(random(125, 255), 255, 125));
      case "Summer":
        return(color(random(45, 133), 133, 45)); 
      case "Fall":
        return(color(189, random(57, 189), 80));
      default:
        return(color(133, random(45, 133), 45));
    }
  }
}
