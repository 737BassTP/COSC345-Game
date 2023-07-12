/*
COSC345 - Game

Authors: (sorted alphabetically)
	Matthew
	Sven
	Thomas 
	?

SDL2 Documentation:
https://wiki.libsdl.org/SDL2/APIByCategory

*/

//#include "SDL2.dll"
#include "SDL2/include/SDL2/SDL.h"
#include "SDL2/include/SDL2/SDL_image.h"
#include <stdio.h>

//Colors.
const int c_white 	= 0xFFFFFF;
const int c_black 	= 0x000000;
const int c_gray 	= 0x808080;
const int c_dkgray 	= 0x404040;
const int c_ltgray 	= 0xC0C0C0;
const int c_red 	= 0x0000FF; 
const int c_orange 	= 0x00FF80;
const int c_yellow 	= 0x00FFFF;
const int c_lime 	= 0x0080FF;
const int c_green 	= 0x00FF00;
const int c_blue 	= 0xFF0000;
const int c_aqua 	= 0xFFFF00;
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
	r.w = x2;
	r.h = y2;
	SDL_RenderFillRect(renderer,&r);
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
	va_list args;
	va_start(args,nth);
	int ret = va_arg(args,int);
	for (int i=1; i<nth; i++)
	{
		ret = va_arg(args,int);
	}
	va_end(args);
	return ret;
}
int BG(int val,int nth)
{
	return (val>>nth)&1;
}

//Entry point.
int SDL_main(int argc, char *argv[])
{
	const int screen_w = 1600;
    const int screen_h = 900;
	const size_t bufsize = 0x100;//error printing
	
	char errmsg[bufsize];
    SDL_Surface* surface;
    SDL_Window* window;
    SDL_Renderer* renderer;
    SDL_Event event;
	
	SDL_Rect rect;// = {.x=32,.y=64,.w=480,.h=480};
	/**/
	rect.x = 32;
	rect.y = 64;
	rect.w = 480;
	rect.h = 480;
	/**/
	
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
	
	/**/
	IMG_Init(IMG_INIT_PNG);
	SDL_Texture *png = IMG_LoadTexture(renderer,"image-test.png");
	/**/
	
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
                    running = 0;
                    break;
                }
				case SDL_KEYDOWN:
				{
					//key held down or pressed
					int v=1;
					switch (event.key.keysym.sym)
					{
						case SDLK_RIGHT: {glob_vk_right	=v;} break;
						case SDLK_LEFT:  {glob_vk_left	=v;} break;
						case SDLK_UP:    {glob_vk_up	=v;} break;
						case SDLK_DOWN:  {glob_vk_down	=v;} break;
						
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
						
					}
					break;
				}
				
            }
        }
		
		//Draw here.
		//SDL_SetRenderDrawColor(renderer,0,0,255,255);//blue
		draw_clear(renderer,c_blue);
		
		SDL_RenderCopy(renderer,png,NULL,NULL);//texture fill whole renderer.
		
		
		//SDL_SetRenderDrawColor(renderer,255,0,0,255);//red
		draw_set_color(renderer,c_red);
		draw_rectangle(renderer,32,64,480,480);
		
		/**/
		if (glob_vk_right)
		{
			draw_set_color(renderer,c_green);
		}
		if (glob_vk_left)
		{
			draw_set_color(renderer,c_yellow);
		}
		if (glob_vk_up)
		{
			draw_set_color(renderer,c_orange);
		}
		if (glob_vk_down)
		{
			draw_set_color(renderer,c_rose);
		}
		if (glob_vk_right|glob_vk_left|glob_vk_up|glob_vk_down)
		{
			draw_rectangle(renderer,128,128,160,160);
		}
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
		
		
		//Render to screen.
		SDL_RenderPresent(renderer);
		SDL_Delay(16);//60 fps.
		
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
	}
	printf("...exited main loop.\n");

	//Shut down SDL
	/**/
	SDL_DestroyTexture(png);
	IMG_Quit();
	/**/
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

