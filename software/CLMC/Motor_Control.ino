/**
 * File: Motor_Control.ino
 * Author: Lukas Severinghaus
 * Date: October 11, 2020
 * Purpose: Interfaces with VNH5019 motor controller.
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

//Uncomment this if the motor rotation is opposite to the reported encoder direction.
//Other ways to fix this are to swap the encoder inputs, or reverse the physical polarity of the motor.
//#define INVERT_MOTOR_OUTPUT

#define DIR_A 3 //Is 12 on shield
#define DIR_B 4
#define PWM_A 5
//On PCB these are the pins:
//DIRA: 3
//DIRB: 4
//PWM: 5 
#define SENSE_A A0

#define REVERSE LOW
#define FORWARD HIGH

void init_motor(){
  pinMode(DIR_A, OUTPUT);
  pinMode(DIR_B, OUTPUT);
  pinMode(PWM_A, OUTPUT);
  pinMode(SENSE_A, INPUT);
  digitalWrite(DIR_A, LOW);
  digitalWrite(DIR_B, LOW);
  analogWrite(PWM_A, 0);
}

float get_current(){
  //VNH5019 returns 140mv/A of current.
  return analogRead(SENSE_A) / 28.644; 
}



int dir;
int cmd_value;
/**
 * Sets the motor output from an input command value.
 * Input range is -255 to 255 inclusive, all values
 * outside of that will be constrained to this range.
 * Positive values are forward, negative are reverse.
 */
void command_motor(int val){
  //Constrain the input value to the proper range.
  cmd_value = max(-255, min(val, 255));
  //cmd_value = constrain(val, -255, 255);
  //Only added to compiled code if DEBUG compiler flag set
  #ifdef DEBUG
  //Serial.print("Received motor command: ");
  //Serial.println(val);

  //Checks if the input value was constrained.
  if(cmd_value != val){
    Serial.print("Commanded value out of range: ");
    Serial.print(val);
    Serial.print(", constrained to ");
    Serial.println(cmd_value);
  }
  #endif

  //Compute the motor direction.
  //If input is <0, motor should be reversed,
  //else forward.
  dir = FORWARD;  
  if(cmd_value < 0){
    cmd_value *= -1;
    dir = REVERSE;
  }
  
  //Invert the motor direction if flag set.
  #ifdef INVERT_MOTOR_OUTPUT
  dir = (dir == FORWARD) ? REVERSE : FORWARD;
  #endif

  //Set the direction pins.
  digitalWrite(DIR_A, dir);
  digitalWrite(DIR_B, !dir);
  //Set the PWM output value.
  analogWrite(PWM_A, cmd_value);
}
