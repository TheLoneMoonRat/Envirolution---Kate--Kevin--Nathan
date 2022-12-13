class Habitat {
  //Fields
  float humidity;   
  float avgTemp;   //average temperature
  float tempRange;   //how much the temperature can range from the average temp
  float temp;  //what the cuurent temperature is
  
  //Constructors
  Habitat(float h, float at, float tr) {
    this.humidity = h;
    this.avgTemp = at;
    this.tempRange = tr;
    this.temp = avgTemp;
  }
  
  //Get Colour Based on Temperature
  color getColour() {
    colorMode(HSB);  //move to HSB (hue saturation brightness)
    float hue = 100 - 1.5 * this.temp;
    float saturation = this.temp * 10 + 5;
    color c = color(hue, saturation, 150);
    
    colorMode(RGB);  //move back to rgb
    return c;
  }
  
  //Chnage Food Growth and Breeding Based on Temp
  void changeRatesByTemp() {
    if (this.temp > 20) {
      for( Food f : foods) 
        f.growthRate += random(5, 10);
      for( Animal a : animals)
        a.breedingRate -= random(5, 10);
    }
    
    else if (this.temp < 0) {
      for( Food f : foods) 
        f.growthRate -= random(5, 10);
      for( Animal a : animals)
        a.breedingRate += random(5, 10);
    }
  }
  
  //Chnage Food Growth and Breeding Based on Humidity
  void changeRatesByHumidity() {
    if (this.humidity >= 7) {
      for( Food f : foods) 
        f.growthRate += random(5, 10);
      for( Animal a : animals)
        a.breedingRate -= random(5, 10);
    }
    
    else if (this.humidity <= 3) {
      for( Food f : foods) 
        f.growthRate -= random(5, 10);
      for( Animal a : animals)
        a.breedingRate += random(5, 10);
    }
  }
}
      
  
  
