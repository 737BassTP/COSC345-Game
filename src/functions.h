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

//Colors (BGR because Big-Endianness).
extern const int c_black;
extern const int c_dkgray;
extern const int c_gray;
extern const int c_ltgray;
extern const int c_white;
extern const int c_red;
extern const int c_orange;
extern const int c_yellow;
extern const int c_lime;
extern const int c_green;
extern const int c_slime;
extern const int c_aqua;
extern const int c_sky;
extern const int c_blue;
extern const int c_purple;
extern const int c_fuchsia;
extern const int c_rose;
//extern const int c_ = 0x;
//extern const int c_ = 0x;

//Global variables.
extern int glob_draw_alpha;
extern int glob_draw_color;
extern int glob_vk_right;
extern int glob_vk_left;
extern int glob_vk_up;
extern int glob_vk_down;
extern int glob_vk_space;
extern int glob_vk_enter;
extern int glob_vk_f2;
extern int glob_vk_0;
extern int glob_vk_1;
extern int glob_vk_2;
extern int glob_vk_3;
extern int glob_vk_4;
extern int glob_vk_5;
extern int glob_vk_6;
extern int glob_vk_7;
extern int glob_vk_8;
extern int glob_vk_9;
//extern int glob_vk_;
//extern int glob_vk_;

//Functions.
void clear_screen(SDL_Surface *surface);//Clear the surface by filling it with a colour.
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
int keyboard_check(int key);
int keyboard_check_pressed(int key);
int keyboard_check_released(int key);
int mux_int(int nth,...);
char* mux_str(int nth,...);
SDL_Texture* mux_sdltex(int nth,...);
int pos_int(int num,int val,...);
int BG(int val,int nth);
int BGG(int val,int size,int nth);
int sqr(int v);
double degtorad(double deg);
double radtodeg(double rad);
double dcos(double deg);
double dsin(double deg);
Uint64 get_timer();
int point_in_rectangle(int px,int py,int rx1,int ry1,int rx2,int ry2);
int rectangle_in_rectangle(int sx1,int sy1,int sx2,int sy2,int dx1,int dy1,int dx2,int dy2);
int string_pos(char *substr,char *str);
double darctan2(int y,int x);
double cartodir(int x,int y);
void game_level_load(int lvl,int lvlmax);
void level_load_objects(byte arr[],int level,int siz);
void level_load(byte arr[],int siz,int count,int layers);
void dev_tiled_to_leveldata(byte arr[]);
char* level_get_name(int lvl,char* ret);

float distance(float x1, float y1, float x2, float y2);//distance to player
int checkCollision(SDL_Rect rect1, SDL_Rect rect2);// Function to check for collision between two rectangles; returns true (non-zero) if the rectangles collide, false (0) otherwise









#endif