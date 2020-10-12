/**
 * File: Encoder_Processing.ino
 * Author: Lukas Severinghaus
 * Date: October 11, 2020
 * Purpose: Handles processing of quadrature encoder data.
 * 
 * License:
 * Copyright (C) 2020  Lukas Severinghaus
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License version 3
 * as published by the Free Software Foundation; 
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

/**
 * Encoder notes:
 * Channel A is connected to PCINT0, which is pin 8 on the Arduino Uno
 * Channel B is connected to PCINT1, which is pin 9 on the Arduino Uno
 * 
 * Sources used during development:
 * Interrupt reference: https://thewanderingengineer.com/2014/08/11/arduino-pin-change-interrupts/
 * Bitwise manipulation: https://stackoverflow.com/questions/47981/how-do-you-set-clear-and-toggle-a-single-bit
 * Arduino Ports: https://www.arduino.cc/en/Reference/PortManipulation  
 * Volatile type reference: https://www.arduino.cc/reference/en/language/variables/variable-scope-qualifiers/volatile/
 * Quadrature encoder reference: https://cdn.sparkfun.com/datasheets/Robotics/How to use a quadrature encoder.pdf
 */

#include <avr/interrupt.h>
#define CHANNEL_A 0b00000010 //Pin 8
#define CHANNEL_B 0b00000001 //Pin 9
#define INITIAL_ENC_STATE 0
#define INVALID 2 //Change of count when invalid state detected, likely an encoder jump from slow code.
#define TICKS_PER_ROTATION 1440.0 //Listed as 540.0, but there's three states

//Tick change counter
volatile long encoder_count = 0;

//Lookup table for state changes. 
//See the Sparkfun quadrature reference for more
//information on how this works.
const int8_t encoder_lookup[17] = {0, 1, -1, INVALID,
                                 -1, 0, INVALID, 1,
                                 1, INVALID, 0, -1,
                                 INVALID, -1, 1, 0};

//Initialize the encoder processing                                 
void init_encoders(){
  //Input pullup keeps the pins at a floating state until they are pulled high or low.
  pinMode(8, INPUT_PULLUP);
  pinMode(9, INPUT_PULLUP);

  //Port setting for interrupt setup
  PCICR |= 0b00000001; //Enable port B pin change interrupts
  PCMSK0 |= 0b00000011; //Enable interrupts for PCINT0 and PCINT1
}

//Number of error states encountered
volatile int error_count = 0;
//Stores current and previous encoder states
volatile byte state, p_state = INITIAL_ENC_STATE;


//Captures interrupts from activated pins in Port B.
//Uses a lookup table to get the change in position.
ISR(PCINT0_vect){
  state = PINB & (CHANNEL_A | CHANNEL_B); //Isolate just the two bits from the port input register.
  
  //Calculate the grid position, look it up, and add that value to the current count.
  //See the Sparkfun encoder reference for more info about the grid.
  encoder_count += encoder_lookup[(p_state * 4) + state]; 
  if(encoder_lookup[(p_state * 4) + state] == INVALID){
    error_count++;
  }
  //Save the state for next time.
  p_state = state;
}


//Returns the number of rotations, as a float. 
float get_rotations(){
  return (float) encoder_count / TICKS_PER_ROTATION;
}

//Get the raw encoder tick count.
long get_raw_count(){
  return encoder_count;
}

//Get the number of error conditions encountered.
int get_error_count(){
  return error_count;
}
