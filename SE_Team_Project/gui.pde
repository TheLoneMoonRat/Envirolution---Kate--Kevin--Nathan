/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void startButtonClick(GButton source, GEvent event) { //_CODE_:startButton:798525:
  timePassed = 0;
  instructionsButton.setVisible(false);
  startButton.setVisible(false);
  setupScreenEnvironment = true;
  titleScreen = false;
} //_CODE_:startButton:798525:

public void instructionsButtonClick(GButton source, GEvent event) { //_CODE_:instructionsButton:453695:
  instructionsButton.setVisible(false);
  startButton.setVisible(false);
  instructionScreen = true;
  titleScreen = false;
} //_CODE_:instructionsButton:453695:

public void imgButton1_click1(GImageButton source, GEvent event) { //_CODE_:instructions:539261:
} //_CODE_:instructions:539261:

public void returnButtonClick(GButton source, GEvent event) { //_CODE_:returnButton:636213:
  returnButton.setVisible(false);
  instructions.setVisible(false);
  instructionScreen = false;
  titleScreen = true;
} //_CODE_:returnButton:636213:

public void growthRateChange(GSlider source, GEvent event) { //_CODE_:growthRate:851713:
  foodRate = growthRate.getValueF();
} //_CODE_:growthRate:851713:

public void nutrition_Change(GSlider source, GEvent event) { //_CODE_:nutrition_:906414:
  nutritionAdjuster = nutrition_.getValueF();
} //_CODE_:nutrition_:906414:

public void averageTempChange(GSlider source, GEvent event) { //_CODE_:averageTemp:400803:
  field.temp = averageTemp.getValueF();
} //_CODE_:averageTemp:400803:

