// Include Wire Library
#include <Wire.h>

// Include Adafruit haptic driver library
#include <Adafruit_DRV2605.h>

// Instance of Haptic Driver
Adafruit_DRV2605 haptic_driver;

// Haptic Spoon State
int spoon_state;

// Settings
int inter_pattern_delay = 1000;

void setup() {
  // Initiate Serial Connection
  Serial.begin(9600);
  
  // Send state "Serial Connection Established"
  Serial.println('1'); 

  // Initiate Haptic Driver
  haptic_driver.begin();
  haptic_driver.useLRA();
  // Set Haptic Driver to Realtime mode
  haptic_driver.setMode(DRV2605_MODE_INTTRIG);

  // Send State "Haptic Driver Ready"
  Serial.println('2');

  // Initialize Spoon State
  spoon_state = 0;

}


void loop() {

  // If there is data in the serial buffer, read and match
  if(Serial.available() != 0) {

    // Read-in and set Spoon State
    spoon_state = Serial.read() - '0'; 
  }
  Serial.println(spoon_state);
  
  // Select Pattern based on spoon state
  switch(spoon_state) {
    case 1: // Hot Pattern 1
    haptic_driver.setWaveform(0, 84);
    haptic_driver.setWaveform(1, 58);
    haptic_driver.setWaveform(2, 95);
    inter_pattern_delay = 10;
    break;

    case 2: // Hot Pattern 2
    haptic_driver.setWaveform(0, 2);
    break;

    case 3: // Warm Pattern 1
    haptic_driver.setWaveform(0, 11);
    inter_pattern_delay = 4000;
    break;

    case 4: // Warm Pattern 2
    haptic_driver.setWaveform(0, 40);
    inter_pattern_delay = 4000;
    break;

    case 5: // Cold Pattern 1
    haptic_driver.setWaveform(0, 56);
    haptic_driver.setWaveform(1, 27);
    haptic_driver.setWaveform(2, 56);
    haptic_driver.setWaveform(3, 27);
    inter_pattern_delay = 0;
    break;

    case 6: // Cold Pattern 2
    haptic_driver.setWaveform(0, 6);
    break;

    // Default spoon state
    default: haptic_driver.setWaveform(0, 0);
    break;
  }
  
  haptic_driver.go();
  delay(inter_pattern_delay);
  

}
