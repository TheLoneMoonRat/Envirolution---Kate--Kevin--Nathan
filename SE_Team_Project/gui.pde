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
  if (end) {
    instructionsButton.setVisible(true);
    
    clearForStart();
    titleScreen = true;
    end = false;
  }
    
  else {
    instructionsButton.setVisible(false);
    startButton.setVisible(false);
    setupScreenEnvironment = true;
    titleScreen = false;
  }
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
  foodRate = 101 - growthRate.getValueF();
} //_CODE_:growthRate:851713:

public void nutrition_Change(GSlider source, GEvent event) { //_CODE_:nutrition_:906414:
  nutritionAdjuster = nutrition_.getValueF();
} //_CODE_:nutrition_:906414:

public void averageTempChange(GSlider source, GEvent event) { //_CODE_:averageTemp:400803:
  field.avgTemp = averageTemp.getValueF();
} //_CODE_:averageTemp:400803:

public void tempRangeChange(GSlider source, GEvent event) { //_CODE_:tempRange:337308:
  field.tempRange = tempRange.getValueF();
} //_CODE_:tempRange:337308:

public void humidity_Change(GSlider source, GEvent event) { //_CODE_:humidity_:856470:
  field.humidity = humidity_.getValueF();
} //_CODE_:humidity_:856470:

public void medowClick(GButton source, GEvent event) { //_CODE_:medow:484108:
  medow.setLocalColorScheme(7);
  artic.setLocalColorScheme(1);
  
  growthRate.setValue(80);
  nutrition_.setValue(17);
  averageTemp.setValue(20);
  tempRange.setValue(15);
} //_CODE_:medow:484108:

public void articClick(GButton source, GEvent event) { //_CODE_:artic:557486:
  artic.setLocalColorScheme(7);
  medow.setLocalColorScheme(1);
  
  growthRate.setValue(30);
  nutrition_.setValue(10);
  averageTemp.setValue(-10);
  tempRange.setValue(5);
} //_CODE_:artic:557486:

public void breedingRate1Change(GSlider source, GEvent event) { //_CODE_:breedingRate1:600015:
} //_CODE_:breedingRate1:600015:

public void litterSize1Change(GSlider source, GEvent event) { //_CODE_:litterSize1:941264:
  size = litterSize.getValueI();
} //_CODE_:litterSize1:941264:

public void animal1TraitsChange(GCustomSlider source, GEvent event) { //_CODE_:animal1Traits:793901:
  setting = animal1Trait.getSelectedText();  
  Animal a = animals.get(0);
    if (setting.equals("Aggression")) {
      a.aggression = animal1Traits.getValueF();
    } else if (setting.equals("Size")) {
      a.size = animal1Traits.getValueF();
    } else if (setting.equals("Speed")) {
      a.speed = animal1Traits.getValueF();
    } else if (setting.equals("Vision")) {
      a.vision = animal1Traits.getValueF();
    }
} //_CODE_:animal1Traits:793901:

public void aniaml1TraitChange(GDropList source, GEvent event) { //_CODE_:animal1Trait:702361:
  setting = animal1Trait.getSelectedText();  
  Animal a = animals.get(0);
    if (setting.equals("Aggression")) {
      animal1Traits.setLimits(a.aggression, 1, 100);
      a.aggression = animal1Traits.getValueF();
    } else if (setting.equals("Size")) {
      animal1Traits.setLimits(a.size, 3, 12);
      a.size = animal1Traits.getValueF();
    } else if (setting.equals("Speed")) {
      animal1Traits.setLimits(a.speed, 5, 80);
      a.speed = animal1Traits.getValueF();
    } else if (setting.equals("Vision")) {
      animal1Traits.setLimits(a.vision, 20, 600);
      a.vision = animal1Traits.getValueF();
    }
} //_CODE_:animal1Trait:702361:

public void breedingRate2Change(GSlider source, GEvent event) { //_CODE_:breedingRate2:762987:
} //_CODE_:breedingRate2:762987:

public void litterSize2Change(GSlider source, GEvent event) { //_CODE_:litterSize2:317562:
  size = litterSize2.getValueI();
} //_CODE_:litterSize2:317562:

