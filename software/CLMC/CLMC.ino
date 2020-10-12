/**
   File: CLMC.ino
   Author: Lukas Severinghaus
   Date: October 11, 2020
   Purpose: Control code for ATMega328p based PID motor controller.
   Completed as part of an honors enrichment contract for EGR101 at ASU.

   License:
   Copyright (C) 2020  Lukas Severinghaus

   This program is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License version 3
   as published by the Free Software Foundation;

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/
//Uncomment the #define for the channel that is currently being tuned
//This binds the p, i, and d commands to that channel.
//Also outputs absolute position if position mode is selected.
#define TUNE_POS
//#define TUNE_VEL
//#define TUNE_ACC

//Serial baud rate
#define BAUD_RATE 9600

//Pin that signalling LED is connected to
#define LED_PIN 13


void setup() {

  Serial.begin(BAUD_RATE);

  init_motor();
  init_encoders();
  init_pid();

  pinMode(LED_PIN, OUTPUT);
  for (int i = 0; i < 3; i++) {
    digitalWrite(LED_PIN, HIGH);
    delay(100);
    digitalWrite(LED_PIN, LOW);
    delay(100);
  }

}

//Flag for enabling motor output.
bool control = true;

void loop() {
  //Read from Serial, if bytes are available
  if (Serial.available() > 0) {
    char s = Serial.read();
    //Check if the character matches a command letter
    if (s == 'r') {
      constant_pos(Serial.parseInt());
    } else if (s == 'f') {
      constant_vel(Serial.parseInt());
    } else if (s == 'v') {
      constant_acc(Serial.parseFloat());
    } else if (s == 'e') {
      control = true;
    } else if (s == 'w') {
      control = false;
      command_motor(0);
    } else if (s == 'p') {
      tune_p(Serial.parseFloat());
    } else if (s == 'i') {
      tune_i(Serial.parseFloat());
    } else if (s == 'd') {
      tune_d(Serial.parseFloat());
    } else if (s == 't') {
#if defined (TUNE_POS) || defined (TUNE_VEL)
      command_tune(Serial.parseInt());
#else
#if defined (TUNE_ACC)
      command_tune(Serial.parseFloat());
#else
      Serial.println("No tuning mode currently set.");
#endif
#endif
    } else if (s == 'j') {
      set_inst_vel_filter(Serial.parseFloat());
    }
  }



  //Diagnostic output:
  //Measured outputs, position, velocity, and acceleration
  Serial.print("Inst_vel: ");
  Serial.print(get_inst_velocity());
  Serial.print("\tInst_acc: ");
  Serial.print(get_inst_acceleration());

#ifdef TUNE_POS
  Serial.print("\tAbs_pos: ");
  Serial.print(get_raw_count());
#endif
  //Setpoints
  Serial.print("\tPos_set: ");
  Serial.print(get_pos_setpoint());
  Serial.print("\tVel_set: ");
  Serial.print(get_vel_setpoint());
  Serial.print("\tAcc_set: ");
  Serial.print(get_acc_setpoint());
  Serial.print("\tOutput: ");
  Serial.print(get_pid_output());
  Serial.print("\tCurrent: ");
  Serial.print(get_current());
  Serial.println();

  update_pid();
  if (control) command_motor(get_pid_output());

}
