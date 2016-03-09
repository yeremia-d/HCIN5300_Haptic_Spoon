// Import Serial Library
import processing.serial.*;

// Serial Port Instance
Serial serialPort;

// UI Buttons
Button cold_1, cold_2, warm_1, warm_2, hot_1, hot_2, stop;

// Font
PFont font;

// Boolean indicator of when the hardware is ready
boolean hardwareReady;

// Initial Setup
void setup() {
  
  // Initialize window
  size(750, 750);
  
  // Initialize font
  font = createFont("Arial", 200, true);
  
  // Set Harware ready state to false
  hardwareReady = false;
  
  // Initialize buttons
  cold_1 = new Button(100, 25, color(0, 100, 120), "Cold 1", font);
  cold_2 = new Button(cold_1.x, (cold_1.y + cold_1.buttonHeight + 25), color(0, 150, 180)  , "Cold 2", font);
  warm_1 = new Button(cold_1.x, (cold_2.y + cold_2.buttonHeight + 25), color(242, 188, 70) , "Warm 1", font);
  warm_2 = new Button(cold_1.x, (warm_1.y + warm_1.buttonHeight + 25), color(214, 150, 14) , "Warm 2", font);
  hot_1  = new Button(cold_1.x, (warm_2.y + warm_2.buttonHeight + 25), color(200, 50, 1)   , "Hot 1" , font);
  hot_2  = new Button(cold_1.x, (hot_1.y + hot_1.buttonHeight + 25)  , color(255, 50, 1)   , "Hot 2" , font);
  stop   = new Button(cold_1.x, (hot_2.y + hot_2.buttonHeight + 25)  , color(157, 162, 163), "Stop"  , font);
  
  // Initialize Serial Port
  serialPort = new Serial(this, Serial.list()[1], 9600); 
}

// Draw execution loop
void draw() {
  
  // Redraw button
  background(0);
  
  //fill(color(255));
  //textFont(font, 24);
  //text("Hardware Status:", 500,50);
  
  //if(hardwareReady) {
  //  textFont(font, 50);
  //  fill(color(0, 155, 0));
  //  text("Ready", 300, 25);
  //}
  
  // Update button states
  cold_1.update();
  cold_2.update();
  warm_1.update();
  warm_2.update();
  hot_1.update();
  hot_2.update();
  stop.update();
  
  // Draw buttons
  cold_1.drawButton();
  cold_2.drawButton();
  warm_1.drawButton();
  warm_2.drawButton();
  hot_1.drawButton();
  hot_2.drawButton();
  stop.drawButton();
}

// Mouse pressed listener.
void mousePressed() {
  if(cold_1.isOver()) serialPort.write("5");
  if(cold_2.isOver()) serialPort.write("6");
  if(warm_1.isOver()) serialPort.write("3");
  if(warm_2.isOver()) serialPort.write("4");
  if(hot_1.isOver()) serialPort.write("1");
  if(hot_2.isOver()) serialPort.write("2");
  if(stop.isOver()) serialPort.write(0);
}

