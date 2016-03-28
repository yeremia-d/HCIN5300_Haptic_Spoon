class Button {
  
  // Button parameters
  int x, y, buttonWidth, buttonHeight;
  
  // Button color
  color buttonColor;
  
  // Button text
  String buttonText;
  
  // Button Font
  PFont font;
  
  // Button hover state
  boolean hover;
  
  // Button constructor
  Button(int x, int y, String buttonText, PFont font) {
    this.x           = x;
    this.y           = y;
    this.buttonColor = color(255, 255, 255);
    this.buttonText  = buttonText;
    this.font        = font;
    buttonWidth      = 200;
    buttonHeight     = 75;
    hover            = false;
  }
  
  // Button draw function
  void drawButton(){
    // Set button stroke
    stroke(0);
    
    // set fill color
    if(hover) {fill(color(25, 163, 209)); }
    else { fill(buttonColor); }
    
    // draw rectangle
    rect(x, y, buttonWidth, buttonHeight);
    
    // set text fill
    if(hover) {fill(color(255));}
    else { fill(color(0)); }
    
    // set font
    textFont(font, 14);
    
    // draw text
    text(buttonText, x + 25, y + (buttonHeight/2));
  }
  
  // update button function
  void update() {
    
    // Check if mouse is hovering over button
    if(isOver()) hover = true;
    else hover = false;
  }
  
  // Checks if button is being hovered
  boolean isOver() {
    if (mouseX >= x && mouseX <= x + buttonWidth && mouseY >= y && mouseY <= y + buttonHeight) return true;
    else return false;
  }
}