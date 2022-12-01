class Habitat {
  //Fields
  float humidity;
  float avgTemp;
  float tempRange;
  float temp;
  color habitatColour;
  
  //Constructors
  Habitat(float h, float at, float tr) {
    this.humidity = h;
    this.avgTemp = at;
    this.tempRange = tr;
    this.temp = avgTemp;
  }
  
  void getColour() {
    if (this.temp > 35)
      this.habitatColour = color(255, 255, 0);
    else if (this.temp > 20) 
      this.habitatColour = color(100, 255, 0);
    else if (this.temp > 0)
      this.habitatColour = color(0, 255, 0);
    else if (this.temp < 0)
      this.habitatColour = color(255);
  }
  
  void changeRatesByTemp() {
    if (this.temp > 20) {
      for( Food f : foodAmt) 
        f.growthRate += random(1, 2);
      for( Animal a : animals)
        a.breedingRate += random(1, 2);
    }
    
    else if (this.temp < 0) {
      for( Food f : foodAmt) 
        f.growthRate -= random(1, 2);
      for( Animal a : animals)
        a.breedingRate -= random(1, 2);
    }
  }
  
  void changeRatesByHumidity() {
    if (this.humidity >= 7) {
      for( Food f : foodAmt) 
        f.growthRate += random(1, 2);
      for( Animal a : animals)
        a.breedingRate += random(1, 2);
    }
    
    else if (this.humidity <= 3) {
      for( Food f : foodAmt) 
        f.growthRate -= random(1, 2);
      for( Anaiml a : animals)
        a.breedingRate -= random(1, 2);
    }
  }
}
      
  
  
