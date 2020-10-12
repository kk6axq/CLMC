/**
 * File: Instantaneous_Calculation.ino
 * Author: Lukas Severinghaus
 * Date: October 11, 2020
 * Purpose: Calculates instantaneous velocity and acceleration.
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
 * Sources referenced during development:
 * Filter: https://dsp.stackexchange.com/questions/41854/low-pass-filter-algorithm-origin
 */
//Period of time used for calculations, in milliseconds.
#define INST_PERIOD 20


float inst_accel = 0; //Change of velocity in ticks per second^2
float inst_vel = 0; //Velocity in ticks per second

//Variables for tracking previous values
long inst_last_count = 0;
long inst_last_time = 0;
float inst_last_vel = 0;

//Strengths for low pass filters
float inst_accel_filter = 0.1;
float inst_vel_filter = 0.08;

//Used for tuning, this sets the strength of the velocity filter.
//This can be used through Serial to help tune the system.
void set_inst_vel_filter(float v){
  inst_vel_filter = v;
}


float current_vel = 0;

void calculate_instantaneous() {
  long current_count = get_raw_count();
  long current_time = millis();
  if(millis() > inst_last_time + INST_PERIOD){  
  int delta_time = current_time - inst_last_time;
  int delta_count = current_count - inst_last_count;

  //Calculate velocity in ticks per second and filter it
  current_vel += inst_vel_filter * (( (float) delta_count / (float) delta_time * 1000.0) - current_vel);
  
  //Calculate change in velocity, which is a component of the acceleration calculation
  float delta_vel = current_vel - inst_last_vel;

  //Calculate acceleration in ticks per second^2
  inst_accel = delta_vel / delta_time * 1000.0;
  
  //Update velocity variable
  inst_vel = current_vel;
  
  //Update previous loop variables
  inst_last_count = current_count;
  inst_last_time = current_time;
  inst_last_vel = current_vel;
  }
}

//Gets instantaneous velocity
float get_inst_velocity(){
  return inst_vel;
}

//Gets instantaneous acceleration
float get_inst_acceleration(){
  return inst_accel;
}
