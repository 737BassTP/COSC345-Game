/**
* @file main.h
* @brief Defines global variables and the main entry point.
*/

#ifndef main_h
#define main_h

#include "everything.h"

//Dimensions.
const int screen_w;///< screen width
const int screen_h;///< screen height

//Game area.
const int win_game_x;///<
const int win_game_y;///< 
const int win_game_w;///< 
const int win_game_h;///< 
const int win_game_x2;///< 
const int win_game_y2;///< 
const int win_game_tile_num;///< number of tiles in a level.
const int win_game_tile_dim;///< size of a tile in pixels per direction.

//Scaling.
int gw,gh;///< scaling variables.

//Level.
int lvl_off_obj;///< object-offset in level.dat
int level_cur;///< current level (out of 512 levels)
int level_prev;///< previous level.

//Main loop.
int running;



#endif