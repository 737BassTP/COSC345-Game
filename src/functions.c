//Definitions.
#ifndef functions
#define functions 1

#define PI 3.1415926535897932

#include "functions.h"
#include "main.h"

#include <stdbool.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h> // for rand() and srand()
#include <time.h>   // for time()
#include <string.h>
#include <stdarg.h> //for variadic functions.
#include "../SDL2/include/SDL2/SDL.h"
#include "../SDL2/include/SDL2/SDL_image.h"
#include "../SDL2/include/SDL2/SDL_ttf.h"

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

//Colors (BGR because Big-Endianness).
const int c_black 	= 0x000000;
const int c_dkgray 	= 0x404040;
const int c_gray 	= 0x808080;
const int c_ltgray 	= 0xC0C0C0;
const int c_white 	= 0xFFFFFF;
const int c_red 	= 0x0000FF; 
const int c_orange 	= 0x0080FF;
const int c_yellow 	= 0x00FFFF;
const int c_lime 	= 0x00FF80;
const int c_green 	= 0x00FF00;
const int c_slime	= 0x80FF00;
const int c_aqua 	= 0xFFFF00;//turquoise
const int c_sky 	= 0xFF8000;
const int c_blue 	= 0xFF0000;
const int c_purple 	= 0xFF0080;
const int c_fuchsia = 0xFF00FF;
const int c_rose 	= 0x8000FF;
/*
const int c_ = 0x;
const int c_ = 0x;
const int c_ = 0x;
/**/

//Global variables.
int glob_draw_alpha = 255;
int glob_draw_color = c_white;
int glob_vk_right 	= 0;
int glob_vk_left 	= 0;
int glob_vk_up 		= 0;
int glob_vk_down 	= 0;
int glob_vk_space   = 0;
int glob_vk_enter   = 0;
int glob_vk_f2      = 0;
int glob_vk_0       = 0;
int glob_vk_1       = 0;
int glob_vk_2       = 0;
int glob_vk_3       = 0;
int glob_vk_4       = 0;
int glob_vk_5       = 0;
int glob_vk_6       = 0;
int glob_vk_7       = 0;
int glob_vk_8       = 0;
int glob_vk_9       = 0;

