/**
* @file functions.h
* @brief Defines abstract functions not related to game-specific stuff.
*/

#ifndef functions_h
#define functions_h 1

//Typedef'ing.
typedef unsigned char byte;     //0-255   , 0x00                              -0xFF                               (  8-bit byte)      .
typedef unsigned short word;    //0-65535 , 0x0000                            -0xFFFF                             ( 16-bit word)      .
typedef unsigned int dword;     //0-  4.3B, 0x00000000                        -0xFFFFFFFF                         ( 32-bit doubleword).
typedef unsigned long qword;    //0- 18.4Q, 0x0000000000000000                -0xFFFFFFFFFFFFFFFF                 ( 64-bit quadword)  .
typedef unsigned __int128 oword;//0-340.2U, 0x00000000000000000000000000000000-0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF (128-bit octoword)  .
//256-bit sedecword, 512-bit duotrigintiword, 1024-bit quadsexagintiword, 2048-bit octoviginticentiword, 4096-bit sexquinquagintiducentiword, ...

#include "everything.h"

#include <stdbool.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h> // for rand() and srand()
#include <time.h>   // for time()
#include <string.h>
#include <stdarg.h> //for variadic functions.

//Definitions.
#define PI 3.1415926535897932
#define ALARM_ID_MAX 16

//Colors (BGR because Big-Endianness).
const int c_black;
const int c_dkgray;
const int c_gray;
const int c_ltgray;
const int c_white;
const int c_red;
const int c_orange;
const int c_yellow;
const int c_lime;
const int c_green;
const int c_slime;
const int c_aqua;
const int c_sky;
const int c_blue;
const int c_purple;
const int c_fuchsia;
const int c_rose;
//extern const int c_ = 0x;
//extern const int c_ = 0x;

//Global variables.
int glob_draw_alpha;
int glob_draw_color;
int glob_alarm_ids[ALARM_ID_MAX];

//Generic object.
struct gameobject
{
	int tileid;
	int x;
	int y;
	int bbox_L;
	int bbox_R;
	int bbox_T;
	int bbox_B;
	SDL_Texture *img;
};

//Functions.
int make_color_rgb(int r,int g,int b);
double lerp(double from,double to,double percentage);
int make_color_hsv(int h,int s,int v);
int draw_get_alpha();
int draw_get_color();
void draw_set_color(SDL_Renderer* renderer,int bgr);
void draw_set_alpha(SDL_Renderer* renderer,int alpha);
void draw_clear(SDL_Renderer* renderer,int bgr);
void draw_clear_alpha(SDL_Renderer* renderer,int bgr,int alpha);
void draw_rectangle(SDL_Renderer *renderer,int x1,int y1,int x2,int y2);
void draw_rectangle_color(SDL_Renderer *renderer,int x1,int y1,int x2,int y2,int bgr);
void draw_image(SDL_Renderer *renderer,int x1,int y1,int x2,int y2,SDL_Texture *texture);
void draw_image_part(SDL_Renderer *renderer,int x1,int y1,int x2,int y2,SDL_Texture *texture,int left,int top,int width,int height);
void draw_text(SDL_Renderer *renderer,int x,int y,int w,int h,SDL_Texture *font,char* str,int fontw,int fonth);
void draw_text_color(SDL_Renderer *renderer,int x,int y,int w,int h,SDL_Texture *font,char* str,int fontw,int fonth,int color);
long int file_get_size(FILE* fil);
int mux_int(int nth,...);
char* mux_str(int nth,...);
SDL_Texture* mux_sdltex(int nth,...);
int pos_int(int num,int val,...);
int BG(int val,int nth);
int BGG(int val,int size,int nth);
int BS(int val,int nth,int new);
int BT(int val,int nth);
int sqr(int v);
int mean_int(int num,...);
int min_int(int num,...);
int max_int(int num,...);
double degtorad(double deg);
double radtodeg(double rad);
double dcos(double deg);
double dsin(double deg);
Uint64 get_timer();
void alarm_set(int aid,int val);
int alarm_get(int aid);
void alarm_update();
int alarm_trigger(int aid);
int point_in_rectangle(int px,int py,int rx1,int ry1,int rx2,int ry2);
int rectangle_in_rectangle(int sx1,int sy1,int sx2,int sy2,int dx1,int dy1,int dx2,int dy2);
int string_pos(char *substr,char *str);
double darctan2(int y,int x);
double cartodir(int x,int y);
void game_level_load(int lvl,int lvlmax);
void level_load_any(byte arr[],struct gameobject Objects[],int level,int siz);
void level_load_objects(byte arr[],struct gameobject Objects[],int level,int siz);
void level_load_file(byte arr[],int siz,int count,int layers);
int level_load_door(int pos,int level);
char* level_get_name(int lvl,char* ret);
int brl(int v,int a,int b);

float distance(float x1, float y1, float x2, float y2);//distance to player
int checkCollision(SDL_Rect rect1, SDL_Rect rect2);// Function to check for collision between two rectangles; returns true (non-zero) if the rectangles collide, false (0) otherwise









#endif