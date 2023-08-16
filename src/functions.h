#ifndef functions_h
#define functions_h

#include "../SDL2/include/SDL2/SDL.h"
#include "../SDL2/include/SDL2/SDL_image.h"
#include "../SDL2/include/SDL2/SDL_ttf.h"

//Typedef'ing.
typedef unsigned char byte;//0-255, 0x00-0xFF
typedef unsigned short word;//0-65535, 0x0000-0xFFFF

extern int gw;
extern int gh;
extern int screen_w;
extern int screen_h;
extern int win_game_x;
extern int win_game_y;
extern int win_game_w;
extern int win_game_h;
extern int win_game_x2;
extern int win_game_y2;
extern SDL_Texture *splashintro_img1;
extern SDL_Texture *splashintro_img2;
extern SDL_Texture *splashintro_img3;
extern int font_ascii_w;
extern int font_ascii_h;
extern SDL_Texture *font_ascii;
extern char *splashintro_string;
extern int splashintro_slen2;
extern char *splashintro_string_copyright;
extern SDL_Surface *surface;
extern SDL_Renderer *renderer;
extern SDL_Texture *texture;

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
int glob_draw_alpha;
int glob_draw_color;
int glob_vk_right;
int glob_vk_left;
int glob_vk_up;
int glob_vk_down;
int glob_vk_space;
int glob_vk_enter;
int glob_vk_f2;
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

void clear_screen(SDL_Surface *surface);
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
void level_load(byte arr[],int siz,int count,int layers);
void dev_tiled_to_leveldata(byte arr[]);
char* level_get_name(int lvl,char* ret);

#endif