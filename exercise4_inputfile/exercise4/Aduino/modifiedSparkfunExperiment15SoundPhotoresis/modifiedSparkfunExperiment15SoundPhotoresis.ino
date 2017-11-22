/*
Earl Mark, 4.6.17, Modified Example from SparkFun Inventor's Kit 
Example sketch 15

SOUND DETECTOR & PHOTORESISTER OUTPUT TO SERIAL PORT

Use the sound detector to measure the volume of the surrounding area 
Use photo sensor to detect light intensity of the surrounding area
Transmit values to Serial Port
*/
 //pin variables

const int soundPin = 1;

int photocellPin0 = 0;     // the cell and 10K pulldown are connected to a0
int photocellReading0;    
//variables for storing raw sound and scaled value
int sound;
int scale;

void setup()
{
 //start the serial port a@ 9600bps
 Serial.begin(9600);

}

void loop()
{
 //read and store the audio from Envelope pin
 sound = analogRead(soundPin);

 //print values over the serial port for debugging
 Serial.print("sound = ");
 Serial.println(sound);

 photocellReading0 = analogRead(photocellPin0); //read photoresister 
  Serial.print(" _ Analog reading 0 * ");       //output value to serial port
  Serial.println(photocellReading0);

}

