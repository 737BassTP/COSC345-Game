/*
COSC345 - Game

Authors: (sorted alphabetically)
	Matthew Yi
	Nicholas Campbell
	Sven Russell
	Thomas Pedersen

SDL2 Documentation:
https://wiki.libsdl.org/SDL2/APIByCategory

*/

//Includes.
#include <stdio.h>
#include <math.h>
//#include <.h>
//#include "SDL2.dll"
#include "SDL2/include/SDL2/SDL.h"
#include "SDL2/include/SDL2/SDL_image.h"

//Definitions.
#define PI 3.1415926535897932

//Typedef'ing.
typedef unsigned char byte;//0-255, 0x00-0xFF

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
int glob_draw_colour = c_white;
int glob_vk_right 	= 0;
int glob_vk_left 	= 0;
int glob_vk_up 		= 0;
int glob_vk_down 	= 0;
int glob_vk_space   = 0;
int glob_vk_enter   = 0;

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
int draw_get_alpha()
{
	return glob_draw_alpha;
}
int draw_get_colour()
{
	return glob_draw_colour;
}
void draw_set_color(SDL_Renderer* renderer,int bgr)
{
	glob_draw_colour = bgr&0xFFFFFF;
	SDL_SetRenderDrawColor(renderer,bgr&0xFF,(bgr>>8)&0xFF,(bgr>>16)&0xFF,draw_get_alpha());
}
int draw_get_color(renderer)
{
	return glob_draw_colour;
}
void draw_set_alpha(SDL_Renderer* renderer,int alpha)
{
	glob_draw_alpha = alpha&0xFF;
	int bgr = draw_get_colour();
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
	SDL_RenderCopy(renderer,texture,&s,&r);
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
long get_timer()
{
	return SDL_GetTicks();
}

//Structs.
struct player
{
	int x;
	int y;
	byte facedir;
	byte anim_spd_cur;//counter.
	byte anim_spd_spd;//inc counter by spd per frame.
	byte anim_spd_wrap;//inc sprite frame when counter exceeds this value.
	byte anim_cur;//current sprite frame.
	byte anim_max;//max sprite frame before rollover.
	byte move_spd;//moving speed of player.
};

//Entry point.
int SDL_main(int argc, char *argv[])
{
	//Error priting.
	const size_t bufsize = 0x100;
	char errmsg[bufsize];
    
	//Window size.
	//Dimensions.
	const int screen_w = 1366;
    const int screen_h = 768;
	//Game area.
	const int win_game_x = (screen_w-screen_h)/2;//(1366-768)/2=299
	const int win_game_y = 0;
	const int win_game_w = screen_h;
	const int win_game_h = screen_h;//both are "h" to make it quadratic.
	const int win_game_x2 = win_game_x+win_game_w;
	const int win_game_y2 = win_game_y+win_game_h;
	
	const int win_game_tile_num = 16;//16 "tiles" per screen axis.
	const int win_game_tile_dim = 16;//each tile is 16 "pixels" along each axis.
	
	int gw,gh;//scaling.
	gw = screen_h/sqr(win_game_tile_num);// == 3, an int (for res. 1366/768 and 16x 16*16 px tiles per axis).
	gh = gw;
		
	SDL_Surface* surface;
    SDL_Window* window;
    SDL_Renderer* renderer;
    SDL_Event event;
	
	//void SDL_SetMainReady(void);
	//int flags = SDL_INIT_VIDEO|SDL_INIT_AUDIO;
	int flags = SDL_INIT_EVERYTHING;
	if (SDL_Init(flags) != 0)
	{
		printf("SDL init error:%s\n",SDL_GetError());
		return -1;
	}
	
	//Create window.
	window = SDL_CreateWindow("COSC345 - Game",SDL_WINDOWPOS_UNDEFINED,SDL_WINDOWPOS_UNDEFINED,screen_w,screen_h,0);
	if (!window)
	{
		snprintf(errmsg, bufsize, "Window error");
		goto error;
	}
	//Create renderer.
    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_PRESENTVSYNC);
    if (!renderer)
    {
        snprintf(errmsg, bufsize, "Render error");
        goto error;
    }
    //Create the surface in RAM that we manipulate the pixels of.
    surface = SDL_GetWindowSurface(window);
    if (!surface) {
        snprintf(errmsg, bufsize, "Surface error");
        goto error;
    }
	
	//Images.
	IMG_Init(IMG_INIT_PNG);
	//SDL_Texture *spr_grass = IMG_LoadTexture(renderer,"image-test.png");
	SDL_Texture *spr_grass = IMG_LoadTexture(renderer,"img/spr_grass.png");
	SDL_Texture *spr_sand  = IMG_LoadTexture(renderer,"img/spr_sand.png");
	SDL_Texture *spr_water = IMG_LoadTexture(renderer,"img/spr_water.png");
	SDL_Texture *spr_lava  = IMG_LoadTexture(renderer,"img/spr_lava.png");
	//Player.
	SDL_Texture *sprstrip_player = IMG_LoadTexture(renderer,"img/player_strip8.png");
	
	//Game Level.
	int level_size = sqr(win_game_tile_num);//16=256
	byte level_data[256];//static; can not be free'd.
	FILE *fil = fopen("level.dat","rb");
	for (int i=0; i<level_size; i++)
	{
		level_data[i] = 0;
	}
	fread(level_data,sizeof(level_data),1,fil);
	fclose(fil);
	
	//Player.
	struct player Player;
	Player.x = win_game_x + 8*gw*win_game_tile_dim;
	Player.y = win_game_y + 8*gh*win_game_tile_dim;
	Player.facedir = 0;
	Player.anim_spd_cur = 0;//counter.
	Player.anim_spd_spd = 1;//inc counter by spd per frame.
	Player.anim_spd_wrap = 12;//inc sprite frame when counter exceeds this value.
	Player.anim_cur = 0;//current sprite frame.
	Player.anim_max = 2;//max sprite frame before rollover.
	Player.move_spd = 3;
	
	//Music.
	/*
	SDL_AudioSpec *audio_spec;
	SDL_AudioDeviceID *audio_dev;		
	audio_spec.freq=44100;
	audio_spec.format=AUDIO_S16;
	audio_spec.channels=2;
	audio_spec.samples=4096;
	audio_dev = SDL_OpenAudioDevice(NULL,0,&audio_spec,&audio_spec,SDL_AUDIO_ALLOW_FORMAT_CHANGE);
	audio_buf = 0;
	audio_len = 0;
	SDL_LoadWAV("music.wav",&audio_spec,&audio_buf,&audio_len);
	/**/
	
	//Splash intro screen.
	int splashintro_bool=1;
	SDL_Texture *splashintro_img  = IMG_LoadTexture(renderer,"img/img_lands.png");
	
	
	//Mainloop here.
	int running=1;
	printf("Entering main loop...\n");
	while (running)
	{
		//Organize SDL Polls.
        while (SDL_PollEvent(&event))
        {
            switch (event.type)
            {
                case SDL_QUIT:
                {
					//close using red cross or ALT+F4.
                    running = 0;
                    break;
                }
				case SDL_KEYDOWN:
				{
					//key held down or pressed
					int v=1;
					switch (event.key.keysym.sym)
					{
						case SDLK_ESCAPE:{running=0;} break;//escape quits game.
						case SDLK_RIGHT: {glob_vk_right	=v;} break;
						case SDLK_LEFT:  {glob_vk_left	=v;} break;
						case SDLK_UP:    {glob_vk_up	=v;} break;
						case SDLK_DOWN:  {glob_vk_down	=v;} break;
						case SDLK_SPACE: {glob_vk_space	=v;} break;
						case SDLK_KP_ENTER: {glob_vk_enter	=v;} break;//seems broken.
						//case SDLK_:  {glob_vk_	=v;} break;
						
					}
					break;
				}
				case SDL_KEYUP:
				{
					//key released
					int v=0;
					switch (event.key.keysym.sym)
					{
						case SDLK_RIGHT: {glob_vk_right	=v;} break;
						case SDLK_LEFT:  {glob_vk_left	=v;} break;
						case SDLK_UP:    {glob_vk_up	=v;} break;
						case SDLK_DOWN:  {glob_vk_down	=v;} break;
						case SDLK_SPACE: {glob_vk_space	=v;} break;
						case SDLK_KP_ENTER: {glob_vk_enter	=v;} break;
						//case SDLK_:  {glob_vk_	=v;} break;
						
					}
					break;
				}
				
            }
        }
		
		/*
		Process inputs.
		*/
		//Player movement.
		if (glob_vk_right)
		{
			Player.facedir=0;
			Player.x += Player.move_spd;
		}
		if (glob_vk_up)
		{
			Player.facedir=1;
			Player.y -= Player.move_spd;
		}
		if (glob_vk_left)
		{
			Player.facedir=2;
			Player.x -= Player.move_spd;
		}
		if (glob_vk_down)
		{
			Player.facedir=3;
			Player.y += Player.move_spd;
		}
		if (glob_vk_right|glob_vk_left|glob_vk_up|glob_vk_down)
		{
			//Animation.
			Player.anim_spd_cur += Player.anim_spd_spd;
			Player.anim_cur += (Player.anim_spd_cur >= Player.anim_spd_wrap);
			Player.anim_spd_cur %= Player.anim_spd_wrap;
			Player.anim_cur %= Player.anim_max;
			//Position wrapping.
			if (Player.x > win_game_x2-win_game_tile_dim*gw) {Player.x = win_game_x;}
			if (Player.y > win_game_y2-win_game_tile_dim*gh) {Player.y = win_game_y;}
			if (Player.x < win_game_x) {Player.x = win_game_x2-win_game_tile_dim*gw;}
			if (Player.y < win_game_y) {Player.y = win_game_y2-win_game_tile_dim*gh;}
			
		}
		else
		{
			Player.anim_spd_cur = 0;
			Player.anim_cur = 0;
		}
		if (glob_vk_space|glob_vk_enter)
		{
			splashintro_bool=0;
		}
		
		/*
		Draw to the screen.
		*/
		//Drawing settings.
		draw_clear(renderer,c_black);
		draw_set_color(renderer,c_white);
		
		//UI areas.
		draw_rectangle_color(renderer,//left
			0,0,
			win_game_x,screen_h,
			c_orange);
		draw_rectangle_color(renderer,//middle
			win_game_x,0,
			screen_w-win_game_x,screen_h,
			c_rose);
		draw_rectangle_color(renderer,//right
			screen_w-win_game_x,0,
			screen_w,screen_h,
			c_orange);
		
		//SDL_RenderCopy(renderer,png,NULL,NULL);//test: texture fills whole renderer.
		
		//Game area.
		for (int j=0; j<win_game_tile_num; j++)
		{
			for (int i=0; i<win_game_tile_num; i++)
			{
				int ij = i+j*win_game_tile_num;
				int x1,y1,x2,y2;
				x1 = win_game_x + (i+0)*gw*win_game_tile_dim;
				y1 = win_game_y + (j+0)*gh*win_game_tile_dim;
				x2 = win_game_x + (i+1)*gw*win_game_tile_dim;
				y2 = win_game_y + (j+1)*gh*win_game_tile_dim;
				
				int col = mux_int(ij%3,c_red,c_green,c_blue);
				draw_rectangle_color(renderer,x1,y1,x2,y2,col);//will show if image drawing below fails.
				int tex = level_data[ij];//%4;//restrict to available textures (4 below).
				draw_image(renderer,x1,y1,x2,y2,mux_int(tex,spr_grass,spr_sand,spr_water,spr_lava));
				
			}
		}
		//Player.
		int d = win_game_tile_dim;
		draw_image_part(renderer,
			Player.x,Player.y,
			Player.x+d*gw,Player.y+d*gh,
			sprstrip_player,
			(Player.facedir*d*Player.anim_max)+(Player.anim_cur*d*1),0,
			d,d);
		
		//Splash intro screen.
		if (splashintro_bool)
		{
			draw_image(renderer,win_game_x,win_game_y,win_game_x2,win_game_y2,splashintro_img);
		}
		
		//Render to screen.
		SDL_RenderPresent(renderer);
		SDL_Delay(16);//60 fps.
		
		//End of main loop.
	}
	printf("...exited main loop.\n");

	//Shut down SDL
	SDL_DestroyTexture(spr_grass);
	SDL_DestroyTexture(spr_sand);
	SDL_DestroyTexture(spr_water);
	SDL_DestroyTexture(spr_lava);
	SDL_DestroyTexture(sprstrip_player);
	SDL_DestroyTexture(splashintro_img);
	IMG_Quit();
	
	//SDL_FreeWAV(&audio_spec);
	
	SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();

    //Wait n milliseconds jic something went wrong (so that printfs can be read)
    SDL_Delay(500);
    
	return 0;
	
    /* Upon an error, print message and quit properly */
error:
    fprintf(stderr, "%s Error returned: %s\n", errmsg, SDL_GetError());
    SDL_Quit();
    exit(EXIT_FAILURE);
}

