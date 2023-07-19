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
#include <stdlib.h> // for rand() and srand()
#include <time.h>   // for time()
#include <string.h>
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
int glob_vk_f2      = 0;

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
	//done in main-loop.
}
void dev_tiled_to_leveldata()
{
	printf("faulty at the moment.\n");
	glob_vk_f2=0;//fakes a keyboard press event (fails if held).
	/**/
	//extracts Tiles and Objects.
	//hardcoded.
	FILE *filin;
	FILE *filout;
	
	filin = fopen("tiled/cosc345-game.tmx","r");
	filout = fopen("level-new.dat","wb");
	
	int maxsize = 65536*2;//131072
	byte array[131072];//tiles + objects.
	//maxsize = 32;//16*16*32;//debug only.
	for (long i=0; i<maxsize; i++) {array[i] = 0;}
	fread(array,maxsize,1,filin);
	
	//Discard input header.
	fseek(filin,(long int)0x1F7-0,SEEK_SET);
	//Read Tiles and Objects.
	/*
	fwrite(array,maxsize,1,filout);
	
	fclose(filin);
	fclose(filout);
	/**/
	byte comma=","[0];
	int ch=0;
	byte entry[3];
	int counter=0;
	while (1)
	{
		//fseek(filin,1,SEEK_CUR);
		ch = fgetc(filin);
		//printf("%i\n",ch;
		//if (ch == "<"[0])
		if (ch == 60)
		{
			break;
		}
		if (counter>=maxsize) 
		{
			break;
		}
		//Clear.
		for (int i=0; i<3; i++)
		{
			entry[i]=48;
		}
		printf("entries: %i,%i,%i\n",entry[0],entry[1],entry[2]);
		
		//Populate.
		entry[0] = ch;
		printf("ch0=%i\n",ch);
		ch = fgetc(filin);
		if (ch != comma)
		{
			entry[1]=ch;
			printf("ch1=%i\n",ch);
			ch = fgetc(filin);
			if (ch != comma)
			{
				entry[2]=ch;
				printf("ch2=%i\n",ch);
				fgetc(filin);//remove implied comma.
			}
			else
			{
				entry[2]=entry[1];
				entry[1]=entry[0];
				entry[0]=48;
			}
		}
		else
		{
			entry[2]=entry[0];
			entry[0]=48;
		}
		
		//Calculate.
		for (int i=0; i<3; i++)
		{
			entry[i] -= 48;
		}
		byte val = (byte)(entry[0]*100 + entry[1]*10 + entry[2]*1);//e.g "179" -> 179. if buggy, use int val.
		if (val == 0) {val=255;}//0 is undefined in tiled.
		else {val -= 1;}//map [1,256] to [0,255]
		printf("i=%i/%i: %i (%i,%i,%i)\n\n",counter,maxsize,val,entry[0],entry[1],entry[2]);
		val &= 0xFF;
		//fputc(val,filout);
		array[counter] = val;
		counter++;
	}
	fwrite(array,maxsize,1,filout);
	fclose(filin);
	fclose(filout);
	/**/
}
void play_WAV(const char* wavfile)
{
	//done manually in main.
	
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


/*
Structs.
*/
//Position.
struct pos
{
	int x;
	int y;
	int xprevious;
	int yprevious;
};
//NPC.
struct NPC
{
	int x;
	int y;
	int xprevious;
	int yprevious;
	byte face_dir;
};
//rain struct
struct WaterParticle {
    float x;
    float y;
    float speed;
    int active;
};
//initialize number of water particles wanted
const int MAX_WATER_PARTICLES = 100;
struct WaterParticle* waterParticles;
//function to create water particle.
void createWaterParticle(int index, int window_width, int window_height) {
    waterParticles[index].x = rand() % (1366-596)+298;     // Random x position within window width
    waterParticles[index].y = -(rand() % window_height); // Random initial y position above the window
    waterParticles[index].speed = 10;        // Rain speed
    waterParticles[index].active = 1;                    // Set active to 1 (true)
}

//Player.
struct player
{
	//pos Pos;
	int x;
	int y;
	int xprevious;
	int yprevious;
	byte facedir;
	byte anim_spd_cur;//counter.
	byte anim_spd_spd;//inc counter by spd per frame.
	byte anim_spd_wrap;//inc sprite frame when counter exceeds this value.
	byte anim_cur;//current sprite frame.
	byte anim_max;//max sprite frame before rollover.
	byte move_spd;//moving speed of player.
	byte can_move;//bit-flag to be set while displaying map, questions, etc..., to prevent the player from moving.
};

//Pushable block.
struct pushblock
{
	int x;
	int y;
	char pushmask;
};

//Audio.
typedef struct
{
    Uint8* buffer;
    Uint32 length;
    Uint32 position;
} AudioData;//must be typedef'ed like this to fix compile bugs.

void audioCallback(void* userdata, Uint8* stream, int len) {
    AudioData* audiodata = (AudioData*)userdata;
    if (audiodata->position >= audiodata->length) {
        audiodata->position = 0;  // Reset position to the beginning of the buffer
    }
    Uint32 remainingBytes = audiodata->length - audiodata->position;
    Uint32 bytesToCopy = len < remainingBytes ? len : remainingBytes;
    SDL_memcpy(stream, audiodata->buffer + audiodata->position, bytesToCopy);
    audiodata->position += bytesToCopy;
}

//Game clock. (HH:MM)
int clock_get_hour(int time) {return (time/60)%24;}
int clock_get_minute(int time) {return time%60;}
int clock_is_between(int time,int h1,int m1,int h2,int m2)
{
	int c1,c2;
	c1 = h1*60 + m1;
	c2 = h2*60 + m2;
	return ((time>=c1) && (time<=c2));
	/*
	int gh,gm;
	gh = clock_get_hour(time);
	gm = clock_get_minute(time);
	return (gh>=h1)&&(gh<)
	/**/
}

/*
Entry point.
*/
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
	//rain

    // Allocate memory for water particles
    waterParticles = malloc(MAX_WATER_PARTICLES * sizeof(struct WaterParticle));
    if (waterParticles == NULL) {
        // Handle allocation failure
        fprintf(stderr, "Failed to allocate memory for water particles\n");
        return 1;
    }
	//initialize random number generator seed
	srand(time(NULL));
    // Initialize water particles
    for (int i = 0; i < MAX_WATER_PARTICLES; i++) {
        createWaterParticle(i, screen_w, screen_h);
    }
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
	//Text.
	SDL_Texture *font_ascii = IMG_LoadTexture(renderer,"img/ascii_strip96.png");
	int font_ascii_w = 8;
	int font_ascii_h = 24;
	
	//Clock (digital).
	SDL_Texture *spr_clock_digital = IMG_LoadTexture(renderer,"img/clock1_strip10.png");
	int time_clock_max=1440;
	int time_clock = 0;//range: 0-1439 = 00:00-23:59
	int time_clock_fps=0;//rapidly emulate sub-seconds.
	int time_clock_fps_max=57;//below 60 to accommodate for delays.
	int time_clock_fps_multiplier=60;//1=1/1 second, 4=1/4 second.
	char *timestr_a="Night";
	char *timestr_b="Morning";
	char *timestr_c="Day";
	char *timestr_d="Evening";
	
	//Game Level.
	int level_size = sqr(win_game_tile_num);//16*16=256
	int level_count = 256;
	int level_cur=0;//256 = 16*16 
	byte level_data[65536];//static; can not be free'd.
	//65536 = 256*256 (level size * level count)
	FILE *fil = fopen("level.dat","rb");
	for (int i=0; i<level_size*level_count; i++)
	{
		level_data[i] = 0;
	}
	fread(level_data,sizeof(level_data),1,fil);
	fclose(fil);
	
	//Map.
	SDL_Texture *spr_map = IMG_LoadTexture(renderer,"img/dunedin-map.png");
	char mapstr_location[16];
	level_get_name(level_cur,mapstr_location);
	
	//Player.
	struct player Player;
	//struct pos Pos;
	//Player.Pos = Pos;
	Player.x = win_game_x + 8*gw*win_game_tile_dim;
	Player.y = win_game_y + 8*gh*win_game_tile_dim;
	Player.facedir = 0;
	Player.anim_spd_cur = 0;//counter.
	Player.anim_spd_spd = 1;//inc counter by spd per frame.
	Player.anim_spd_wrap = 12;//inc sprite frame when counter exceeds this value.
	Player.anim_cur = 0;//current sprite frame.
	Player.anim_max = 2;//max sprite frame before rollover.
	Player.move_spd = 3*4;
	
	//Music.
	const char *wavfile="music.wav";
	SDL_AudioSpec wavspec;
	Uint8 *wavbuffer;
	Uint32 wavlength;
	if (SDL_LoadWAV(wavfile, &wavspec, &wavbuffer, &wavlength) == NULL) 
	{
        printf("Failed to load WAV file: %s\n", SDL_GetError());
        return;
    }
	AudioData audiodata;
    audiodata.buffer = wavbuffer;
    audiodata.length = wavlength;
    audiodata.position = 0;
	wavspec.callback = audioCallback;
    wavspec.userdata = &audiodata;
	
	SDL_AudioDeviceID deviceid;
	deviceid = SDL_OpenAudioDevice(NULL,0,&wavspec,NULL,0);
	if (deviceid == 0) {
        printf("Failed to open audio device: %s\n", SDL_GetError());
        SDL_FreeWAV(wavbuffer);
        return;
    }
	SDL_QueueAudio(deviceid,wavbuffer,wavlength);
	SDL_PauseAudioDevice(deviceid,0);//0 is unpause
	
	//Splash intro screen.
	int splashintro_bool=1;
	SDL_Texture *splashintro_img  = IMG_LoadTexture(renderer,"img/img_lands.png");
	char* splashintro_string = "Press SPACE to continue.";
	
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
						case SDLK_F2:  {glob_vk_f2	=v;} break;
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
						case SDLK_F2:  {glob_vk_f2	=v;} break;
						//case SDLK_:  {glob_vk_	=v;} break;
						
					}
					break;
				}
				
            }
        }
		
		/*
		Process inputs.
		*/
		//Debug input:
		if (glob_vk_f2)
		{
			printf("F2 started!\n");	
			dev_tiled_to_leveldata();
			printf("F2 finished!\n");	
		}
		
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
			//Position.
			
			//Animation.
			Player.anim_spd_cur += Player.anim_spd_spd;
			Player.anim_cur += (Player.anim_spd_cur >= Player.anim_spd_wrap);
			Player.anim_spd_cur %= Player.anim_spd_wrap;
			Player.anim_cur %= Player.anim_max;
			//Position wrapping and level loading.
			int p_east,p_north,p_west,p_south;
			p_east  = win_game_x2-win_game_tile_dim*gw;
			p_north = win_game_y;
			p_west  = win_game_x;
			p_south = win_game_y2-win_game_tile_dim*gh;
			int lvlbool = 0;
			lvlbool = ((Player.x > p_east)||(Player.y > p_south)||(Player.x < p_west)||(Player.y < p_north));//must be here, and not below the individual checks!
			if (Player.x > p_east)
			{
				//at east side
				Player.x = p_west;
				level_cur += 1;
			}
			if (Player.y < p_north)
			{
				//at north side
				Player.y = p_south;
				level_cur -= (int)sqrt(level_count);
			}
			if (Player.x < p_west)
			{
				//at west side
				Player.x = p_east;
				level_cur -= 1;
			}
			if (Player.y > p_south)
			{
				//at south side
				Player.y = p_north;
				level_cur += (int)sqrt(level_count);
			}
			if (lvlbool)//has changed level
			{
				level_cur += level_count;//allows negative wrap.
				level_cur %= level_count;//prevents overflow.
				//printf("lvl=%i\n",level_cur);
				level_get_name(level_cur,mapstr_location);
				
			}
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
		Post-update of inputs.
		*/
		Player.xprevious = Player.x;
		Player.yprevious = Player.y;
		
		/*
		General updates.
		*/
		//water stuff
		// Update water particles (rain drops)
        for (int i = 0; i < MAX_WATER_PARTICLES; i++) 
		{
            if (waterParticles[i].active) 
			{
                waterParticles[i].y += waterParticles[i].speed;

                // Check if particle has reached the bottom of the window
                if (waterParticles[i].y > screen_h) {
                    // Randomly deactivate particle (remove randomness for constant rain)
                    if (rand() % 100 < 5) {
                        waterParticles[i].active = 0; // Set active to 0 (false)
                    } else {
                        createWaterParticle(i, screen_w, screen_h);
                    }
                }
            }
        }
		//Timekeeping.
		time_clock_fps += 1*time_clock_fps_multiplier;
		time_clock += (time_clock_fps>=time_clock_fps_max);
		time_clock %= time_clock_max;
		time_clock_fps %= time_clock_fps_max;
		
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
		
		//UI.
		int uix,uiy;
		//UI Left.
		uix = gw; 
		uiy = 0;
		if (!splashintro_bool)
		{
			draw_text(renderer,uix,uiy,font_ascii_w*gw,font_ascii_h*gh,font_ascii,"Location:#DUNEDIN#NEW ZEALAND",font_ascii_w,font_ascii_h);
		}
		//UI Right.
		uix = gw+win_game_x2;
		uiy = 0;
		if (!splashintro_bool)
		{
			//Level.
			char *lvlstrold = "LVL: XYZ/255";
			char lvlstrnew[strlen(lvlstrold)];//a hard-coded value too small causes a code-overwrite bug that messes with player movement!
			strcpy(lvlstrnew,lvlstrold);
			//lvlstrnew[7] = ((char)level_cur)+48;//7 is "X" above.
			byte lc = (byte)level_cur;//note: "signed char" causes bugs out in the [128,255] range because it is out of range; "unsigned char" allows 255.
			lvlstrnew[string_pos("X",lvlstrnew)] = ((lc/100)%10) + 48;//48="0"
			lvlstrnew[string_pos("Y",lvlstrnew)] = ((lc/10 )%10) + 48;//%10 maps to 0-9.
			lvlstrnew[string_pos("Z",lvlstrnew)] = ((lc/1  )%10) + 48;//
			//sprintf(lvlstr,"Level:#",level_cur);
			
			draw_text(renderer,uix,uiy                ,font_ascii_w*gw,font_ascii_h*gh,font_ascii,lvlstrnew,font_ascii_w,font_ascii_h);
			draw_text(renderer,uix,uiy+font_ascii_h*gh,font_ascii_w*gw,font_ascii_h*gh,font_ascii,mapstr_location,font_ascii_w,font_ascii_h);
			
			
			//Map.
			int mapx1,mapy1,mapx2,mapy2;
			mapx1=uix;
			mapy1=uiy+font_ascii_h*2*gh;
			mapx2=mapx1+256;
			mapy2=mapy1+256;
			draw_image(renderer,mapx1,mapy1,mapx2,mapy2,spr_map);
			//Location crosshair lines.
			int mcx=(int)lerp((double)mapx1,(double)mapx2,(double)(BGG(lc,4,0)/16.0));
			draw_rectangle_color(renderer,mcx-1,mapy1,mcx+1,mapy2,c_red);//ver(x)
			int mcy=(int)lerp((double)mapy1,(double)mapy2,(double)(BGG(lc,4,1)/16.0));
			draw_rectangle_color(renderer,mapx1,mcy-1,mapx2,mcy+1,c_red);//hor(y)
			draw_rectangle_color(renderer,mcx,mcy,
				(int)lerp((double)mapx1,(double)mapx2,(double)((BGG(lc,4,0)+1)/16.0)),
				(int)lerp((double)mapy1,(double)mapy2,(double)((BGG(lc,4,1)+1)/16.0)),
				c_red);
			//Timekeeping.
			//Digital clock.
			int coff=0;
			int clocky2 = mapy2+32*gh;
			for (int i=0; i<5; i++)
			{
				int clo = mux_int(i,(time_clock/600),(time_clock/60)%10,737,(time_clock/10)%6,time_clock%10);
				if (i != 2)
				{
				draw_image_part(renderer,
					uix+(i+0)*16*gw+coff,mapy2,
					uix+(i+1)*16*gw+coff,clocky2,
					spr_clock_digital,
					clo*16,0,
					16,32);
				coff += gw;
				}
				else
				{
					draw_text(renderer,uix+2*16*gw,mapy2,uix+3*16*gw,clocky2,font_ascii,":",font_ascii_w,font_ascii_h);
				}
			}
			//char ct[10];
			//const char time_clock_str="Daytime";
			//strcpy(ct,time_clock_str);
			int ct=0;
			if (clock_is_between(time_clock, 0,0, 5,59)) {ct=0;}
			if (clock_is_between(time_clock, 6,0,11,59)) {ct=1;}
			if (clock_is_between(time_clock,12,0,17,59)) {ct=2;}
			if (clock_is_between(time_clock,18,0,23,59)) {ct=3;}
			draw_text(renderer,
				uix,clocky2+gh,
				font_ascii_w*gw,font_ascii_h*gh,
				font_ascii,mux_str(ct,timestr_a,timestr_b,timestr_c,timestr_d),
				font_ascii_w,font_ascii_h);
			
		}
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
				int off = ij + level_size*level_cur;
				int tex = level_data[off] % 4;//restrict to available textures (4 below).
				//draw_image(renderer,x1,y1,x2,y2,(SDL_Texture*)mux_int(tex,spr_grass,spr_sand,spr_water,spr_lava));
				SDL_Texture* picture;
				switch(tex){
					case 0:{picture=spr_grass;break;}
					case 1:{picture=spr_sand;break;}
					case 2:{picture=spr_water;break;}
					case 3:{picture=spr_lava;break;}
					default:{picture=spr_grass; printf("title has no texture!\n");break;}
				}
				draw_image(renderer,x1,y1,x2,y2,picture);
				
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
		
		// Draw water particles
        for (int i = 0; i < MAX_WATER_PARTICLES; i++) {
            if (waterParticles[i].active) {
                draw_image(renderer, waterParticles[i].x, waterParticles[i].y, waterParticles[i].x + 5, waterParticles[i].y + 15, spr_water);
            }
        }
		//Splash intro screen.
		if (splashintro_bool)
		{
			draw_image(renderer,win_game_x,win_game_y,win_game_x2,win_game_y2,splashintro_img);
			draw_text(renderer,win_game_x,win_game_y,font_ascii_w*gw,font_ascii_h*gh,font_ascii,splashintro_string,font_ascii_w,font_ascii_h);
		}
		
		//Render to screen.
		SDL_RenderPresent(renderer);
		SDL_Delay(16);//60 fps.
		
		//End of main loop.
	}
	printf("...exited main loop.\n");

	//Shut down SDL
	free(waterParticles);
	SDL_DestroyTexture(spr_grass);
	SDL_DestroyTexture(spr_sand);
	SDL_DestroyTexture(spr_water);
	SDL_DestroyTexture(spr_lava);
	SDL_DestroyTexture(spr_map);
	SDL_DestroyTexture(sprstrip_player);
	SDL_DestroyTexture(splashintro_img);
	SDL_DestroyTexture(font_ascii);
	SDL_DestroyTexture(spr_clock_digital);
	IMG_Quit();
	
	//SDL_FreeWAV(&audio_spec);
	SDL_CloseAudioDevice(deviceid);
    SDL_FreeWAV(wavbuffer);
	
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