//Functions.
//Clear the surface by filling it with a colour.
void clear_screen(SDL_Surface *surface)
{
    if(SDL_FillRect(surface, NULL, 0xFF000040) < 0){
        fprintf(stderr, "Unable to clear the surface. Error returned: %s\n", SDL_GetError());
        SDL_Quit();
        exit(EXIT_FAILURE);
    }
}
int make_color_rgb(int r,int g,int b)
{
	return (r&0xFF)|((g&0xFF)<<8)|((b&0xFF)<<16);
}
double lerp(double from,double to,double percentage)
{
	//Lerp = Linear Interpolation.
	return from+(to-from)*percentage;
}
int make_color_hsv(int h,int s,int v)
{
	//source: https://stackoverflow.com/questions/3018313/algorithm-to-convert-rgb-to-hsv-and-hsv-to-rgb-in-range-0-255-for-both/14733008#14733008
	byte region, remainder, p, q, t;
    if (s == 0) {return make_color_rgb(v,v,v);}
    region = h / 43;
    remainder = (h - (region * 43)) * 6; 
    p = (v * (255 - s)) >> 8;
    q = (v * (255 - ((s * remainder) >> 8))) >> 8;
    t = (v * (255 - ((s * (255 - remainder)) >> 8))) >> 8;
	byte rr,gg,bb;//if buggy, change to int.
    switch (region)
    {
        case 0:
            rr = v; gg = t; bb = p;
            break;
        case 1:
            rr = q; gg = v; bb = p;
            break;
        case 2:
            rr = p; gg = v; bb = t;
            break;
        case 3:
            rr = p; gg = q; bb = v;
            break;
        case 4:
            rr = t; gg = p; bb = v;
            break;
        default:
            rr = v; gg = p; bb = q;
            break;
    }
    return make_color_rgb(rr,gg,bb);
}
int draw_get_alpha()
{
	return glob_draw_alpha;
}
int draw_get_color()
{
	return glob_draw_color;
}
void draw_set_color(SDL_Renderer* renderer,int bgr)
{
	glob_draw_color = bgr&0xFFFFFF;
	SDL_SetRenderDrawColor(renderer,bgr&0xFF,(bgr>>8)&0xFF,(bgr>>16)&0xFF,draw_get_alpha());
}
void draw_set_alpha(SDL_Renderer* renderer,int alpha)
{
	glob_draw_alpha = alpha&0xFF;
	int bgr = draw_get_color();
	SDL_SetRenderDrawColor(renderer,bgr&0xFF,(bgr>>8)&0xFF,(bgr>>16)&0xFF,alpha);
}
void draw_clear(SDL_Renderer* renderer,int bgr)
{
	draw_set_color(renderer,bgr);
	SDL_RenderClear(renderer);//fills whole with draw-color.	
}
void draw_clear_alpha(SDL_Renderer* renderer,int bgr,int alpha)
{
	draw_set_alpha(renderer,alpha);
	draw_clear(renderer,bgr);//invokes above function to avoid duplicate functionality.
}
void draw_rectangle(SDL_Renderer *renderer,int x1,int y1,int x2,int y2)
{
	//bug lookout: SDL_Rect is x,y,w,h, and draw_rectangle is x1,y1,x2,y2.
	SDL_Rect r;// = {.x=32,.y=64,.w=480,.h=480};
	r.x = x1;
	r.y = y1;
	r.w = x2-x1;//convert x2,y2 to w,h
	r.h = y2-y1;
	SDL_RenderFillRect(renderer,&r);
}
void draw_rectangle_color(SDL_Renderer *renderer,int x1,int y1,int x2,int y2,int bgr)
{
	int tmp=draw_get_color();
	draw_set_color(renderer,bgr);
	draw_rectangle(renderer,x1,y1,x2,y2);
	draw_set_color(renderer,tmp);
}
void draw_image(SDL_Renderer *renderer,int x1,int y1,int x2,int y2,SDL_Texture *texture)
{
	//draws the whole texture into a rectangle, stretch-to-fit.
	SDL_Rect r;// = {.x=32,.y=64,.w=480,.h=480};
	r.x = x1;
	r.y = y1;
	r.w = x2-x1;//convert x2,y2 to w,h
	r.h = y2-y1;
	int col=glob_draw_color;
	SDL_SetTextureColorMod(texture,col&0xFF,(col>>8)&0xFF,(col>>16)&0xFF);
	SDL_RenderCopy(renderer,texture,NULL,&r);//texture fill whole renderer.
}
void draw_image_part(SDL_Renderer *renderer,int x1,int y1,int x2,int y2,SDL_Texture *texture,int left,int top,int width,int height)
{
	SDL_Rect r;
	r.x = x1;
	r.y = y1;
	r.w = x2-x1;//convert x2,y2 to w,h
	r.h = y2-y1;
	SDL_Rect s;
	s.x = left;
	s.y = top;
	s.w = width;
	s.h = height;
	int col=glob_draw_color;
	SDL_SetTextureColorMod(texture,col&0xFF,(col>>8)&0xFF,(col>>16)&0xFF);
	SDL_RenderCopy(renderer,texture,&s,&r);
}
void draw_text(SDL_Renderer *renderer,int x,int y,int w,int h,SDL_Texture *font,char* str,int fontw,int fonth)
{
	//"#" = newline.
	//"##" = prints "#" with newline (unfinished: without newline).
	int len=strlen(str);
	int ch=0;
	int xo=0;
	int yo=0;
	int nl=((int)"#"[0])-32;//should I be proud or scared of myself?
	for (int i=0; i<len; i++)
	{
		ch = ((int)str[i])-32;
		if (ch == nl)
		{
			if (!(((int)str[i+1])-32 == nl))//next char is not nl.
			{
				xo = 0;
				yo += h;
				continue;
			}
		}
		draw_image_part(renderer,
			x+xo+0,y+yo,x+xo+w,y+yo+h,
			font,
			ch*fontw,0,fontw,fonth);
		xo += w;
	}
}
void draw_text_color(SDL_Renderer *renderer,int x,int y,int w,int h,SDL_Texture *font,char* str,int fontw,int fonth,int color)
{
	int dgc=draw_get_color();
	draw_set_color(renderer,color);
	draw_text(renderer,x,y,w,h,font,str,fontw,fonth);
	draw_set_color(renderer,dgc);
}
int keyboard_check(int key)
{
	return glob_vk_down;
}
int keyboard_check_pressed(int key)
{
	return glob_vk_down;
}
int keyboard_check_released(int key)
{
	return glob_vk_down;
}
int mux_int(int nth,...)
{
	//Multiplexer for ints.
	//Returns the nth argument.
	va_list args;
	va_start(args,nth);
	int ret = va_arg(args,int);
	for (int i=0; i<nth; i++)
	{
		ret = va_arg(args,int);
	}
	va_end(args);
	return ret;
}
char* mux_str(int nth,...)
{
	//Multiplexer for ints.
	//Returns the nth argument.
	va_list args;
	va_start(args,nth);
	char* ret = va_arg(args,int);
	for (int i=0; i<nth; i++)
	{
		ret = va_arg(args,char*);
	}
	va_end(args);
	return ret;
}
SDL_Texture* mux_sdltex(int nth,...)
{
	//Multiplexer for SDL_Texture pointers.
	//Returns the nth argument.
	va_list args;
	va_start(args,nth);
	int ret = va_arg(args,int);
	for (int i=0; i<nth; i++)
	{
		ret = va_arg(args,SDL_Texture*);
	}
	va_end(args);
	return ret;
}
int pos_int(int num,int val,...)
{
	//A demultiplexer variant for ints.
	//Returns the position a value appears in, or -1 if not.
	
	//untested.
	
	va_list args;
	va_start(args,val);
	int ret = va_arg(args,int);
	int i=0;
	int tmp;
	for (i=0; i<num; i++)
	{
		tmp = va_arg(args,int);
		if (val == tmp)
		{
			va_end(args);
			return i;
		}
	}
	va_end(args);
	return -1;
}
int BG(int val,int nth)
{
	return (val>>nth)&1;
}
int BGG(int val,int size,int nth)
{
	return (val>>(nth*size))&((1<<size)-1);
}
int sqr(int v)
{
	return v*v;
}
double degtorad(double deg)
{
	return (deg/180)*PI;
}
double radtodeg(double rad)
{
	return (rad/PI)*180;
}
double dcos(double deg)
{
	return cos(degtorad(deg));
}
double dsin(double deg)
{
	return sin(degtorad(deg));
}
Uint64 get_timer()
{
	return SDL_GetTicks64();
}
int point_in_rectangle(int px,int py,int rx1,int ry1,int rx2,int ry2)
{
	return ((px>=rx1 && px<rx2) && (py>=ry1 && py<ry2));
}
int rectangle_in_rectangle(int sx1,int sy1,int sx2,int sy2,int dx1,int dy1,int dx2,int dy2)
{
	//returns: 0=outside, 1=inside, 2=partially
	//ensure that *x2,*y2 are larger than *x1,*y1 for best results.
	int tmp=0;
	tmp += point_in_rectangle(sx1,sy1,dx1,dy1,dx2,dy2);
	tmp += point_in_rectangle(sx2,sy1,dx1,dy1,dx2,dy2);
	tmp += point_in_rectangle(sx1,sy2,dx1,dy1,dx2,dy2);
	tmp += point_in_rectangle(sx2,sy2,dx1,dy1,dx2,dy2);
	     if (tmp == 0) {return 0;}
	else if (tmp == 4) {return 1;}
	else {return 2;}
}
int string_pos(char *substr,char *str)
{
	//finds single-char substr in str.
	//todo: find multiple-char substr in str.
	//if not found, returns -1
	char *a = substr[0];
	char *b;// = str[0];
	int len=strlen(str);
	int ret=0;
	for (int i=0; i<len; i++)
	{
		b = str[i];
		if ((char)a == (char)b)
		//if (strcmp((const char*)&a,(const char*)&b)==0)
		{
			return i;
		}
	}
	return -1;
}
double darctan2(int y,int x)
{
	return radtodeg(atan2(y,x));
}
double cartodir(int x,int y)
{
	//return (darctan2(y,x)+360.0)%360.0;
	double ret = darctan2(y,x)+360.0;
	if (ret >= 360.0) {ret -= 360.0;}
	return ret;
}
void game_level_load(int lvl,int lvlmax)
{
	//done below.
}
void level_load(byte arr[],int siz,int count,int layers)
{
	FILE *fil = fopen("level.dat","rb");
	for (int i=0; i<siz*count*layers; i++)
	{
		arr[i] = 0;
	}
	fread(arr,siz*count*layers,1,fil);
	fclose(fil);
}
void dev_tiled_to_leveldata(byte arr[])
{
	//Extracts Tiles (done) and Objects (unfinished (unnecessary if tiles and objects share tileset)).
	printf("may take a while; please wait.\n");
	glob_vk_f2=0;//fakes a keyboard press event (fails if held).
	FILE *filin = fopen("tiled/cosc345-game.tmx","rb");
	FILE *filout = fopen("level.dat","wb");
	int layers=2;
	int layersize=131072;
	//layersize=512;//debug only
	int maxsize = layersize*layers;//131072
	byte array[262144];//tiles + objects.
	int arrsiz=sizeof(array);
	for (long i=0; i<maxsize; i++) {array[i] = 0;}
	//Discard input header.
	fseek(filin,(long int)0x23D-0,SEEK_SET);//hardcoded; may bug out in future, so avoid renaming or resizing in Tiled project file.
	//Read Tiles and Objects.
	byte comma=","[0];
	int ch=0;
	byte entry[3];
	word val;
	int counter=0;
	int off=0;
	int ij=0;
	//Extract and restructure.
	for (int i=0; i<arrsiz; i++)
	{
		ch=fgetc(filin);
		for (int j=0; j<3; j++) {entry[j]=48;}
		while ((ch==0xD) || (ch==0xA)) {ch=fgetc(filin);}
		entry[2]=ch;
		ch=fgetc(filin);
		if (ch!=comma)
		{
			entry[1]=entry[2];
			entry[2]=ch;
			ch=fgetc(filin);
			if (ch!=comma)
			{
				entry[0]=entry[1];
				entry[1]=entry[2];
				entry[2]=ch;
				fgetc(filin);//important.
			}
		}
		val^=val;
		for (int j=0; j<3; j++) {val+=(entry[j]-48)*(byte)pow((double)10,(double)(2-j));}
		printf("i=%i/%i (v=%i)\n",i,layersize,val);//comment out to speed up.
		val-=(val==0)?(-0xFF):(1)&0xFF;
		array[(((1<<(1<<1))<<1)<<((1|(1<<1)|(1<<(1<<1)))<<1))*(val>=(((1<<1)<<1)<<((1+1+1)<<1)))+(1<<(3<<(1<<1)))*(i>>(3<<(1<<1)))+(1<<(1<<3))*((i>>(1<<(1<<1)))&(3*(1<<(1<<1)|1)))+(1<<(1<<(1<<1)))*((i>>(1<<3))&(3*(1<<(1<<1)|1)))+(i&(3*(1<<(1<<1)|1)))]=val;//security through obscurity, or what? (it crashes the compiler...)
	}
	//Compress.
	val^=val;
	counter=0;
	for (int i=0; i<layersize; i++)
	{
		break;
	}
	//Write to file.
	fwrite(array,maxsize,1,filout);
	fclose(filin);
	fclose(filout);
	//Re-load in-game.
	level_load(arr,256,512,2);
}
char* level_get_name(int lvl,char* ret)
{
	//Translates e.g level 8/256 to "Warrington".
	FILE *fil;
	fil=fopen("location.dat","rb");
	fseek(fil,(long int)lvl,SEEK_SET);
	int tmp=(int)fgetc(fil);
	fseek(fil,(long int)256,SEEK_SET);
	fgets(ret,16,fil);
	while (tmp>0)
	{
		fgets(ret,16,fil);
		tmp--;
	}
	fclose(fil);
	return ret;
}

#endif