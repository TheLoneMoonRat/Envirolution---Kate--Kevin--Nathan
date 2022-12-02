class Habitat {
  //Fields
  float humidity;
  float avgTemp;
  float tempRange;
  float temp;
  
  //Constructors
  Habitat(float h, float at, float tr) {
    this.humidity = h;
    this.avgTemp = at;
    this.tempRange = tr;
    this.temp = avgTemp;
  }
  
  color getColour() {
    color c = (0);
    if (this.temp > 35)
      c = color(255, 255, 0);
    else if (this.temp > 20) 
      c = color(100, 255, 0);
    else if (this.temp > 0)
      c = color(0, 255, 0);
    else if (this.temp < 0)
      c = color(255);
    return c;
  }
  
  void changeRatesByTemp() {
    if (this.temp > 20) {
      for( Food f : foods) 
        f.growthRate += random(1, 2);
      for( Animal a : animals)
        a.breedingRate += random(1, 2);
    }
    
    else if (this.temp < 0) {
      for( Food f : foods) 
        f.growthRate -= random(1, 2);
      for( Animal a : animals)
        a.breedingRate -= random(1, 2);
    }
  }
  
  void changeRatesByHumidity() {
    if (this.humidity >= 7) {
      for( Food f : foods) 
        f.growthRate += random(1, 2);
      for( Animal a : animals)
        a.breedingRate += random(1, 2);
    }
    
    else if (this.humidity <= 3) {
      for( Food f : foods) 
        f.growthRate -= random(1, 2);
      for( Animal a : animals)
        a.breedingRate -= random(1, 2);
    }
  }
}
      
  
  
