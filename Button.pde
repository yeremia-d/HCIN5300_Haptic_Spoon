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
  Button(int x, int y, color buttonColor, String buttonText, PFont font) {
    this.x           = x;
    this.y           = y;
    this.buttonColor = buttonColor;
    this.buttonText  = buttonText;
    this.font        = font;
    buttonWidth      = 300;
    buttonHeight     = 75;
    hover            = false;
  }
  
  // Button draw function
  void drawButton(){
    // Set button stroke
    stroke(0);
    
    // change stroke color if button state is hovered
    if(hover) stroke(255);
    
    // set fill color
    fill(buttonColor);
    
    // draw rectangle
    rect(x, y, buttonWidth, buttonHeight);
    
    // set text fill
    fill(255);
    
    // set font
    textFont(font, 24);
    
    // draw text
    text(buttonText, x + 20, y + (buttonHeight/2)+7);
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
