/**
* @file main.h
* @brief Defines global variables and the main entry point.
*/

#ifndef main_h
#define main_h

#include "everything.h"

//SDL2.
SDL_Surface *surface;
SDL_Window *window;
SDL_Renderer *renderer;

//Textures.
SDL_Texture *spr_boss_a;
SDL_Texture *spr_boss_c;
SDL_Texture *spr_boss_m;
SDL_Texture *spr_boss_s;
SDL_Texture *spr_boss_t;

//Font.
SDL_Texture *font_ascii;
int font_ascii_w;
int font_ascii_h;


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

//Level.
int level_cur;

//Scaling.
int gw,gh;///< scaling variables.

//Level.
int lvl_off_obj;///< object-offset in level.dat
int level_cur;///< current level (out of 512 levels)
int level_prev;///< previous level.
char mapstr_location[16];

//Main loop.
int running;

//Splash screens.
int splashintro_bool;

//Other.
int discordant_cur;
int discordant_max;

#endif