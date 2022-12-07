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

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:599795:
  appc.background(230);
} //_CODE_:window1:599795:

public void custom_slider1_change1(GCustomSlider source, GEvent event) { //_CODE_:variable_slide:698200:

} //_CODE_:variable_slide:698200:

public void dropList1_click(GDropList source, GEvent event) { //_CODE_:variable_adjuster:515417:
  setting = variable_adjuster.getSelectedText();  
  for (Animal a : selected) {
    if (setting.equals("Aggression")) {
      variable_slide.setLimits(a.aggression, 1, 10);
    } else if (setting.equals("Size")) {
      variable_slide.setLimits(a.size, 3, 12);
    } else if (setting.equals("Speed")) {
      variable_slide.setLimits(a.speed, 5, 80);
    } else if (setting.equals("Vision")) {
      variable_slide.setLimits(a.vision, 20, 600);
    }
  }
} //_CODE_:variable_adjuster:515417:

public void pauseButtonClick(GButton source, GEvent event) { //_CODE_:pauseButton:225846:
  if (play == true) {
    play = false;
    noLoop();
    pauseButton.setLocalColorScheme(1);
    pauseButton.setText("Play");
  }
  else {
    play = true;
    loop();
    pauseButton.setLocalColorScheme(0);
    pauseButton.setText("Pause");
  }
} //_CODE_:pauseButton:225846:

public void resetButtonClick(GButton source, GEvent event) { //_CODE_:resetButton:744844:
  reset();
} //_CODE_:resetButton:744844:

public void change_food_growth(GSlider source, GEvent event) { //_CODE_:food_growth:542565:
  foodRate = food_growth.getValueF();
} //_CODE_:food_growth:542565:

public void slider2_change1(GSlider source, GEvent event) { //_CODE_:nutrition:448061:
  nutritionAdjuster = nutrition.getValueF();
} //_CODE_:nutrition:448061:

public void temperatureChange(GSlider source, GEvent event) { //_CODE_:temperature:397728:
  field.temp = temperature.getValueF();
} //_CODE_:temperature:397728:

public void slider4_change1(GSlider source, GEvent event) { //_CODE_:humidity:572888:
  println("slider4 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:humidity:572888:

public void slider6_change1(GSlider source, GEvent event) { //_CODE_:breeding_rate:257243:
  breedingRate = -breeding_rate.getValueF();
} //_CODE_:breeding_rate:257243:

public void slider7_change1(GSlider source, GEvent event) { //_CODE_:litter_size:934872:
  litterSize = litter_size.getValueI();
} //_CODE_:litter_size:934872:

public void button3_click1(GButton source, GEvent event) { //_CODE_:rabbit:278587:
  println("button3 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:rabbit:278587:

public void button4_click1(GButton source, GEvent event) { //_CODE_:frog:710646:
  println("button4 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:frog:710646:

public void button5_click1(GButton source, GEvent event) { //_CODE_:lizard:863191:
  println("button5 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:lizard:863191:

public void showVariables_change(GDropList source, GEvent event) { //_CODE_:showVariables:365506:
  hungerTag = false;
  ageTag = false;
} //_CODE_:showVariables:365506:

public void changeVisibility(GButton source, GEvent event) { //_CODE_:shouldShow:579965:
  if (showVariables.getSelectedText().equals("Hunger") || showVariables.getSelectedText().equals("")) {
    if (!hungerTag) {
      hungerTag = true;
      shouldShow.setText("Hide Variables");
      shouldShow.setLocalColorScheme(0);
    } else {
      hungerTag = false;
      shouldShow.setText("Show Variables");
      shouldShow.setLocalColorScheme(1);
    }
  } else if (showVariables.getSelectedText().equals("Age")) {
    if (!ageTag) {
      ageTag = true;
      shouldShow.setText("Hide Variables");
      shouldShow.setLocalColorScheme(0);
    }
    else {
      ageTag = false;
      shouldShow.setText("Show Variables");
      shouldShow.setLocalColorScheme(1);
    }
  }
} //_CODE_:shouldShow:579965:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 500, 400, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  variable_slide = new GCustomSlider(window1, 364, 183, 127, 40, "grey_blue");
  variable_slide.setLimits(0.5, 0.0, 1.0);
  variable_slide.setNumberFormat(G4P.DECIMAL, 2);
  variable_slide.setOpaque(false);
  variable_slide.addEventHandler(this, "custom_slider1_change1");
  variable_adjuster = new GDropList(window1, 234, 196, 90, 80, 3, 10);
  variable_adjuster.setItems(loadStrings("list_515417"), 0);
  variable_adjuster.addEventHandler(this, "dropList1_click");
  pauseButton = new GButton(window1, 12, 12, 80, 30);
  pauseButton.setText("Pause");
  pauseButton.setLocalColorScheme(GCScheme.RED_SCHEME);
  pauseButton.addEventHandler(this, "pauseButtonClick");
  resetButton = new GButton(window1, 102, 12, 80, 30);
  resetButton.setText("Reset");
  resetButton.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  resetButton.addEventHandler(this, "resetButtonClick");
  label1 = new GLabel(window1, 11, 66, 80, 20);
  label1.setText("Enviroment");
  label1.setOpaque(false);
  label2 = new GLabel(window1, 8, 97, 150, 20);
  label2.setText("Food Growth Rate");
  label2.setOpaque(false);
  food_growth = new GSlider(window1, 9, 119, 170, 40, 10.0);
  food_growth.setLimits(200.0, 0.0, 390.0);
  food_growth.setNumberFormat(G4P.DECIMAL, 2);
  food_growth.setOpaque(false);
  food_growth.addEventHandler(this, "change_food_growth");
  label3 = new GLabel(window1, 9, 168, 80, 20);
  label3.setText("Nutrition");
  label3.setOpaque(false);
  nutrition = new GSlider(window1, 10, 190, 168, 40, 10.0);
  nutrition.setLimits(35.0, 0.0, 70.0);
  nutrition.setNbrTicks(7);
  nutrition.setShowTicks(true);
  nutrition.setNumberFormat(G4P.DECIMAL, 2);
  nutrition.setOpaque(false);
  nutrition.addEventHandler(this, "slider2_change1");
  label4 = new GLabel(window1, 10, 240, 150, 20);
  label4.setText("Temperature");
  label4.setOpaque(false);
  temperature = new GSlider(window1, 10, 262, 167, 40, 10.0);
  temperature.setLimits(20.0, -40.0, 60.0);
  temperature.setNbrTicks(10);
  temperature.setShowTicks(true);
  temperature.setNumberFormat(G4P.DECIMAL, 2);
  temperature.setOpaque(false);
  temperature.addEventHandler(this, "temperatureChange");
  label5 = new GLabel(window1, 9, 313, 120, 21);
  label5.setText("Humidity");
  label5.setOpaque(false);
  humidity = new GSlider(window1, 9, 336, 168, 40, 10.0);
  humidity.setLimits(5.0, 0.0, 10.0);
  humidity.setNbrTicks(5);
  humidity.setShowTicks(true);
  humidity.setNumberFormat(G4P.DECIMAL, 2);
  humidity.setOpaque(false);
  humidity.addEventHandler(this, "slider4_change1");
  label6 = new GLabel(window1, 226, 64, 80, 20);
  label6.setText("Animal");
  label6.setOpaque(false);
  label8 = new GLabel(window1, 367, 95, 95, 20);
  label8.setText("Breeding Rate");
  label8.setOpaque(false);
  breeding_rate = new GSlider(window1, 364, 116, 124, 40, 10.0);
  breeding_rate.setLimits(0.0, -800.0, 1000.0);
  breeding_rate.setNbrTicks(5);
  breeding_rate.setShowTicks(true);
  breeding_rate.setNumberFormat(G4P.DECIMAL, 2);
  breeding_rate.setOpaque(false);
  breeding_rate.addEventHandler(this, "slider6_change1");
  label9 = new GLabel(window1, 226, 95, 95, 20);
  label9.setText("Litter Size");
  label9.setOpaque(false);
  litter_size = new GSlider(window1, 225, 116, 125, 40, 10.0);
  litter_size.setLimits(2.0, 0.0, 10.0);
  litter_size.setNbrTicks(5);
  litter_size.setStickToTicks(true);
  litter_size.setShowTicks(true);
  litter_size.setNumberFormat(G4P.DECIMAL, 2);
  litter_size.setOpaque(false);
  litter_size.addEventHandler(this, "slider7_change1");
  togGroup1 = new GToggleGroup();
  rabbit = new GButton(window1, 225, 344, 80, 30);
  rabbit.setText("Rabbit");
  rabbit.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  rabbit.addEventHandler(this, "button3_click1");
  frog = new GButton(window1, 317, 343, 80, 30);
  frog.setText("Frog");
  frog.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  frog.addEventHandler(this, "button4_click1");
  lizard = new GButton(window1, 411, 343, 80, 30);
  lizard.setText("Lizard");
  lizard.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  lizard.addEventHandler(this, "button5_click1");
  showVariables = new GDropList(window1, 235, 271, 90, 80, 3, 10);
  showVariables.setItems(loadStrings("list_365506"), 0);
  showVariables.addEventHandler(this, "showVariables_change");
  shouldShow = new GButton(window1, 384, 266, 80, 30);
  shouldShow.setText("Show Variables");
  shouldShow.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  shouldShow.addEventHandler(this, "changeVisibility");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GCustomSlider variable_slide; 
GDropList variable_adjuster; 
GButton pauseButton; 
GButton resetButton; 
GLabel label1; 
GLabel label2; 
GSlider food_growth; 
GLabel label3; 
GSlider nutrition; 
GLabel label4; 
GSlider temperature; 
GLabel label5; 
GSlider humidity; 
GLabel label6; 
GLabel label8; 
GSlider breeding_rate; 
GLabel label9; 
GSlider litter_size; 
GToggleGroup togGroup1; 
GButton rabbit; 
GButton frog; 
GButton lizard; 
GDropList showVariables; 
GButton shouldShow; 