public void tempRangeChange(GSlider source, GEvent event) { //_CODE_:tempRange:337308:
  println("tempRange - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:tempRange:337308:

public void humidity_Change(GSlider source, GEvent event) { //_CODE_:humidity_:856470:
  println("humidity_ - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:humidity_:856470:

public void medowClick(GButton source, GEvent event) { //_CODE_:medow:484108:
  medow.setLocalColorScheme(7);
} //_CODE_:medow:484108:

public void articClick(GButton source, GEvent event) { //_CODE_:artic:557486:
  artic.setLocalColorScheme(7);
} //_CODE_:artic:557486:

public void breedingRate1Change(GSlider source, GEvent event) { //_CODE_:breedingRate1:600015:
  println("breedingRate - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:breedingRate1:600015:

public void litterSize1Change(GSlider source, GEvent event) { //_CODE_:litterSize1:941264:
  size = litterSize.getValueI();
} //_CODE_:litterSize1:941264:

public void animal1TraitsChange(GCustomSlider source, GEvent event) { //_CODE_:animal1Traits:793901:
  println("animal1Traits - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:animal1Traits:793901:

public void aniaml1TraitChange(GDropList source, GEvent event) { //_CODE_:animal1Trait:702361:
  setting = animal1Trait.getSelectedText();  
  for (Animal a : animals) {
    if (setting.equals("Aggression")) {
      animal1Traits.setLimits(a.aggression, 1, 10);
    } else if (setting.equals("Size")) {
      animal1Traits.setLimits(a.size, 3, 12);
    } else if (setting.equals("Speed")) {
      animal1Traits.setLimits(a.speed, 5, 80);
    } else if (setting.equals("Vision")) {
      animal1Traits.setLimits(a.vision, 20, 600);
    }
  }
} //_CODE_:animal1Trait:702361:

public void breedingRate2Change(GSlider source, GEvent event) { //_CODE_:breedingRate2:762987:
  println("slider1 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:breedingRate2:762987:

public void litterSize2Change(GSlider source, GEvent event) { //_CODE_:litterSize2:317562:
  size = litterSize2.getValueI();
} //_CODE_:litterSize2:317562:

public void animal2TraitsChange(GCustomSlider source, GEvent event) { //_CODE_:animal2Traits:534204:
  println("custom_slider1 - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:animal2Traits:534204:

public void animal2TraitChange(GDropList source, GEvent event) { //_CODE_:animal2Trait:223443:
  setting = animal2Trait.getSelectedText();  
  for (Animal a : animals) {
    if (setting.equals("Aggression")) {
      animal1Traits.setLimits(a.aggression, 1, 10);
    } else if (setting.equals("Size")) {
      animal1Traits.setLimits(a.size, 3, 12);
    } else if (setting.equals("Speed")) {
      animal1Traits.setLimits(a.speed, 5, 80);
    } else if (setting.equals("Vision")) {
      animal1Traits.setLimits(a.vision, 20, 600);
    }
  }
} //_CODE_:animal2Trait:223443:

public void beginButtonClick(GButton source, GEvent event) { //_CODE_:beginButton:890431:
    if (setupScreenEnvironment) {
      clearEnvironmentSetupScreen();
      setupScreenEnvironment = false;
      setupScreenAnimals = true;
    }
    
    else {
      clearAnimalsSetupScreen();
      simulation = true;
      setupScreenAnimals = false;
    }
} //_CODE_:beginButton:890431:

public void backButtonClick(GButton source, GEvent event) { //_CODE_:backButton:247592:
    if (setupScreenEnvironment) {
      clearEnvironmentSetupScreen();
      titleScreen = true;
      setupScreenEnvironment = false;
    }
    
    else {
      clearAnimalsSetupScreen();
      setupScreenEnvironment = true;
      setupScreenAnimals = false;
    }
} //_CODE_:backButton:247592:

public void pauseButton1Click(GButton source, GEvent event) { //_CODE_:pauseButton1:318768:
  if (play == true) {
    play = false;
    //noLoop();
    pauseButton1.setLocalColorScheme(1);
    pauseButton1.setText("Play");
  }
  else {
    play = true;
    //loop();
    pauseButton1.setLocalColorScheme(0);
    pauseButton1.setText("Pause");
  }
} //_CODE_:pauseButton1:318768:

public void resetButton1Click(GButton source, GEvent event) { //_CODE_:resetButton1:254693:
  reset();
} //_CODE_:resetButton1:254693:

public void showVariables1Change(GDropList source, GEvent event) { //_CODE_:showVariables1:630746:
  hungerTag = false;
  ageTag = false;
  genderTag = false;
  shouldVariables.setText("Show Variables");
  shouldVariables.setLocalColorScheme(1);
} //_CODE_:showVariables1:630746:

public void showVariablesButtonClick(GButton source, GEvent event) { //_CODE_:shouldVariables:999019:
  if (showVariables1.getSelectedText().equals("Hunger") || showVariables1.getSelectedText().equals("")) {
    if (!hungerTag) {
      hungerTag = true;
      shouldVariables.setText("Hide Variables");
      shouldVariables.setLocalColorScheme(0);
    } else {
      hungerTag = false;
      shouldVariables.setText("Show Variables");
      shouldVariables.setLocalColorScheme(1);
    }
  } else if (showVariables1.getSelectedText().equals("Age")) {
    if (!ageTag) {
      ageTag = true;
      shouldVariables.setText("Hide Variables");
      shouldVariables.setLocalColorScheme(0);
    }
    else {
      ageTag = false;
      shouldVariables.setText("Show Variables");
      shouldVariables.setLocalColorScheme(1);
    }
  } else if (showVariables1.getSelectedText().equals("Gender")) {
    if (!genderTag) {
      genderTag = true;
      shouldVariables.setText("Hide Variables");
      shouldVariables.setLocalColorScheme(0);
    }
    else {
      genderTag = false;
      shouldVariables.setText("Show Variables");
      shouldVariables.setLocalColorScheme(1);
    }
  }
} //_CODE_:shouldVariables:999019:

public void breedingRateChange(GSlider source, GEvent event) { //_CODE_:breedingRates:281233:
  breedingRate = -breedingRates.getValueF();
} //_CODE_:breedingRates:281233:

public void litterSizeChange(GSlider source, GEvent event) { //_CODE_:litterSize:321692:
  size = litterSize.getValueI();
} //_CODE_:litterSize:321692:

public void animalTraitChange(GDropList source, GEvent event) { //_CODE_:animalTrait:969114:
  setting = animal1Trait.getSelectedText();  
  for (Animal a : animals) {
    if (setting.equals("Aggression")) {
      animal1Traits.setLimits(a.aggression, 1, 10);
    } else if (setting.equals("Size")) {
      animal1Traits.setLimits(a.size, 3, 12);
    } else if (setting.equals("Speed")) {
      animal1Traits.setLimits(a.speed, 5, 80);
    } else if (setting.equals("Vision")) {
      animal1Traits.setLimits(a.vision, 20, 600);
    }
  }
} //_CODE_:animalTrait:969114:

public void animalTraitsChange(GCustomSlider source, GEvent event) { //_CODE_:animalTraits:417672:
  println("animalTraits - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:animalTraits:417672:

public void sheepButtonClick(GButton source, GEvent event) { //_CODE_:sheepButton:766178:
  println("sheepButton - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:sheepButton:766178:

public void frogButtonClick(GButton source, GEvent event) { //_CODE_:frogButton:466873:
  println("frogButton - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:frogButton:466873:

public void polarBearButtonClick(GButton source, GEvent event) { //_CODE_:polarBearButton:624729:
  println("polarBearButton - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:polarBearButton:624729:

public void avgInnerTemp1Change(GSlider source, GEvent event) { //_CODE_:avgInnerTemp1:545051:
  println("avgInnerTemp1 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:avgInnerTemp1:545051:

public void avgInnerTemp2Change(GSlider source, GEvent event) { //_CODE_:avgInnerTemp2:922919:
  println("avgInnerTemp2 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:avgInnerTemp2:922919:

public void animationSpeedChange(GSlider source, GEvent event) { //_CODE_:animationSpeed:981070:
  simSpeed = animationSpeed.getValueI(); 
} //_CODE_:animationSpeed:981070:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.GREEN_SCHEME);
  G4P.setMouseOverEnabled(false);
  G4P.setDisplayFont("Impact", G4P.PLAIN, 16);
  G4P.setInputFont("Impact", G4P.PLAIN, 30);
  surface.setTitle("Sketch Window");
  startButton = new GButton(this, 217, 449, 250, 75);
  startButton.setText("START");
  startButton.addEventHandler(this, "startButtonClick");
  instructionsButton = new GButton(this, 285, 535, 116, 44);
  instructionsButton.setText("instructions");
  instructionsButton.addEventHandler(this, "instructionsButtonClick");
  instructions = new GImageButton(this, 113, 52, 475, 525, new String[] { "IMG_0199.PNG", "IMG_0199.PNG", "IMG_0199.PNG" } );
  instructions.addEventHandler(this, "imgButton1_click1");
  returnButton = new GButton(this, 275, 612, 150, 50);
  returnButton.setText("Return");
  returnButton.addEventHandler(this, "returnButtonClick");
  growthRate = new GSlider(this, 96, 197, 271, 40, 10.0);
  growthRate.setShowLimits(true);
  growthRate.setLimits(50.0, 1.0, 100.0);
  growthRate.setNumberFormat(G4P.DECIMAL, 2);
  growthRate.setOpaque(false);
  growthRate.addEventHandler(this, "growthRateChange");
  nutrition_ = new GSlider(this, 393, 196, 194, 40, 10.0);
  nutrition_.setShowLimits(true);
  nutrition_.setLimits(15.0, 5.0, 20.0);
  nutrition_.setNumberFormat(G4P.DECIMAL, 2);
  nutrition_.setOpaque(false);
  nutrition_.addEventHandler(this, "nutrition_Change");
  averageTemp = new GSlider(this, 97, 259, 271, 40, 10.0);
  averageTemp.setShowLimits(true);
  averageTemp.setLimits(20.0, -30.0, 40.0);
  averageTemp.setNumberFormat(G4P.DECIMAL, 2);
  averageTemp.setOpaque(false);
  averageTemp.addEventHandler(this, "averageTempChange");
  tempRange = new GSlider(this, 392, 261, 195, 40, 10.0);
  tempRange.setShowLimits(true);
  tempRange.setLimits(10.0, 0.0, 30.0);
  tempRange.setNumberFormat(G4P.DECIMAL, 2);
  tempRange.setOpaque(false);
  tempRange.addEventHandler(this, "tempRangeChange");
  humidity_ = new GSlider(this, 96, 322, 271, 40, 10.0);
  humidity_.setShowLimits(true);
  humidity_.setLimits(0.5, 0.0, 1.0);
  humidity_.setNumberFormat(G4P.DECIMAL, 2);
  humidity_.setOpaque(false);
  humidity_.addEventHandler(this, "humidity_Change");
  medow = new GButton(this, 403, 324, 80, 30);
  medow.setText("Medow");
  medow.addEventHandler(this, "medowClick");
  artic = new GButton(this, 498, 324, 80, 30);
  artic.setText("Artic");
  artic.addEventHandler(this, "articClick");
  breedingRate1 = new GSlider(this, 112, 210, 255, 35, 10.0);
  breedingRate1.setShowLimits(true);
  breedingRate1.setLimits(0.5, 0.0, 1.0);
  breedingRate1.setNumberFormat(G4P.DECIMAL, 2);
  breedingRate1.setOpaque(false);
  breedingRate1.addEventHandler(this, "breedingRate1Change");
  litterSize1 = new GSlider(this, 392, 206, 195, 40, 10.0);
  litterSize1.setShowLimits(true);
  litterSize1.setLimits(0.5, 0.0, 30.0);
  litterSize1.setNumberFormat(G4P.DECIMAL, 2);
  litterSize1.setOpaque(false);
  litterSize1.addEventHandler(this, "litterSize1Change");
  animal1Traits = new GCustomSlider(this, 393, 265, 148, 40, "grey_blue");
  animal1Traits.setLimits(0.5, 0.0, 1.0);
  animal1Traits.setNumberFormat(G4P.DECIMAL, 2);
  animal1Traits.setOpaque(false);
  animal1Traits.addEventHandler(this, "animal1TraitsChange");
  animal1Trait = new GDropList(this, 393, 244, 85, 80, 3, 10);
  animal1Trait.setItems(loadStrings("list_702361"), 0);
  animal1Trait.addEventHandler(this, "aniaml1TraitChange");
  breedingRate2 = new GSlider(this, 111, 337, 256, 40, 10.0);
  breedingRate2.setShowLimits(true);
  breedingRate2.setLimits(0.5, 0.0, 1.0);
  breedingRate2.setNumberFormat(G4P.DECIMAL, 2);
  breedingRate2.setOpaque(false);
  breedingRate2.addEventHandler(this, "breedingRate2Change");
  litterSize2 = new GSlider(this, 390, 337, 192, 40, 10.0);
  litterSize2.setShowLimits(true);
  litterSize2.setLimits(5.0, 0.0, 30.0);
  litterSize2.setNumberFormat(G4P.DECIMAL, 2);
  litterSize2.setOpaque(false);
  litterSize2.addEventHandler(this, "litterSize2Change");
  animal2Traits = new GCustomSlider(this, 388, 395, 156, 40, "grey_blue");
  animal2Traits.setLimits(0.5, 0.0, 1.0);
  animal2Traits.setNumberFormat(G4P.DECIMAL, 2);
  animal2Traits.setOpaque(false);
  animal2Traits.addEventHandler(this, "animal2TraitsChange");
  animal2Trait = new GDropList(this, 389, 376, 89, 84, 3, 10);
  animal2Trait.setItems(loadStrings("list_223443"), 0);
  animal2Trait.addEventHandler(this, "animal2TraitChange");
  beginButton = new GButton(this, 230, 510, 141, 59);
  beginButton.setText("NEXT");
  beginButton.addEventHandler(this, "beginButtonClick");
  backButton = new GButton(this, 380, 524, 80, 30);
  backButton.setText("RETURN");
  backButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  backButton.addEventHandler(this, "backButtonClick");
  pauseButton1 = new GButton(this, 22, 616, 89, 36);
  pauseButton1.setText("Pause");
  pauseButton1.setLocalColorScheme(GCScheme.RED_SCHEME);
  pauseButton1.addEventHandler(this, "pauseButton1Click");
  resetButton1 = new GButton(this, 122, 617, 87, 34);
  resetButton1.setText("Reset");
  resetButton1.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  resetButton1.addEventHandler(this, "resetButton1Click");
  showVariables1 = new GDropList(this, 226, 630, 90, 80, 3, 10);
  showVariables1.setItems(loadStrings("list_630746"), 0);
  showVariables1.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  showVariables1.addEventHandler(this, "showVariables1Change");
  shouldVariables = new GButton(this, 229, 656, 82, 31);
  shouldVariables.setText("Hide Variables");
  shouldVariables.setLocalColorScheme(GCScheme.RED_SCHEME);
  shouldVariables.addEventHandler(this, "showVariablesButtonClick");
  breedingRates = new GSlider(this, 404, 623, 116, 40, 10.0);
  breedingRates.setShowLimits(true);
  breedingRates.setLimits(0.5, 0.0, 1.0);
  breedingRates.setNumberFormat(G4P.DECIMAL, 2);
  breedingRates.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  breedingRates.setOpaque(false);
  breedingRates.addEventHandler(this, "breedingRateChange");
  litterSize = new GSlider(this, 404, 661, 115, 40, 10.0);
  litterSize.setShowLimits(true);
  litterSize.setLimits(1.0, 1.0, 10.0);
  litterSize.setNbrTicks(10);
  litterSize.setStickToTicks(true);
  litterSize.setShowTicks(true);
  litterSize.setNumberFormat(G4P.DECIMAL, 1);
  litterSize.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  litterSize.setOpaque(false);
  litterSize.addEventHandler(this, "litterSizeChange");
  animalTrait = new GDropList(this, 539, 630, 95, 80, 3, 10);
  animalTrait.setItems(loadStrings("list_969114"), 0);
  animalTrait.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  animalTrait.addEventHandler(this, "animalTraitChange");
  animalTraits = new GCustomSlider(this, 539, 640, 143, 40, "grey_blue");
  animalTraits.setLimits(0.5, 0.0, 1.0);
  animalTraits.setNumberFormat(G4P.DECIMAL, 2);
  animalTraits.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  animalTraits.setOpaque(false);
  animalTraits.addEventHandler(this, "animalTraitsChange");
  breedingRateText = new GLabel(this, 406, 614, 118, 20);
  breedingRateText.setText("Breeding Rate");
  breedingRateText.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  breedingRateText.setOpaque(false);
  litterSizeText = new GLabel(this, 403, 653, 80, 20);
  litterSizeText.setText("Litter Size");
  litterSizeText.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  litterSizeText.setOpaque(false);
  growthRateText = new GLabel(this, 97, 184, 128, 20);
  growthRateText.setText("Food Growth Rate");
  growthRateText.setOpaque(false);
  nutritionText = new GLabel(this, 393, 181, 80, 20);
  nutritionText.setText("Nutrition");
  nutritionText.setOpaque(false);
  humidityText = new GLabel(this, 95, 309, 80, 20);
  humidityText.setText("Humidity");
  humidityText.setOpaque(false);
  avgTempText = new GLabel(this, 95, 249, 206, 20);
  avgTempText.setText("Average Temperature");
  avgTempText.setOpaque(false);
  tempRangeText = new GLabel(this, 394, 246, 180, 20);
  tempRangeText.setText("Temperature Range");
  tempRangeText.setOpaque(false);
  breedingRate1Text = new GLabel(this, 112, 190, 118, 20);
  breedingRate1Text.setText("Breeding Rate");
  breedingRate1Text.setOpaque(false);
  litterSize1Text = new GLabel(this, 394, 192, 80, 20);
  litterSize1Text.setText("Litter Size");
  litterSize1Text.setOpaque(false);
  breedingRate2Text = new GLabel(this, 111, 324, 112, 20);
  breedingRate2Text.setText("Breeding Rate");
  breedingRate2Text.setOpaque(false);
  litterSize2Text = new GLabel(this, 389, 330, 80, 20);
  litterSize2Text.setText("Litter Size");
  litterSize2Text.setOpaque(false);
  sheepButton = new GButton(this, 113, 451, 80, 30);
  sheepButton.setText("Sheep");
  sheepButton.addEventHandler(this, "sheepButtonClick");
  frogButton = new GButton(this, 200, 450, 80, 30);
  frogButton.setText("Frog");
  frogButton.addEventHandler(this, "frogButtonClick");
  polarBearButton = new GButton(this, 290, 449, 80, 30);
  polarBearButton.setText("Polar Bear");
  polarBearButton.addEventHandler(this, "polarBearButtonClick");
  temp1Text = new GLabel(this, 113, 251, 202, 20);
  temp1Text.setText("Average Inner Temperature");
  temp1Text.setOpaque(false);
  avgInnerTemp1 = new GSlider(this, 114, 267, 254, 40, 10.0);
  avgInnerTemp1.setShowLimits(true);
  avgInnerTemp1.setLimits(0.5, 0.0, 1.0);
  avgInnerTemp1.setNumberFormat(G4P.DECIMAL, 2);
  avgInnerTemp1.setOpaque(false);
  avgInnerTemp1.addEventHandler(this, "avgInnerTemp1Change");
  avgInnerTemp2 = new GSlider(this, 112, 396, 255, 40, 10.0);
  avgInnerTemp2.setShowLimits(true);
  avgInnerTemp2.setLimits(0.5, 0.0, 1.0);
  avgInnerTemp2.setNumberFormat(G4P.DECIMAL, 2);
  avgInnerTemp2.setOpaque(false);
  avgInnerTemp2.addEventHandler(this, "avgInnerTemp2Change");
  temp2Text = new GLabel(this, 112, 381, 191, 20);
  temp2Text.setText("Average Inner Temperature");
  temp2Text.setOpaque(false);
  animationSpeed = new GSlider(this, 27, 664, 186, 40, 10.0);
  animationSpeed.setShowLimits(true);
  animationSpeed.setLimits(60.0, 5.0, 240.0);
  animationSpeed.setNbrTicks(5);
  animationSpeed.setStickToTicks(true);
  animationSpeed.setShowTicks(true);
  animationSpeed.setNumberFormat(G4P.DECIMAL, 2);
  animationSpeed.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  animationSpeed.setOpaque(false);
  animationSpeed.addEventHandler(this, "animationSpeedChange");
  animationSpeedText = new GLabel(this, 25, 657, 128, 20);
  animationSpeedText.setText("Animation Speed");
  animationSpeedText.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  animationSpeedText.setOpaque(false);
}

// Variable declarations 
// autogenerated do not edit
GButton startButton; 
GButton instructionsButton; 
GImageButton instructions; 
GButton returnButton; 
GSlider growthRate; 
GSlider nutrition_; 
GSlider averageTemp; 
GSlider tempRange; 
GSlider humidity_; 
GButton medow; 
GButton artic; 
GSlider breedingRate1; 
GSlider litterSize1; 
GCustomSlider animal1Traits; 
GDropList animal1Trait; 
GSlider breedingRate2; 
GSlider litterSize2; 
GCustomSlider animal2Traits; 
GDropList animal2Trait; 
GButton beginButton; 
GButton backButton; 
GButton pauseButton1; 
GButton resetButton1; 
GDropList showVariables1; 
GButton shouldVariables; 
GSlider breedingRates; 
GSlider litterSize; 
GDropList animalTrait; 
GCustomSlider animalTraits; 
GLabel breedingRateText; 
GLabel litterSizeText; 
GLabel growthRateText; 
GLabel nutritionText; 
GLabel humidityText; 
GLabel avgTempText; 
GLabel tempRangeText; 
GLabel breedingRate1Text; 
GLabel litterSize1Text; 
GLabel breedingRate2Text; 
GLabel litterSize2Text; 
GButton sheepButton; 
GButton frogButton; 
GButton polarBearButton; 
GLabel temp1Text; 
GSlider avgInnerTemp1; 
GSlider avgInnerTemp2; 
GLabel temp2Text; 
GSlider animationSpeed; 
GLabel animationSpeedText; 
