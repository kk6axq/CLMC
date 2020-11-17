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
//Uncomment to load config and PIDs from EEPROM on boot.
//#define LOAD_CONFIG_ON_BOOT

//Serial baud rate
#define BAUD_RATE 9600

//Pin that signalling LED is connected to
#define LED_PIN 13



#define TUNE_NONE 0
#define TUNE_POS 1
#define TUNE_VEL 2
#define TUNE_ACC 3
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
  #ifdef LOAD_CONFIG_ON_BOOT
  load_config();
  #endif
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
    } else if (s == 's') {
      if (get_tune_mode() == TUNE_POS || get_tune_mode() == TUNE_VEL) {
        command_tune(Serial.parseInt());
      } else if (get_tune_mode() == TUNE_ACC) {
        command_tune(Serial.parseFloat());
      } else {
        Serial.println("No tuning mode currently set.");
      }
    } else if (s == 't') { //Set controller to tune.
      if (s == 'p') {
        Serial.println("Selecting position controller");
        set_tune_mode(TUNE_POS);
      } else if (s == 'v') {
        Serial.println("Selecting velocity controller");
        set_tune_mode(TUNE_VEL);
      } else if (s == 'a') {
        Serial.println("Selecting acceleration controller");
        set_tune_mode(TUNE_ACC);
      } else {
        Serial.println("Deselecting tuned controller");
        set_tune_mode(TUNE_NONE);
      }
    } else if (s == 'j') {
      set_inst_vel_filter(Serial.parseFloat());
    } else if (s == 'l'){
      Serial.println("Loading config from EEPROM");
      load_config();
    } else if (s == 's'){
      Serial.println("Saving config to EEPROM");
      save_config();
    } else if (s == 'h') {
      Serial.println("**** Commands ****");
      Serial.println("r<int>\tConstant Position");
      Serial.println("f<int>\tConstant Velocity");
      Serial.println("v<float>\tConstant Acceleration");
      Serial.println("e\tEnable Output");
      Serial.println("w<int>\tDisable Output");
      Serial.println("t[p,v,a]\tSelect controller to tune");
      Serial.println("p<float>\tSet P component of tuned controller");
      Serial.println("i<float>\tSet I component of tuned controller");
      Serial.println("d<float>\tSet D component of tuned controller");
      Serial.println("j<float>\tSet strength of velocity particle filter");
      Serial.println("s\tSave configuration to EEPROM");
      Serial.println("l\tLoad configuration from EEPROM");
      Serial.println("h\tShow help menu");
    }
  }



  //Diagnostic output:
  //Measured outputs, position, velocity, and acceleration
  Serial.print("Inst_vel: ");
  Serial.print(get_inst_velocity());
  Serial.print("\tInst_acc: ");
  Serial.print(get_inst_acceleration());

  if(get_tune_mode() == TUNE_POS){
  Serial.print("\tAbs_pos: ");
  Serial.print(get_raw_count());
  }
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

bool get_control(){
  return control;
}

void set_control(bool val){
  control = val;
}
