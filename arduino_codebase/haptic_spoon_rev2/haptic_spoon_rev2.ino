#include <Wire.h>
#include "Adafruit_DRV2605.h"

Adafruit_DRV2605 drv;
int mode;
uint8_t beat_intensity, beat_0;
int beat_delay, beat_length;

void setup() {
  Serial.begin(9600);
  drv.begin();
  drv.useLRA();
  drv.setMode(DRV2605_MODE_REALTIME);

  mode = 0;
  beat_0 = 0x00;
  beat_length = 500;

}

void loop() {
 
  // Read serial buffer
  if(Serial.available() !=0) {
    mode = Serial.read() - '0';

    // set appropriate mode parameters
    setMode(mode);

    // play pattern
    playPattern(5);
  }
}

void playPattern(int numTimes)
{
  // Play specified number of beats
  for(int i = 0; i < numTimes; i++) {
    drv.setRealtimeValue(beat_intensity);
    delay(beat_length);
    drv.setRealtimeValue(beat_0);
    delay(beat_delay);
  }
  // Set beats to off
  drv.setRealtimeValue(beat_0);
}

void setMode(int mode) {
  switch(mode) {
    case 0:
      beat_intensity = 0x00;
      beat_delay     = 100;
    break;

    case 1:
      beat_intensity = 0x44;
      beat_delay     = 1500;
    break;

    case 2:
      beat_intensity = 0x44;
      beat_delay     = 1000;
    break;

    case 3:
      beat_intensity = 0x44;
      beat_delay     = 300;
    break;

    case 4:
      beat_intensity = 0x60;
      beat_delay     = 1500;
    break;

    case 5:
      beat_intensity = 0x60;
      beat_delay     = 1000;
    break;

    case 6:
      beat_intensity = 0x60;
      beat_delay     = 300;
    break;

    case 7:
      beat_intensity = 0x79;
      beat_delay     = 1500;
    break;

    case 8:
      beat_intensity = 0x79;
      beat_delay     = 1000;
    break;

    case 9:
      beat_intensity = 0x79;
      beat_delay     = 300;
    break;

    default:
      beat_intensity = 0x00;
      beat_delay     = 100;
    break;
  }
}
