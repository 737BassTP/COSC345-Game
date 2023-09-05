/**
* @file input.h
* @brief Defines inputs from the player.
*/

#ifndef input_h
#define input_h

#include "everything.h"

//Keyboard variables.
int glob_vk_right;
int glob_vk_left;
int glob_vk_up;
int glob_vk_down;
int glob_vk_space;
int glob_vk_enter;
int glob_vk_tab;
int glob_vk_f1;
int glob_vk_f2;
int glob_vk_f3;
int glob_vk_f4;
int glob_vk_f5;
int glob_vk_f6;
int glob_vk_f7;
int glob_vk_f8;
int glob_vk_f9;
int glob_vk_f10;
int glob_vk_f11;
int glob_vk_f12;
int glob_vk_0;
int glob_vk_1;
int glob_vk_2;
int glob_vk_3;
int glob_vk_4;
int glob_vk_5;
int glob_vk_6;
int glob_vk_7;
int glob_vk_8;
int glob_vk_9;
//int glob_vk_;
//int glob_vk_;

int keyboard_set_new(int *keyid,int keyval);
int keyboard_set_old(int *keyid);
int keyboard_reset(int keyid);
int keyboard_check(int key);
int keyboard_check_pressed(int key);
int keyboard_check_released(int key);
void keyboard_update_previous();
void keyboard_sdl_polls(SDL_Event event);

#endif