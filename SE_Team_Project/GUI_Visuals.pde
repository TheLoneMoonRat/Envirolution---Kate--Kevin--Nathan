//Create Environment Setup GUI Screen
void environmentSetup() {
   growthRate.setVisible(true);
    nutrition_.setVisible(true);
    averageTemp.setVisible(true);
    tempRange.setVisible(true);
    humidity_.setVisible(true);
    medow.setVisible(true);
    artic.setVisible(true);
    beginButton.setVisible(true);
    backButton.setVisible(true);
    growthRateText.setVisible(true);
    nutritionText.setVisible(true);
    humidityText.setVisible(true);
    avgTempText.setVisible(true);
    tempRangeText.setVisible(true);
    beginButton.moveTo(230, 400);
    backButton.moveTo(380, 414);
}

//Create Animals Setup GUI Screen
void animalsSetup() {
    breedingRate1.setVisible(true);
    breedingRate2.setVisible(true);
    animal1Traits.setVisible(true);
    animal1Trait.setVisible(true);
    animal2Traits.setVisible(true);
    animal2Trait.setVisible(true);
    red1.setVisible(true);
    red2.setVisible(true);
    green1.setVisible(true);
    green2.setVisible(true);
    blue1.setVisible(true);
    blue2.setVisible(true);
    beginButton.setText("Start");
    beginButton.moveTo(370, 108);
    backButton.moveTo(517, 123);
    breedingRate1Text.setVisible(true);
    breedingRate2Text.setVisible(true);
    red1Text.setVisible(true);
    red2Text.setVisible(true);
    green1Text.setVisible(true);
    green2Text.setVisible(true);
    blue1Text.setVisible(true);
    blue2Text.setVisible(true);
}

//Create Simulation GUI Screen
void simulationSetup() {
   pauseButton1.setVisible(true);
   litterSize.setVisible(true);
   resetButton1.setVisible(true);
   animationSpeed.setVisible(true);
   showVariables1.setVisible(true);
   shouldVariables.setVisible(true);
   animationSpeedText.setVisible(true);
   litterSizeText.setVisible(true);
   
   if (selected.size() != 0) {
     breedingRates.setVisible(true);
     litterSize.setVisible(true);
     animalTrait.setVisible(true);
     animalTraits.setVisible(true);
     animationSpeed.setVisible(true);
     breedingRateText.setVisible(true);
   }
}

//Clear GUI Screen
void clearEnvironmentSetupScreen () {
  growthRate.setVisible(false);
  nutrition_.setVisible(false);
  averageTemp.setVisible(false);
  tempRange.setVisible(false);
  humidity_.setVisible(false);
  medow.setVisible(false);
  artic.setVisible(false);
  growthRateText.setVisible(false);
  nutritionText.setVisible(false);
  humidityText.setVisible(false);
  avgTempText.setVisible(false);
  tempRangeText.setVisible(false);
  startButton.setVisible(false);
}

//Clear GUI Screen
void clearAnimalsSetupScreen () {
  breedingRate1.setVisible(false);
  breedingRate2.setVisible(false);
  animal1Traits.setVisible(false);
  animal1Trait.setVisible(false);
  animal2Traits.setVisible(false);
  animal2Trait.setVisible(false);
  red1.setVisible(false);
  red2.setVisible(false);
  green1.setVisible(false);
  green2.setVisible(false);
  blue1.setVisible(false);
  blue2.setVisible(false);
  beginButton.setVisible(false);
  backButton.setVisible(false);
  breedingRate1Text.setVisible(false);
  breedingRate2Text.setVisible(false);
  red1Text.setVisible(false);
  red2Text.setVisible(false);
  green1Text.setVisible(false);
  green2Text.setVisible(false);
  blue1Text.setVisible(false);
  blue2Text.setVisible(false);
  startButton.setVisible(false);
}

//Clear GUI Screen
void clearSimulation() {
   pauseButton1.setVisible(false);
   resetButton1.setVisible(false);
   showVariables1.setVisible(false);
   shouldVariables.setVisible(false);
   litterSize.setVisible(false);
   animationSpeed.setVisible(false);
   breedingRates.setVisible(false);
   litterSize.setVisible(false);
   animalTrait.setVisible(false);
   animalTraits.setVisible(false);
   animationSpeed.setVisible(false);
   breedingRateText.setVisible(false);
   litterSizeText.setVisible(false);
   animationSpeedText.setVisible(false);
}

//Clear GUI Screen
void clearForStart() {
  instructions.setVisible(false);
  litterSize.setVisible(false);
  animationSpeed.setVisible(false);
  returnButton.setVisible(false);
  growthRate.setVisible(false);
  nutrition_.setVisible(false);
  averageTemp.setVisible(false);
  tempRange.setVisible(false);
  humidity_.setVisible(false);
  medow.setVisible(false);
  artic.setVisible(false);
  breedingRate1.setVisible(false);
  breedingRate2.setVisible(false);
  animal1Traits.setVisible(false);
  animal1Trait.setVisible(false);
  animal2Traits.setVisible(false);
  animal2Trait.setVisible(false);
  pauseButton1.setVisible(false);
  resetButton1.setVisible(false);
  showVariables1.setVisible(false);
  shouldVariables.setVisible(false);
  breedingRates.setVisible(false);
  litterSize.setVisible(false);
  animalTrait.setVisible(false);
  animalTraits.setVisible(false);
  red1.setVisible(false);
  red2.setVisible(false);
  green1.setVisible(false);
  green2.setVisible(false);
  blue1.setVisible(false);
  blue2.setVisible(false);
  animationSpeed.setVisible(false);
  beginButton.setVisible(false);
  backButton.setVisible(false);
  
  
  breedingRateText.setVisible(false);
  litterSizeText.setVisible(false);
  growthRateText.setVisible(false);
  nutritionText.setVisible(false);
  humidityText.setVisible(false);
  avgTempText.setVisible(false);
  tempRangeText.setVisible(false);
  breedingRate1Text.setVisible(false);
  breedingRate2Text.setVisible(false);
  red1Text.setVisible(false);
  red2Text.setVisible(false);
  green1Text.setVisible(false);
  green2Text.setVisible(false);
  blue1Text.setVisible(false);
  blue2Text.setVisible(false);
  animationSpeedText.setVisible(false);
}
