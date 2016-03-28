// Import Serial Library
import processing.serial.*;

// Serial Port Instance
Serial serialPort;

//Intensity                        FREQUENCY
//                        LOW        MEDIUM          HIGH
// LOW                    FLIL        FMIL           FHIL
// 
// MEDIUM                 FLIM        FMIM           FHIM 
//
// HIGH                   FLIH        FMIH           FHIH


// UI Buttons [frequency, intensity FLIL, FM]
Button b_flil, b_fmil, b_fhil,
       b_flim, b_fmim, b_fhim,
       b_flih, b_fmih, b_fhih,
       b_stop;

int button_grp_x = 75;
int button_grp_y = 100;

// Font
PFont font;

// Boolean indicator of when the hardware is ready
boolean hardwareReady;

// Initial Setup
void setup() {
  
  // Initialize window
  size(750, 500);
  
  // Initialize font
  font = createFont("Arial", 200, true);
  
  // Set Harware ready state to false
  hardwareReady = false;
  
  
  // Initialize buttons
  b_flil = new Button(button_grp_x, button_grp_y, "Low Freq, Low Intensity \n                 (1)", font);
  b_fmil = new Button(button_grp_x + 210, button_grp_y, "Med Freq, Low Intensity \n                 (2)", font);
  b_fhil = new Button(button_grp_x + 420, button_grp_y, "High Freq, Low Intensity \n                 (3)", font);
  
  b_flim = new Button(button_grp_x, button_grp_y + 85, "Low Freq, Med Intensity \n                 (4)", font);
  b_fmim = new Button(button_grp_x + 210, button_grp_y + 85, "Med Freq, Med Intensity \n                 (5)", font);
  b_fhim = new Button(button_grp_x + 420, button_grp_y + 85, "High Freq, Med Intensity \n                 (6)", font);
  
  b_flih = new Button(button_grp_x, button_grp_y + 170, "Low Freq, High Intensity \n                 (7)", font);
  b_fmih = new Button(button_grp_x + 210, button_grp_y + 170, "Med Freq, High Intensity \n                 (8)", font);
  b_fhih = new Button(button_grp_x + 420, button_grp_y + 170, "High Freq, High Intensity \n                 (9)", font);
  
  b_stop = new Button(button_grp_x + 210, button_grp_y + 255, "Stop", font);
  
  // Initialize Serial Port
  serialPort = new Serial(this, Serial.list()[1], 9600); 
}

// Draw execution loop
void draw() {
  
  // Redraw button
  background(0);
  
  // Update button states
  b_flil.update();
  b_fmil.update();
  b_fhil.update();
  
  b_flim.update();
  b_fmim.update();
  b_fhim.update();
  
  b_flih.update();
  b_fmih.update();
  b_fhih.update();
  
  b_stop.update();
  
  // Draw buttons
  b_flil.drawButton();
  b_fmil.drawButton();
  b_fhil.drawButton();
  
  b_flim.drawButton();
  b_fmim.drawButton();
  b_fhim.drawButton();
  
  b_flih.drawButton();
  b_fmih.drawButton();
  b_fhih.drawButton();
  
  b_stop.drawButton();

}

// Mouse pressed listener.
void mousePressed() {
  if(b_flil.isOver()) serialPort.write("1");
  if(b_fmil.isOver()) serialPort.write("2");
  if(b_fhil.isOver()) serialPort.write("3");
  
  if(b_flim.isOver()) serialPort.write("4");
  if(b_fmim.isOver()) serialPort.write("5");
  if(b_fhim.isOver()) serialPort.write("6");
  
  if(b_flih.isOver()) serialPort.write("7");
  if(b_fmih.isOver()) serialPort.write("8");
  if(b_fhih.isOver()) serialPort.write("9");
  
  if(b_stop.isOver()) serialPort.write("0");
}