public void animal2TraitsChange(GCustomSlider source, GEvent event) { //_CODE_:animal2Traits:534204:
  setting = animal2Trait.getSelectedText();  
  Animal a = animals.get(1);
    if (setting.equals("Aggression")) {
      a.aggression = animal2Traits.getValueF();
    } else if (setting.equals("Size")) {
      a.size = animal2Traits.getValueF();
    } else if (setting.equals("Speed")) {
      a.speed = animal2Traits.getValueF();
    } else if (setting.equals("Vision")) {
      a.vision = animal2Traits.getValueF();
    }
} //_CODE_:animal2Traits:534204:

public void animal2TraitChange(GDropList source, GEvent event) { //_CODE_:animal2Trait:223443:
  setting = animal2Trait.getSelectedText();  
  Animal a = animals.get(1);
    if (setting.equals("Aggression")) {
      animal2Traits.setLimits(a.aggression, 1, 100);
      a.aggression = animal2Traits.getValueF();
    } else if (setting.equals("Size")) {
      animal2Traits.setLimits(a.size, 3, 12);
      a.size = animal2Traits.getValueF();
    } else if (setting.equals("Speed")) {
      animal2Traits.setLimits(a.speed, 5, 80);
      a.speed = animal2Traits.getValueF();
    } else if (setting.equals("Vision")) {
      animal2Traits.setLimits(a.vision, 20, 600);
      a.vision = animal2Traits.getValueF();
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
      timePassed = 0;
      setupScreenAnimals = false;
      reset();
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
  breedingRate = breedingRates.getValueF();
} //_CODE_:breedingRates:281233:

public void litterSizeChange(GSlider source, GEvent event) { //_CODE_:litterSize:321692:
  size = litterSize.getValueI();
} //_CODE_:litterSize:321692:

public void animalTraitChange(GDropList source, GEvent event) { //_CODE_:animalTrait:969114:
  setting = animalTrait.getSelectedText();
  if (setting.equals("Aggression")) {
    animalTraits.setLimits(selected.get(0).aggression, 1, 100);
  } else if (setting.equals("Size")) {
    animalTraits.setLimits(selected.get(0).size, 2, 25);
  } else if (setting.equals("Speed")) {
    animalTraits.setLimits(selected.get(0).speed, 5, 80);
  } else if (setting.equals("Vision")) {
    animalTraits.setLimits(selected.get(0).vision, 20, 600);
  }
} //_CODE_:animalTrait:969114:

public void animalTraitsChange(GCustomSlider source, GEvent event) { //_CODE_:animalTraits:417672:
} //_CODE_:animalTraits:417672:

public void animationSpeedChange(GSlider source, GEvent event) { //_CODE_:animationSpeed:981070:
  simSpeed = animationSpeed.getValueI(); 
} //_CODE_:animationSpeed:981070:

public void red1Change(GSlider source, GEvent event) { //_CODE_:red1:343643:
  Animal a = animals.get(0);
  a.red = red1.getValueF();
} //_CODE_:red1:343643:

public void green1Change(GSlider source, GEvent event) { //_CODE_:green1:856703:
  Animal a = animals.get(0);
  a.green = green1.getValueF();
} //_CODE_:green1:856703:

public void blue1Change(GSlider source, GEvent event) { //_CODE_:blue1:383988:
  Animal a = animals.get(0);
  a.blue = blue1.getValueF();
} //_CODE_:blue1:383988:

public void red2Change(GSlider source, GEvent event) { //_CODE_:red2:748210:
  Animal a = animals.get(1);
  a.red = red2.getValueF();
} //_CODE_:red2:748210:

public void green2Change(GSlider source, GEvent event) { //_CODE_:green2:692488:
  Animal a = animals.get(1);
  a.green = green2.getValueF();
} //_CODE_:green2:692488:

public void blue2Change(GSlider source, GEvent event) { //_CODE_:blue2:622304:
  Animal a = animals.get(1);
  a.blue = blue2.getValueF();
} //_CODE_:blue2:622304:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.GREEN_SCHEME);
  G4P.setMouseOverEnabled(false);
  G4P.setDisplayFont("Impact", G4P.PLAIN, 16);
  G4P.setInputFont("Impact", G4P.PLAIN, 14);
  surface.setTitle("Sketch Window");
  startButton = new GButton(this, 217, 449, 250, 75);
  startButton.setText("START");
  startButton.addEventHandler(this, "startButtonClick");
  instructionsButton = new GButton(this, 286, 536, 116, 44);
  instructionsButton.setText("instructions");
  instructionsButton.addEventHandler(this, "instructionsButtonClick");
  instructions = new GImageButton(this, 113, 50, 475, 525, new String[] { "IMG_0199.PNG", "IMG_0199.PNG", "IMG_0199.PNG" } );
  instructions.addEventHandler(this, "imgButton1_click1");
  returnButton = new GButton(this, 275, 612, 150, 50);
  returnButton.setText("Return");
  returnButton.addEventHandler(this, "returnButtonClick");
  growthRate = new GSlider(this, 96, 197, 271, 40, 10.0);
  growthRate.setShowLimits(true);
  growthRate.setLimits(50.0, 0.0, 100.0);
  growthRate.setNumberFormat(G4P.DECIMAL, 2);
  growthRate.setOpaque(false);
  growthRate.addEventHandler(this, "growthRateChange");
  nutrition_ = new GSlider(this, 383, 197, 194, 40, 10.0);
  nutrition_.setShowLimits(true);
  nutrition_.setLimits(75.0, 65.0, 80.0);
  nutrition_.setNumberFormat(G4P.DECIMAL, 2);
  nutrition_.setOpaque(false);
  nutrition_.addEventHandler(this, "nutrition_Change");
  averageTemp = new GSlider(this, 97, 259, 271, 40, 10.0);
  averageTemp.setShowLimits(true);
  averageTemp.setLimits(20.0, -30.0, 40.0);
  averageTemp.setNumberFormat(G4P.DECIMAL, 2);
  averageTemp.setOpaque(false);
  averageTemp.addEventHandler(this, "averageTempChange");
  tempRange = new GSlider(this, 381, 260, 195, 40, 10.0);
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
  breedingRate1.setLimits(800.0, 50.0, 2000.0);
  breedingRate1.setNumberFormat(G4P.DECIMAL, 2);
  breedingRate1.setOpaque(false);
  breedingRate1.addEventHandler(this, "breedingRate1Change");
  litterSize1 = new GSlider(this, 392, 206, 207, 40, 10.0);
  litterSize1.setShowLimits(true);
  litterSize1.setLimits(5.0, 0.0, 30.0);
  litterSize1.setNumberFormat(G4P.DECIMAL, 2);
  litterSize1.setOpaque(false);
  litterSize1.addEventHandler(this, "litterSize1Change");
  animal1Traits = new GCustomSlider(this, 112, 267, 168, 40, "grey_blue");
  animal1Traits.setShowLimits(true);
  animal1Traits.setLimits(25.0, 0.0, 100.0);
  animal1Traits.setNumberFormat(G4P.DECIMAL, 2);
  animal1Traits.setOpaque(false);
  animal1Traits.addEventHandler(this, "animal1TraitsChange");
  animal1Trait = new GDropList(this, 113, 254, 86, 84, 3, 10);
  animal1Trait.setItems(loadStrings("list_702361"), 0);
  animal1Trait.addEventHandler(this, "aniaml1TraitChange");
  breedingRate2 = new GSlider(this, 117, 398, 256, 40, 10.0);
  breedingRate2.setShowLimits(true);
  breedingRate2.setLimits(800.0, 50.0, 2000.0);
  breedingRate2.setNumberFormat(G4P.DECIMAL, 2);
  breedingRate2.setOpaque(false);
  breedingRate2.addEventHandler(this, "breedingRate2Change");
  litterSize2 = new GSlider(this, 382, 400, 213, 40, 10.0);
  litterSize2.setShowLimits(true);
  litterSize2.setLimits(5.0, 0.0, 30.0);
  litterSize2.setNumberFormat(G4P.DECIMAL, 2);
  litterSize2.setOpaque(false);
  litterSize2.addEventHandler(this, "litterSize2Change");
  animal2Traits = new GCustomSlider(this, 119, 460, 159, 40, "grey_blue");
  animal2Traits.setShowLimits(true);
  animal2Traits.setLimits(25.0, 0.0, 100.0);
  animal2Traits.setNumberFormat(G4P.DECIMAL, 2);
  animal2Traits.setOpaque(false);
  animal2Traits.addEventHandler(this, "animal2TraitsChange");
  animal2Trait = new GDropList(this, 120, 446, 89, 84, 3, 10);
  animal2Trait.setItems(loadStrings("list_223443"), 0);
  animal2Trait.addEventHandler(this, "animal2TraitChange");
  beginButton = new GButton(this, 375, 112, 141, 59);
  beginButton.setText("NEXT");
  beginButton.addEventHandler(this, "beginButtonClick");
  backButton = new GButton(this, 521, 127, 80, 30);
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
  breedingRates.setLimits(1.0, 0.0, 2.0);
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
  litterSize1Text = new GLabel(this, 385, 192, 80, 20);
  litterSize1Text.setText("Litter Size");
  litterSize1Text.setOpaque(false);
  breedingRate2Text = new GLabel(this, 117, 386, 112, 20);
  breedingRate2Text.setText("Breeding Rate");
  breedingRate2Text.setOpaque(false);
  litterSize2Text = new GLabel(this, 381, 384, 80, 20);
  litterSize2Text.setText("Litter Size");
  litterSize2Text.setOpaque(false);
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
  red1 = new GSlider(this, 290, 267, 100, 40, 10.0);
  red1.setShowLimits(true);
  red1.setLimits(0.5, 0.0, 255.0);
  red1.setNumberFormat(G4P.DECIMAL, 2);
  red1.setOpaque(false);
  red1.addEventHandler(this, "red1Change");
  green1 = new GSlider(this, 392, 268, 100, 40, 10.0);
  green1.setShowLimits(true);
  green1.setLimits(0.5, 0.0, 255.0);
  green1.setNumberFormat(G4P.DECIMAL, 2);
  green1.setOpaque(false);
  green1.addEventHandler(this, "green1Change");
  blue1 = new GSlider(this, 497, 268, 100, 40, 10.0);
  blue1.setShowLimits(true);
  blue1.setLimits(0.5, 0.0, 255.0);
  blue1.setNumberFormat(G4P.DECIMAL, 2);
  blue1.setOpaque(false);
  blue1.addEventHandler(this, "blue1Change");
  red2 = new GSlider(this, 286, 461, 100, 40, 10.0);
  red2.setShowLimits(true);
  red2.setLimits(0.5, 0.0, 255.0);
  red2.setNumberFormat(G4P.DECIMAL, 2);
  red2.setOpaque(false);
  red2.addEventHandler(this, "red2Change");
  green2 = new GSlider(this, 391, 461, 100, 40, 10.0);
  green2.setShowLimits(true);
  green2.setLimits(0.5, 0.0, 255.0);
  green2.setNumberFormat(G4P.DECIMAL, 2);
  green2.setOpaque(false);
  green2.addEventHandler(this, "green2Change");
  blue2 = new GSlider(this, 495, 461, 100, 40, 10.0);
  blue2.setShowLimits(true);
  blue2.setLimits(255.0, 0.0, 255.0);
  blue2.setNumberFormat(G4P.DECIMAL, 2);
  blue2.setOpaque(false);
  blue2.addEventHandler(this, "blue2Change");
  red1Text = new GLabel(this, 288, 255, 80, 20);
  red1Text.setText("Red");
  red1Text.setOpaque(false);
  green1Text = new GLabel(this, 394, 254, 80, 20);
  green1Text.setText("Green");
  green1Text.setOpaque(false);
  blue1Text = new GLabel(this, 497, 255, 80, 20);
  blue1Text.setText("Blue");
  blue1Text.setOpaque(false);
  red2Text = new GLabel(this, 288, 450, 80, 20);
  red2Text.setText("Red");
  red2Text.setOpaque(false);
  green2Text = new GLabel(this, 392, 451, 80, 20);
  green2Text.setText("Green");
  green2Text.setOpaque(false);
  blue2Text = new GLabel(this, 497, 451, 80, 20);
  blue2Text.setText("Blue");
  blue2Text.setOpaque(false);
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
GSlider animationSpeed; 
GLabel animationSpeedText; 
GSlider red1; 
GSlider green1; 
GSlider blue1; 
GSlider red2; 
GSlider green2; 
GSlider blue2; 
GLabel red1Text; 
GLabel green1Text; 
GLabel blue1Text; 
GLabel red2Text; 
GLabel green2Text; 
GLabel blue2Text; 
