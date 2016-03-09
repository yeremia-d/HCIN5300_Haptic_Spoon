# HCIN5300_Haptic_Spoon
Haptic Spoon Project for HCIN5300 

# Arduino Dependancies
* Adafruit DRV2605 Library - https://github.com/adafruit/Adafruit_DRV2605_Library.git
* Arduino Serial
* Arduino Wire

# Processing Libraries
*Serial

# Directory structure
* haptic_spoon.ino - Arduino Program that runs the hardware
* Button.pde - Processing sketch containing UI button object
* haptic_spoon.pde - Main processing sketch that runs the UI

# Some things to note
* Having serial monitor open in arduino consumes the Serial port and you won't be able to run the IU
* Having the UI sketch running will prevent any other traffic over serial and you won't be able to upload any updates to your arduino program.
