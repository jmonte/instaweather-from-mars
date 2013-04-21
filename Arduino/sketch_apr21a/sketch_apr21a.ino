/*

  RGB_LED_Color_Fade_Cycle.pde
  
  Cycles through the colors of a  LED depending upon the pressures that we get from the 

  Written for NASA Space Apps Challenge - Singapore. Challenge Wish i were here, 
  to adopt temp data from Mars and creat an iPhone App, HTML5 processing.js api which can simulate the data onto the USB port which 
  inturn is read by audrino.  

*/

// LED leads connected to PWM pins
const int RED_LED_PIN = 9;
const int GREEN_LED_PIN = 10;
const int BLUE_LED_PIN = 11;

// Used to store the current intensity level of the individual LEDs
int redIntensity = 0;
int greenIntensity = 0;
int blueIntensity = 0;

// Length of time we spend showing each color
const int DISPLAY_TIME = 100; // In milliseconds


void setup() {
  // No setup required.
  //Serial.begin(9600);
  
}

void loop() {
  
 // if ( Serial.available() > 0) 
  // {
  //int input = Serial.read(); // Read the input from the COM5 USB port thats passed from the gui. 
  
 //Serial.println(input);
  // If the pressure is above 800 ppm then, Cycle color from red through to green
  // (In this loop we move from 100% red, 0% green to 0% red, 100% green)
      //if (input == 49 ) {
          Serial.println("Inside the less than 800  loop");
        for (greenIntensity = 0; greenIntensity <= 255; greenIntensity+=5) {
            redIntensity = 255-greenIntensity;
            analogWrite(GREEN_LED_PIN, greenIntensity);
            analogWrite(RED_LED_PIN, redIntensity);
            delay(DISPLAY_TIME);
       }
      //}
      
      // If the pressure is within the range of 800 - 1000 ppm, then cycle color from green through to blue
      // (In this loop we move from 100% green, 0% blue to 0% green, 100% blue)  
     //if (input ==50 ) {
       //  Serial.println("Inside the 800 - 1000 loop");
      for (blueIntensity = 0; blueIntensity <= 255; blueIntensity+=5) {
            greenIntensity = 255-blueIntensity;
            analogWrite(BLUE_LED_PIN, blueIntensity);
            analogWrite(GREEN_LED_PIN, greenIntensity);
            delay(DISPLAY_TIME);
       }
     //}
     
      // If the pressure is within the range of 800 - 1000 ppm, cycle from blue through to red
      // (In this loop we move from 100% blue, 0% red to 0% blue, 100% red) 
      //if (input == 51 ) {  
       // Serial.println("Inside the 1000 loop");
        // redIntensity = 100;
      for (redIntensity = 0; redIntensity <= 255; redIntensity+=5) {
            blueIntensity = 255-redIntensity;
            analogWrite(RED_LED_PIN, redIntensity);
            analogWrite(BLUE_LED_PIN, blueIntensity);
            delay(DISPLAY_TIME);
       }
      //}
  
 //}  
}


