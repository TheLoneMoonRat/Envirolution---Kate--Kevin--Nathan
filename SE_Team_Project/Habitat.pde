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
  
  //Get Colour Based on Temperature
  color getColour() {
    colorMode(HSB);
    float hue = 100 - 1.5 * this.temp;
    float saturation = this.temp * 10 + 5;
    color c = color(hue, saturation, 150);
    colorMode(RGB);
    return c;
  }
  
  //Chnage Food Growth and Breeding Based on Temp
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
  
  //Chnage Food Growth and Breeding Based on Humidity
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
      
  
  
