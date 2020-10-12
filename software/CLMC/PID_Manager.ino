/**
 * File: PID_Manager.ino
 * Author: Lukas Severinghaus
 * Date: October 11, 2020
 * Purpose: Interfaces with PID control library.
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

//Constant velocity error is change in position for right now + error from last period
#define CONSTANT_ACC 0
#define CONSTANT_VEL 1
#define CONSTANT_POS 2
#define RAW 3

#include <PIDController.h>

PIDController position_controller;
PIDController velocity_controller;
PIDController acceleration_controller;
int pid_freq = 50;
int pid_period = 1000 / pid_freq;
long last_pid_loop = 0;


float pos_kp = 2;
float pos_ki = 0.2;
float pos_kd = 0;


float vel_kp = 1;
float vel_ki = 0.4;
float vel_kd = 0.3;

float acc_kp = 0.8;
float acc_ki = 0.3;
float acc_kd = 0;

double pos_setpoint = 0;
double vel_setpoint = 0;
double acc_setpoint = 0;

int current_state = RAW;

void init_pid() {
  position_controller.begin();
  position_controller.setpoint(pos_setpoint);
  position_controller.tune(pos_kp, pos_ki, pos_kd);
  position_controller.limit(-255, 255);

  velocity_controller.begin();
  velocity_controller.setpoint(vel_setpoint);
  velocity_controller.tune(vel_kp, vel_ki, vel_kd);
  velocity_controller.limit(-255, 255);

  acceleration_controller.begin();
  acceleration_controller.setpoint(acc_setpoint);
  acceleration_controller.tune(acc_kp, acc_ki, acc_kd);
  acceleration_controller.limit(-255, 255);
}
void update_pid() {
  if (millis() > last_pid_loop + pid_period) {
    calculate_instantaneous();
    if (current_state == CONSTANT_ACC) {
      acceleration_controller.compute(get_inst_acceleration());
    } else if (current_state == CONSTANT_VEL) {
      velocity_controller.compute(get_inst_velocity());
    } else if (current_state == CONSTANT_POS) {
      position_controller.compute(get_raw_count());
    } else if (current_state == RAW) {
      //Do nothing.
    }
  }
}

int get_pid_output(){
  if(current_state == CONSTANT_ACC){
    return acceleration_controller.getOutput();
  }else if(current_state == CONSTANT_VEL){
    return velocity_controller.getOutput();
  }else if(current_state == CONSTANT_POS){
    return position_controller.getOutput();
  }else{
    return 0; //Fail safe, if in raw mode.
  }
}
void set_state(int st) {
  current_state = st;
}
void constant_pos(long setpoint) {
  set_state(CONSTANT_POS);
  pos_setpoint = setpoint;
  position_controller.setpoint(setpoint);
}

void constant_vel(float vel) {
  set_state(CONSTANT_VEL);
  vel_setpoint = vel;
  velocity_controller.setpoint(vel);
}

void constant_acc(float acc){
  set_state(CONSTANT_ACC);
  acc_setpoint = acc;
  acceleration_controller.setpoint(acc);
}

/**** Setpoint getters ****/
int get_pos_setpoint(){
  return pos_setpoint;
}

int get_vel_setpoint(){
  return vel_setpoint;
}

int get_acc_setpoint(){
  return acc_setpoint;
}
/**** Position PID modifiers ****/
void pos_p(float p){
  pos_kp = p;
  update_pos_tune();
}

void pos_i(float i){
  pos_ki = i;
  update_pos_tune();
}

void pos_d(float d){
  pos_kd = d;
  update_pos_tune();
}

void update_pos_tune(){
  position_controller.tune(pos_kp, pos_ki, pos_kd);
}
/**** Velocity PID modifiers ****/
void vel_p(float p){
  vel_kp = p;
  update_vel_tune();
}

void vel_i(float i){
  vel_ki = i;
  update_vel_tune();
}

void vel_d(float d){
  vel_kd = d;
  update_vel_tune();
}

void update_vel_tune(){
  velocity_controller.tune(vel_kp, vel_ki, vel_kd);
}
/**** Acceleration PID modifiers ****/
void acc_p(float p){
  acc_kp = p;
  update_acc_tune();
}

void acc_i(float i){
  acc_ki = i;
  update_acc_tune();
}

void acc_d(float d){
  acc_kd = d;
  update_acc_tune();
}

void update_acc_tune(){
  acceleration_controller.tune(acc_kp, acc_ki, acc_kd);
}

void tune_p(float p){
  #ifdef TUNE_POS
  pos_kp = p;
  update_pos_tune();
  #endif
  #ifdef TUNE_VEL
  vel_kp = p;
  update_vel_tune();
  #endif
  #ifdef TUNE_ACC
  acc_kp = p;
  update_acc_tune();
  #endif
}

void tune_i(float i){
  #ifdef TUNE_POS
  pos_ki = i;
  update_pos_tune();
  #endif
  #ifdef TUNE_VEL
  vel_ki = i;
  update_vel_tune();
  #endif
  #ifdef TUNE_ACC
  acc_ki = i;
  update_acc_tune();
  #endif
}

void tune_d(float d){
  #ifdef TUNE_POS
  pos_kd = d;
  update_pos_tune();
  #endif
  #ifdef TUNE_VEL
  vel_kd = d;
  update_vel_tune();
  #endif
  #ifdef TUNE_ACC
  acc_kd = d;
  update_acc_tune();
  #endif
}
//Sets the setpoint of the currently active tune.
#if defined (TUNE_POS) || defined (TUNE_VEL)
void command_tune(int val){
  #ifdef TUNE_POS
  constant_pos(val);
  #elif defined (TUNE_VEL)
  constant_vel(val);
  #endif
}
#else
void command_tune(float val){
  #ifdef TUNE_ACC
  constant_acc(val);
  #endif
}
#endif
