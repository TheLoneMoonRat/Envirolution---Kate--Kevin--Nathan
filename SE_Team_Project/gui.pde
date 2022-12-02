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
  for (Animal a : animals) {
    if (setting.equals("Aggression")) {
      variable_slide.setLimits(a.aggression, 1, 10);
    } else if (setting.equals("Size")) {
      variable_slide.setLimits(a.size, 3, 12);
    } else if (setting.equals("Speed")) {
      variable_slide.setLimits(a.speed, 15, 5);
    }
  }
} //_CODE_:variable_adjuster:515417:

public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:225846:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:button1:225846:

public void button2_click1(GButton source, GEvent event) { //_CODE_:button2:744844:
  println("button2 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:button2:744844:

public void slider1_change1(GSlider source, GEvent event) { //_CODE_:slider1:542565:
  println("slider1 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:slider1:542565:

public void slider2_change1(GSlider source, GEvent event) { //_CODE_:slider2:448061:
  println("slider2 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:slider2:448061:

public void slider3_change1(GSlider source, GEvent event) { //_CODE_:slider3:397728:
  println("slider3 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:slider3:397728:

public void slider4_change1(GSlider source, GEvent event) { //_CODE_:slider4:572888:
  println("slider4 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:slider4:572888:

public void slider5_change1(GSlider source, GEvent event) { //_CODE_:slider5:227894:
  println("slider5 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:slider5:227894:

public void slider6_change1(GSlider source, GEvent event) { //_CODE_:slider6:257243:
  println("slider6 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:slider6:257243:

public void slider7_change1(GSlider source, GEvent event) { //_CODE_:slider7:934872:
  println("slider7 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:slider7:934872:

public void button3_click1(GButton source, GEvent event) { //_CODE_:button3:278587:
  println("button3 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:button3:278587:

public void button4_click1(GButton source, GEvent event) { //_CODE_:button4:710646:
  println("button4 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:button4:710646:

public void button5_click1(GButton source, GEvent event) { //_CODE_:button5:863191:
  println("button5 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:button5:863191:



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
  variable_slide = new GCustomSlider(window1, 365, 191, 127, 40, "grey_blue");
  variable_slide.setLimits(0.5, 0.0, 1.0);
  variable_slide.setNumberFormat(G4P.DECIMAL, 2);
  variable_slide.setOpaque(false);
  variable_slide.addEventHandler(this, "custom_slider1_change1");
  variable_adjuster = new GDropList(window1, 366, 168, 90, 80, 3, 10);
  variable_adjuster.setItems(loadStrings("list_515417"), 0);
  variable_adjuster.addEventHandler(this, "dropList1_click");
  button1 = new GButton(window1, 12, 12, 80, 30);
  button1.setText("Pause");
  button1.addEventHandler(this, "button1_click1");
  button2 = new GButton(window1, 102, 12, 80, 30);
  button2.setText("Reset");
  button2.addEventHandler(this, "button2_click1");
  label1 = new GLabel(window1, 11, 66, 80, 20);
  label1.setText("Enviroment");
  label1.setOpaque(false);
  label2 = new GLabel(window1, 8, 97, 150, 20);
  label2.setText("Food Growth Rate");
  label2.setOpaque(false);
  slider1 = new GSlider(window1, 9, 119, 170, 40, 10.0);
  slider1.setLimits(0.5, 0.0, 1.0);
  slider1.setNumberFormat(G4P.DECIMAL, 2);
  slider1.setOpaque(false);
  slider1.addEventHandler(this, "slider1_change1");
  label3 = new GLabel(window1, 9, 168, 80, 20);
  label3.setText("Nutrition");
  label3.setOpaque(false);
  slider2 = new GSlider(window1, 10, 190, 168, 40, 10.0);
  slider2.setLimits(0.5, 0.0, 1.0);
  slider2.setNumberFormat(G4P.DECIMAL, 2);
  slider2.setOpaque(false);
  slider2.addEventHandler(this, "slider2_change1");
  label4 = new GLabel(window1, 10, 240, 150, 20);
  label4.setText("Average Temperature");
  label4.setOpaque(false);
  slider3 = new GSlider(window1, 10, 262, 167, 40, 10.0);
  slider3.setLimits(0.5, 0.0, 1.0);
  slider3.setNumberFormat(G4P.DECIMAL, 2);
  slider3.setOpaque(false);
  slider3.addEventHandler(this, "slider3_change1");
  label5 = new GLabel(window1, 9, 313, 120, 21);
  label5.setText("Humidity");
  label5.setOpaque(false);
  slider4 = new GSlider(window1, 9, 336, 168, 40, 10.0);
  slider4.setLimits(0.5, 0.0, 1.0);
  slider4.setNumberFormat(G4P.DECIMAL, 2);
  slider4.setOpaque(false);
  slider4.addEventHandler(this, "slider4_change1");
  label6 = new GLabel(window1, 226, 64, 80, 20);
  label6.setText("Animal");
  label6.setOpaque(false);
  label7 = new GLabel(window1, 225, 96, 80, 20);
  label7.setText("Pack Size");
  label7.setOpaque(false);
  slider5 = new GSlider(window1, 224, 117, 125, 40, 10.0);
  slider5.setLimits(0.5, 0.0, 1.0);
  slider5.setNumberFormat(G4P.DECIMAL, 2);
  slider5.setOpaque(false);
  slider5.addEventHandler(this, "slider5_change1");
  label8 = new GLabel(window1, 367, 95, 95, 20);
  label8.setText("Breeding Rate");
  label8.setOpaque(false);
  slider6 = new GSlider(window1, 367, 116, 124, 40, 10.0);
  slider6.setLimits(0.5, 0.0, 1.0);
  slider6.setNumberFormat(G4P.DECIMAL, 2);
  slider6.setOpaque(false);
  slider6.addEventHandler(this, "slider6_change1");
  label9 = new GLabel(window1, 222, 170, 95, 20);
  label9.setText("Litter Size");
  label9.setOpaque(false);
  slider7 = new GSlider(window1, 222, 190, 125, 40, 10.0);
  slider7.setLimits(0.5, 0.0, 1.0);
  slider7.setNumberFormat(G4P.DECIMAL, 2);
  slider7.setOpaque(false);
  slider7.addEventHandler(this, "slider7_change1");
  togGroup1 = new GToggleGroup();
  button3 = new GButton(window1, 225, 344, 80, 30);
  button3.setText("Rabbit");
  button3.addEventHandler(this, "button3_click1");
  button4 = new GButton(window1, 317, 343, 80, 30);
  button4.setText("Frog");
  button4.addEventHandler(this, "button4_click1");
  button5 = new GButton(window1, 411, 343, 80, 30);
  button5.setText("Lizard");
  button5.addEventHandler(this, "button5_click1");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GCustomSlider variable_slide; 
GDropList variable_adjuster; 
GButton button1; 
GButton button2; 
GLabel label1; 
GLabel label2; 
GSlider slider1; 
GLabel label3; 
GSlider slider2; 
GLabel label4; 
GSlider slider3; 
GLabel label5; 
GSlider slider4; 
GLabel label6; 
GLabel label7; 
GSlider slider5; 
GLabel label8; 
GSlider slider6; 
GLabel label9; 
GSlider slider7; 
GToggleGroup togGroup1; 
GButton button3; 
GButton button4; 
GButton button5; 
