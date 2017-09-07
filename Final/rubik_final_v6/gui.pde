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


synchronized public void win_draw2(PApplet appc, GWinData data) { //_CODE_:window2:851923:
  appc.background(230);
} //_CODE_:window2:851923:

public void front_prime_click(GButton source, GEvent event) { //_CODE_:front_prime:285633:
 // println("front_prime - GButton >> GEvent." + event + " @ " + millis());
  cube.front_prime();
  cube.play();
} //_CODE_:front_prime:285633:

public void front_click(GButton source, GEvent event) { //_CODE_:front:502558:
  //println("front - GButton >> GEvent." + event + " @ " + millis());
  cube.front();
  cube.play();
} //_CODE_:front:502558:

public void back_prime_click(GButton source, GEvent event) { //_CODE_:back_prime:635683:
  //println("back_prime - GButton >> GEvent." + event + " @ " + millis());
  cube.back_prime();
  cube.play();
} //_CODE_:back_prime:635683:

public void back_click(GButton source, GEvent event) { //_CODE_:back:458744:
  //println("back - GButton >> GEvent." + event + " @ " + millis());
  cube.back();
  cube.play();
} //_CODE_:back:458744:

public void left_prime_click(GButton source, GEvent event) { //_CODE_:Left_prime:546946:
  //println("Left_prime - GButton >> GEvent." + event + " @ " + millis());
  cube.left_prime();
  cube.play();
} //_CODE_:Left_prime:546946:

public void left_click(GButton source, GEvent event) { //_CODE_:left:791982:
  //println("left - GButton >> GEvent." + event + " @ " + millis());
  cube.left();
  cube.play();
} //_CODE_:left:791982:

public void right_prime_click(GButton source, GEvent event) { //_CODE_:right_prime:604104:
  //println("right_prime - GButton >> GEvent." + event + " @ " + millis());
  cube.right_prime();
  cube.play();
} //_CODE_:right_prime:604104:

public void right_click(GButton source, GEvent event) { //_CODE_:right:526726:
  //println("right - GButton >> GEvent." + event + " @ " + millis());
  cube.right();
  cube.play();
} //_CODE_:right:526726:

public void up_prime_click(GButton source, GEvent event) { //_CODE_:up_prime:655338:
  //println("up_prime - GButton >> GEvent." + event + " @ " + millis());
  cube.up_prime();
  cube.play();
} //_CODE_:up_prime:655338:

public void up_click(GButton source, GEvent event) { //_CODE_:up:344744:
  //println("up - GButton >> GEvent." + event + " @ " + millis());
  cube.up();
  cube.play();
} //_CODE_:up:344744:

public void down_click(GButton source, GEvent event) { //_CODE_:down:895144:
  //println("down - GButton >> GEvent." + event + " @ " + millis());
  cube.down();
  cube.play();
} //_CODE_:down:895144:

public void down_prime_click(GButton source, GEvent event) { //_CODE_:down_prime:853644:
  //println("down_prime - GButton >> GEvent." + event + " @ " + millis());
  cube.down_prime();
  cube.play();
} //_CODE_:down_prime:853644:

public void solve_click(GButton source, GEvent event) { //_CODE_:Solve:602229:
  //println("Solve - GButton >> GEvent." + event + " @ " + millis());
  cube.solve();
} //_CODE_:Solve:602229:

public void scramble_click(GButton source, GEvent event) { //_CODE_:Scramble:875104:
  //println("Scramble - GButton >> GEvent." + event + " @ " + millis());
  cube.scramble();
} //_CODE_:Scramble:875104:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  window2 = GWindow.getWindow(this, "Window title", 0, 0, 360, 240, JAVA2D);
  window2.noLoop();
  window2.addDrawHandler(this, "win_draw2");
  front_prime = new GButton(window2, 88, 13, 80, 30);
  front_prime.setText("Front'");
  front_prime.addEventHandler(this, "front_prime_click");
  front = new GButton(window2, 8, 13, 80, 30);
  front.setText("Front");
  front.addEventHandler(this, "front_click");
  back_prime = new GButton(window2, 260, 13, 80, 30);
  back_prime.setText("Back'");
  back_prime.addEventHandler(this, "back_prime_click");
  back = new GButton(window2, 179, 13, 80, 30);
  back.setText("Back");
  back.addEventHandler(this, "back_click");
  Left_prime = new GButton(window2, 86, 57, 80, 30);
  Left_prime.setText("Left'");
  Left_prime.addEventHandler(this, "left_prime_click");
  left = new GButton(window2, 6, 57, 80, 30);
  left.setText("Left");
  left.addEventHandler(this, "left_click");
  right_prime = new GButton(window2, 259, 56, 80, 30);
  right_prime.setText("Right'");
  right_prime.addEventHandler(this, "right_prime_click");
  right = new GButton(window2, 178, 57, 80, 30);
  right.setText("Right");
  right.addEventHandler(this, "right_click");
  up_prime = new GButton(window2, 86, 101, 80, 30);
  up_prime.setText("Up'");
  up_prime.addEventHandler(this, "up_prime_click");
  up = new GButton(window2, 6, 101, 80, 30);
  up.setText("Up");
  up.addEventHandler(this, "up_click");
  down = new GButton(window2, 179, 101, 80, 30);
  down.setText("Down");
  down.addEventHandler(this, "down_click");
  down_prime = new GButton(window2, 260, 101, 80, 30);
  down_prime.setText("Down'");
  down_prime.addEventHandler(this, "down_prime_click");
  Solve = new GButton(window2, 86, 164, 80, 30);
  Solve.setText("Solve");
  Solve.setTextBold();
  Solve.addEventHandler(this, "solve_click");
  Scramble = new GButton(window2, 182, 165, 80, 30);
  Scramble.setText("Scramble!");
  Scramble.setTextBold();
  Scramble.addEventHandler(this, "scramble_click");
  window2.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window2;
GButton front_prime; 
GButton front; 
GButton back_prime; 
GButton back; 
GButton Left_prime; 
GButton left; 
GButton right_prime; 
GButton right; 
GButton up_prime; 
GButton up; 
GButton down; 
GButton down_prime; 
GButton Solve; 
GButton Scramble; 