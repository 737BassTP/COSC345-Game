#include "functions.c"

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

void draw_splashscreen(void)
{
	int off=64*gw;
	draw_rectangle_color(renderer,0,0,screen_w,screen_h,0);
	draw_image(renderer,win_game_x-off,win_game_y,win_game_x2+off,win_game_y2,splashintro_img1);
	//Visual effect.
	int imax=16;
	int xo,yo,cc;
	int dgc=draw_get_color();
	int timer=(int)get_timer();
	int ttx,tty,ttc;
	ttx=timer/10%360;
	tty=90+75*dcos(timer/10%360);
	ttc=timer/10%256;
	for (int i=0; i<imax; i++)
	{
		xo=-imax*gw*dcos(ttx)+i*gw*dcos(ttx);
		yo=-imax*gh*dsin(tty)+i*gh*dsin(tty);
		//cc=(int)lerp(0.0,255.0,(double)((double)i/(double)(imax-1)));
		//draw_set_color(renderer,make_color_rgb(cc,cc,cc));
		draw_set_color(renderer,make_color_hsv(ttc,32,(int)lerp(0.0,255.0,(double)i/(double)(imax-1))));
		draw_image(renderer,
			win_game_x-off+xo,win_game_y+yo,
			win_game_x2+off+xo,win_game_y2+yo,
			splashintro_img2);
	}
	//Logo.
	draw_image(renderer,win_game_x-off,win_game_y,win_game_x2+off,win_game_y2,splashintro_img3);
	draw_set_color(renderer,dgc);
	//Press space to continue.
	int xx,yy;
	xx=384;
	yy=32;
	if (timer/60%8>=4)
	{
		draw_text_color(renderer,xx,yy,font_ascii_w*gw,font_ascii_h*gh,font_ascii,splashintro_string,font_ascii_w,font_ascii_h,c_yellow);
	}
	//Copyright.
	xx=64;
	yy=8;
	int yoff;
	char ch[2];
	imax=splashintro_slen2;
	for (int i=0; i<imax; i++)
	{
		yoff=8*gh*dcos((timer/10%360)+lerp(0.0,720.0,(double)i/(double)(imax-1)));
		ch[0]=splashintro_string_copyright[i];
		draw_text_color(renderer,xx+font_ascii_w*gw*i,win_game_y+win_game_h-yy+yoff-font_ascii_h*gh,font_ascii_w*gw,font_ascii_h*gh,font_ascii,ch,font_ascii_w,font_ascii_h,c_white);
	}
}