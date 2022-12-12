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
    colorMode(HSB);
    float hue = 120 - 2 * this.temp;
    float saturation = this.temp * 10;
    color c = color(hue, saturation, 150);
    colorMode(RGB);
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
      
  
  
