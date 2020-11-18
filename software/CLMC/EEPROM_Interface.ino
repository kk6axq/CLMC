/**
 * File: EEPROM_Interface.ino
 * Author: Lukas Severinghaus
 * Date: November 16, 2020
 * Purpose: Handles interfacing with onboard EEPROM.
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
  * Resources used during development:
  * Arduino EEPROM Library Reference:
  *   https://www.arduino.cc/en/Reference/EEPROMPut
  *   https://www.arduino.cc/en/Reference/EEPROMGet
  */
#include <EEPROM.h>
const int config_address = 0;
#define EEPROM_KEY 0x11 //ID used to verify the config. Changing this value forces a new config to be created.
struct CLMC_Config {
  byte id = EEPROM_KEY;//ID to identify this as a config.
  float pos_p;
  float pos_i;
  float pos_d;

  float vel_p;
  float vel_i;
  float vel_d;

  float acc_p;
  float acc_i;
  float acc_d;

  byte PID_state;//Currently activated mode for PID manager
  byte tune_mode;//Currently selected controller for tuning
  bool enable_output;
};

struct CLMC_Config get_config(){
  CLMC_Config out;
  out.pos_p = pos_p();
  out.pos_i = pos_i();
  out.pos_d = pos_d();

  out.vel_p = vel_p();
  out.vel_i = vel_i();
  out.vel_d = vel_d();

  out.acc_p = acc_p();
  out.acc_i = acc_i();
  out.acc_d = acc_d();

  out.PID_state = get_PID_current_state();
  out.tune_mode = get_tune_mode();//Not used right now.
  out.enable_output = get_control();
  return out;
}

void set_config(CLMC_Config c){
  if(c.id == EEPROM_KEY){
  pos_p(c.pos_p);
  pos_i(c.pos_i);
  pos_d(c.pos_d);

  vel_p(c.vel_p);
  vel_i(c.vel_i);
  vel_d(c.vel_d);

  acc_p(c.acc_p);
  acc_i(c.acc_i);
  acc_d(c.acc_d);

  set_tune_mode(c.tune_mode);
  set_PID_current_state(c.PID_state);
  set_control(c.enable_output);
  }else{
    Serial.println("No existing EEPROM config found with matching id.");
  }
}

void load_config(){
  CLMC_Config c;
  EEPROM.get(config_address, c);
  if(c.id == EEPROM_KEY){
  set_config(c); 
  }else{
    Serial.println("Error: EEPROM did not verify");
  }
}

void save_config(){
  CLMC_Config c = get_config();
  EEPROM.put(config_address, c);
}

void print_EEPROM(){
  CLMC_Config c;
  EEPROM.get(config_address, c);
  Serial.print("ID: "); Serial.println(c.id);
}