//Faulty, unfinished, or obsolete code:
/*
		//clear_screen(surface);
        SDL_FillRect(surface, NULL, 0xFF0066CC);
		SDL_FillRect(surface, rect, 0xFFCC6600);
		
		SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
		//SDL_RenderFillRect(renderer, &rect);
		SDL_RenderDrawRect(renderer, &rect);
		
		//???
		//SDL_BlitSurface(surface,rect,surface,NULL);
	
		//Update window.
		SDL_UpdateWindowSurface(window);
		/**/
/*
		//int keyval = (glob_vk_right*1)+(glob_vk_up*2)+(glob_vk_left*3)+(glob_vk_down*4);
		int k0,k1,k2,k3;
		k0=glob_vk_right<<0;
		k1=glob_vk_up<<1;
		k2=glob_vk_left<<2;
		k3=glob_vk_down<<3;
		//int keyval = (glob_vk_right<<0)|(glob_vk_up<<1)|(glob_vk_left<<2)|(glob_vk_down<<3);
		int keyval=(k0|k1|k2|k3);
		if (keyval != 0)
		{
			draw_set_color(renderer,mux_int(keyval%4,c_yellow,c_green,c_aqua,c_fuchsia));
			draw_rectangle(renderer,128,128,160,160);
		}
		/**/