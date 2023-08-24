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
#include "everything.h"

#include <math.h>
#include <stdarg.h> //for variadic functions.
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h> // for rand() and srand()
#include <string.h>
#include <time.h>   // for time()

/*
Global variables and memory allocations.
*/
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

//Scaling.
int gw,gh;

//Structs.
struct Enemy* globalEnemy = NULL; // Initialize the global pointer to NULL initially


/*
Entry point.
*/
int SDL_main(int argc, char *argv[])
{
	/*!
	* Doxygen test in the main function.
	* \file main.c
	* @file main.c
	* Ran from main.c
	*/
	
	//Handle command-line arguments.
	if (argc >= 2)
	{
		//Unit testing with "unittest".
		//Will quit the game after all tests.
		const char* unittest = "unittest";
		if (strcmp(argv[1],"unittest") == 0)
		{
			int ret = 0;
			printf("Unit testing will start:\n");
			ret = unit_test_all();
			printf("Unit testing is complete!\nIt found %i errors!\n",ret);
			return ret;
		}
		//Invalid command-line argument.
		else
		{
			printf("No such argument exists!\nGot: %s\n",argv[1]);
		}
	}
	
	//Error printing.
	const size_t bufsize = 0x100;
	char errmsg[bufsize];
	
	//Print SDL2 version.
	if (1)
	{
		SDL_version sdlver_compiled;
		SDL_version sdlver_linked;
		SDL_VERSION(&sdlver_compiled);
		SDL_GetVersion(&sdlver_linked);
		SDL_Log("Compiled with SDL version %u.%u.%u ...\n",sdlver_compiled.major,sdlver_compiled.minor,sdlver_compiled.patch);
		SDL_Log("Linked against SDL version %u.%u.%u.\n",sdlver_linked.major,sdlver_linked.minor,sdlver_linked.patch);
	}
	
	//Scaling.
	gw = screen_h/sqr(win_game_tile_num);// == 3, an int (for res. 1366/768 and 16x 16*16 px tiles per axis).
	gh = gw;

	//SDL2 structs.
	SDL_Surface* surface;
    SDL_Window* window;
    SDL_Renderer* renderer;
    SDL_Event event;
	
	//initialize random number generator seed
	srand(time(NULL));
	
	//rain
	rain_create();
	snow_create();
	//Set up SDL2.
	//void SDL_SetMainReady(void);
	//int flags = SDL_INIT_VIDEO|SDL_INIT_AUDIO;
	int flags = SDL_INIT_EVERYTHING;
	if (SDL_Init(flags) != 0)
	{
		printf("SDL init error:%s\n",SDL_GetError());
		return -1;
	}
	
	//Create window (main window).
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
    if (!surface)
	{
        snprintf(errmsg, bufsize, "Surface error");
        goto error;
    }
	// Load a TTF font (adjust the file path and size as needed)
	// Initialize SDL_ttf
    if (TTF_Init() == -1)
	{
        printf("SDL_ttf could not initialize! TTF_Error: %s\n", TTF_GetError());
        return 1;
    }
    TTF_Font* font = TTF_OpenFont("font.ttf", 12);
    if (font == NULL)
	{
        printf("Failed to load font! SDL_ttf Error: %s\n", TTF_GetError());
        return 1;
    }
	//Create a renderer for the window
    SDL_Renderer* rendererPop = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    if (renderer == NULL)
	{
        printf("Renderer could not be created! SDL_Error: %s\n", SDL_GetError());
    }
	
	//Images.
	IMG_Init(IMG_INIT_PNG);
	//SDL_Texture *spr_grass = IMG_LoadTexture(renderer,"image-test.png");
	SDL_Texture *spr_grass = IMG_LoadTexture(renderer,"img/spr_grass.png");
	SDL_Texture *spr_sand  = IMG_LoadTexture(renderer,"img/spr_sand.png");
	SDL_Texture *spr_water = IMG_LoadTexture(renderer,"img/spr_water_strip16.png");
	SDL_Texture *spr_lava  = IMG_LoadTexture(renderer,"img/spr_lava_strip16.png");
	SDL_Texture *spr_water_shallow = IMG_LoadTexture(renderer,"img/spr_water_shallow_strip16.png");
	SDL_Texture *spr_lava_shallow  = IMG_LoadTexture(renderer,"img/spr_lava_shallow_strip16.png");
	SDL_Texture *spr_tileset = IMG_LoadTexture(renderer,"tiled/tileset.png");
	SDL_Texture *spr_hudshade = IMG_LoadTexture(renderer,"img/hudshade.png");
	SDL_Texture *spr_enemy1 = IMG_LoadTexture(renderer,"img/spr_enemy1.png");
	SDL_Texture *penguinSamImg = IMG_LoadTexture(renderer,"img/sammy.png");
	SDL_Texture *snowflake = IMG_LoadTexture(renderer,"img/snowflake.png");
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
	int weekday=0;
	char *weekday_string="MTWTFSS";
	int monthday=0;//4 weeks=28 days.
	char month_str[5];//e.g "21stNULL"
	
	//Game Level.
	int level_size = sqr(win_game_tile_num);//16*16=256
	int level_realms = 2;//overworld, underworld.
	int level_count = 256*level_realms;
	int level_layers = 2;
	int level_cur=0;//256 = 16*16 
	byte level_data[262144];//static; can not be free'd.
	//262144 = 256*512*2 (level size * level count * level layers)
	level_load(level_data,level_size,level_count,level_layers);
	int lvl_off_obj=0x20000;
	int lvl_yoff=(int)sqrt(level_count/level_realms);
	
	//Map.
	SDL_Texture *spr_map = IMG_LoadTexture(renderer,"img/dunedin-map.png");
	SDL_Texture *spr_mapicon_unknown = IMG_LoadTexture(renderer,"img/spr_map_unknown.png");
	char mapstr_location[16];
	level_get_name(level_cur,mapstr_location);
	Uint32 mapvisit[16];//512 bools.
	mapvisit[level_cur/32]=1<<(level_cur%32);
	
	//Temperature.
	int temp_mode=0;//0=Celsius, 1=Fahrenheit.
	int temp_cur=10;
	char temp_str[5];//(-/+)xy*(C/F)
	temp_str[3]="*"[0];
	SDL_Texture *spr_thermometer = IMG_LoadTexture(renderer,"img/spr_thermometer.png");
	byte temp_col=0x80;
	
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
	//damage stats
	Player.attackRangeHeight=50;
	Player.attackRangeWidth=15;
	Player.damage=50;
	Player.width=15;
	Player.height=15;
	updatePlayerHitbox(Player.x, Player.y, Player.width, Player.height);

	//test enemy
	// struct Enemy enemy1;//Random player enemy
	// initEnemy(&enemy1, 500, 500, 100, 100, 100, 10, spr_enemy1);//size, stats and image to go with it.
	// globalEnemy = &enemy1;//making it the global enemy.

	struct NPC* globalNpc = NULL;//global npc
	struct NPC Tutor;//npc on level 016
	struct NPC penguinSam;
	struct NPC forestMan;
	struct NPC Tutorlvl2;
	struct NPC quizTutor;
	initNPC(&Tutor, 900, 700,50, 50, 400, 400, 2, spr_enemy1, 16);//init tutor
	addNPC(&Tutor);//add tutor to NPC array
	initNPC(&Tutorlvl2, 900, 400,50, 50, 400, 400, 2, spr_enemy1, 1);//init tutor2
	addNPC(&Tutorlvl2);//add tutor to NPC array
	initNPC(&penguinSam, 700, 900,50, 50, 400, 400, 2, penguinSamImg, 110);//init sammyPenguin
	addNPC(&penguinSam);
	initNPC(&forestMan, 630, 520,50, 50, 400, 400, 2, spr_enemy1, 160);//init forestMan
	addNPC(&forestMan);
	initNPC(&quizTutor, 850, 520,50, 50, 400, 400, 2, spr_enemy1, 3);//init forestMan
	addNPC(&quizTutor);
	//Nutrients.
	SDL_Texture *spr_nutrients = IMG_LoadTexture(renderer,"img/spr_nutrients_strip4.png");
	
	//Music.
	//music_bootup();
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
	if (deviceid == 0)
	{
        printf("Failed to open audio device: %s\n", SDL_GetError());
        SDL_FreeWAV(wavbuffer);
        return;
    }
	SDL_QueueAudio(deviceid,wavbuffer,wavlength);
	SDL_PauseAudioDevice(deviceid,0);//0 is unpause
	//SDL_MixAudioFormat(wavbuffer,wavbuffer,AUDIO_S16,wavlength,32);
	//play_WAV(wavfile,&wavspec,&wavbuffer,&wavlength);
	
	
	//Splash intro screen.
	int splashintro_bool=1;
	SDL_Texture *splashintro_img1 = IMG_LoadTexture(renderer,"img/logo1a.png");
	SDL_Texture *splashintro_img2 = IMG_LoadTexture(renderer,"img/logo1b.png");
	SDL_Texture *splashintro_img3 = IMG_LoadTexture(renderer,"img/logo1c.png");
	char* splashintro_string = "Press SPACE to continue.";
	char* splashintro_string_copyright = "(C) 2023 - Thomas, Sean, Matthew, Nicholas - COSC345";
	int splashintro_slen1=strlen(splashintro_string);
	int splashintro_slen2=strlen(splashintro_string_copyright);
	
	//pop up window test
	//int option = 0;
    //char optionText[2] = "0";
	SDL_Rect buttonRect = { 800, 100, 175, 120 };//dimension of popup
	char buttonTexts[100] = "default message";//message in the window
	char* buttonText = buttonTexts;
	SDL_Rect* buttonRectPtr = &buttonRect; // Declare and initialize buttonRectPtr to point to buttonRect
	int nextChat = 0;
	int buttonVis = 0;//0 for no window and 1 for visible window
	int buttonVis2 = 0;//for second person chatting
	int tutorChatCompleted = 0;
	int tutorlvl2ChatCompleted = 0;
	int penguinSamChatCompleted = 0;
	int forestManChatCompleted = 0;
	int quizTutorChatCompleted = 0;
	int popup = 0;
	//score display
	int score = 0; //initial score
	SDL_Color scoreColour = { 0, 0, 0, 255 };
    
	
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
						case SDLK_0:  {glob_vk_0=v;} break;
						case SDLK_1:  {glob_vk_1=v;} break;
						case SDLK_2:  {glob_vk_2=v;} break;
						case SDLK_3:  {glob_vk_3=v;} break;
						case SDLK_4:  {glob_vk_4=v;} break;
						case SDLK_5:  {glob_vk_5=v;} break;
						case SDLK_6:  {glob_vk_6=v;} break;
						case SDLK_7:  {glob_vk_7=v;} break;
						case SDLK_8:  {glob_vk_8=v;} break;
						case SDLK_9:  {glob_vk_9=v;} break;
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
						case SDLK_0:  {glob_vk_0=v;} break;
						case SDLK_1:  {glob_vk_1=v;} break;
						case SDLK_2:  {glob_vk_2=v;} break;
						case SDLK_3:  {glob_vk_3=v;} break;
						case SDLK_4:  {glob_vk_4=v;} break;
						case SDLK_5:  {glob_vk_5=v;} break;
						case SDLK_6:  {glob_vk_6=v;} break;
						case SDLK_7:  {glob_vk_7=v;} break;
						case SDLK_8:  {glob_vk_8=v;} break;
						case SDLK_9:  {glob_vk_9=v;} break;
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
			dev_tiled_to_leveldata(level_data);
			printf("F2 finished!\n");	
		}
		if(glob_vk_7)
		{
			glob_vk_7=0;
			attack(&Player);//calls attack function
			renderWeaponSwing(renderer, spr_water, &Player);//renders the swing
		}

		//Rain toggle.
		if (glob_vk_0)
		{
			glob_vk_0=0;
			//turn water on and off for testing
			// waterSlow=1; //testing waterSlow function
			if(waterOn==0)
			{
				waterOn=1;
				activateAllWaterParticles();
				activateAllSnowParticles();
			}
			else
			{
				waterOn=0;
				deactivateAllWaterParticles();
				deactivateAllSnowParticles();
			}
		}
		//Popup window.
		if (glob_vk_9)
		{
			glob_vk_9=0;//press, not hold.
			//pressing 9 resets chat with npc if you have already completed the dialogue
			if(buttonVis==0)
			{
				buttonVis=1;
			}
			else
			{
				buttonVis=0;
			}
		}
		//pressing 1 changes text inside test box.
		if (glob_vk_1)
		{
			glob_vk_1=0;
			if(buttonVis==1)
			{
				// chatBoxMod(buttonRectPtr, 100, 200, 300, 400); //testing function to see if it works.
				nextChat+=1;
			}
			else if(quizOn)
			{
				userAnswer=1;
			}
		}
		if (glob_vk_2)
		{
			glob_vk_2=0;
			if(buttonVis==1)
			{
				//functionality to be added
			}
			else if(quizOn)
			{
				userAnswer=2;
			}
		}
		if (glob_vk_3)
		{
			glob_vk_3=0;
			if(buttonVis==1)
			{
				//functionality to be added
			}
			else if(quizOn)
			{
				userAnswer=3;
			}
		}
		if (glob_vk_4)
		{
			glob_vk_4=0;
			if(buttonVis==1)
			{
				//functionality to be added
			}
		}
		if (glob_vk_5)
		{
			glob_vk_5=0;
			damageMe(10);
		}
		if (glob_vk_6)
		{
			glob_vk_6=0;
			healMe(10);
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
			updatePlayerHitbox(Player.x, Player.y, Player.width, Player.height);
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
				level_cur -= lvl_yoff;
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
				level_cur += lvl_yoff;
			}
			if (lvlbool)//has changed level
			{
				randomSpawnEnemy(500, 500, 100, 100, 100, 10, spr_enemy1, level_cur);//random spawn an enemy with these stats
				buttonVis=0;//remove npc chatbox if you walk away
				
				level_cur += level_count;//allows negative wrap.
				level_cur %= level_count;//prevents overflow.
				printf("lvl=%i\n",level_cur);
				level_get_name(level_cur,mapstr_location);
				
				mapvisit[level_cur/32] |= (Uint32)(1<<level_cur%32);
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
                if (waterParticles[i].y > screen_h) 
				{
					if(waterSlow==1)
					{
						if (rand() % 4 < 3)
						{ //every drop that hits bottom of screen has 75% chance of dissapearing with waterSlow toggled.
							waterParticles[i].active = 0; // Set active to 0 (false)
						} 
						else
						{
							createWaterParticle(i, screen_w, screen_h);
						}
					}
					else
					{
						createWaterParticle(i, screen_w, screen_h);
					}
                }
            }
        }
		//snow fall loop
		for (int i = 0; i < MAX_SNOW_PARTICLES; i++) 
		{
            if (snowParticles[i].active) 
			{
                snowParticles[i].y += snowParticles[i].speed;
                // Check if particle has reached the bottom of the window
                if (snowParticles[i].y > screen_h) 
				{
					if(snowSlow==1)
					{
						if (rand() % 4 < 3)
						{ //every drop that hits bottom of screen has 75% chance of dissapearing with waterSlow toggled.
							snowParticles[i].active = 0; // Set active to 0 (false)
						} 
						else
						{
							createSnowParticle(i, screen_w, screen_h);
						}
					}
					else
					{
						createSnowParticle(i, screen_w, screen_h);
					}
                }
            }
        }
		//Timekeeping.
		time_clock_fps += 1*time_clock_fps_multiplier;
		//time_clock += (time_clock_fps>=time_clock_fps_max);
		while (time_clock_fps>=time_clock_fps_max)
		{
			time_clock++;
			time_clock_fps-=time_clock_fps_max;
		}
		weekday = (weekday+(time_clock>=time_clock_max))%7;
		monthday = (monthday+(time_clock>=time_clock_max))%28;
		time_clock %= time_clock_max;
		time_clock_fps %= time_clock_fps_max;
		
		//Temperature.
		char newtempstr[6];//[5]=NULL
		strcpy(newtempstr,temp_str);
		newtempstr[0] = (char)(temp_cur>=0)?("+"[0]):("-"[0]);
		newtempstr[1] = (char)(temp_cur/10)+48;
		newtempstr[2] = (char)(temp_cur%10)+48;
		newtempstr[3] = (char)("*"[0]);
		newtempstr[4] = (char)(temp_mode==0)?(67):(70);
		//newtempstr[4] = (char)(temp_mode==0)?("C"[0]):("F"[0]);
		
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
		draw_image(renderer,0,0,win_game_x,screen_h,spr_hudshade);
		draw_rectangle_color(renderer,//middle
			win_game_x,0,
			screen_w-win_game_x,screen_h,
			c_rose);
		draw_rectangle_color(renderer,//right
			screen_w-win_game_x,0,
			screen_w,screen_h,
			c_orange);
		draw_image(renderer,screen_w-win_game_x,0,screen_w,screen_h,spr_hudshade);
		//SDL_RenderCopy(renderer,png,NULL,NULL);//test: texture fills whole renderer.
		
		//UI.
		int uix,uiy;
		int tc=c_black;
		//UI Left (player).
		uix = gw; 
		uiy = gh;
		if (!splashintro_bool)
		{
			draw_text_color(renderer,uix,uiy,font_ascii_w*gw,font_ascii_h*gh,font_ascii,"HEALTH:",font_ascii_w,font_ascii_h,tc);
			uiy += font_ascii_h*gh;
			//health bar
			//SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
			//draw_set_color(renderer,c_white);
			int maxWidth = 200; // Replace this with the maximum width of the health bar
			int maxHeight = 20; //this too.
			int currentWidth = (health * maxWidth) / maxHealth;
			// Render the red health bar
			/*
			SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
			SDL_Rect healthBarRect = { 0, 200, currentWidth, 20 };
			SDL_RenderFillRect(renderer, &healthBarRect);
			/**/
			//int col=make_color_hsv((int)lerp(120.0,0.0,(double)health/(double)maxHealth),255,255);
			int col=c_red;
			draw_rectangle_color(renderer,0,uiy,maxWidth,uiy+maxHeight,c_black);
			draw_rectangle_color(renderer,0,uiy,currentWidth,uiy+maxHeight,col);
			uiy += maxHeight;
			
			//Nutrients
			int nx,nd;
			nx=0;
			nd=32;
			for (int i=0; i<4; i++)
			{
				//placeholder 2/2
				draw_image_part(renderer,uix,uiy+nx,uix+nd*gw,uiy+nx+nd*gh,spr_nutrients,i*nd,0,nd,nd);
				draw_text_color(renderer,uix+nd*gw,uiy+nx+nd/2,font_ascii_w*gw,font_ascii_h*gh,font_ascii,mux_str(i,"Fat","Carbs","Protein","Vitamin"),font_ascii_w,font_ascii_h,tc);
				nx += nd*gw;
			}
			// SDL_RenderPresent(renderer);
		}
		//UI Right (world).
		uix = gw+win_game_x2;
		uiy = gh;
		if (!splashintro_bool)
		{
			//Level.
			char *lvlstrold = "LVL: XYZ/511";
			char lvlstrnew[strlen(lvlstrold)];//a hard-coded value too small causes a code-overwrite bug that messes with player movement!
			strcpy(lvlstrnew,lvlstrold);
			//lvlstrnew[7] = ((char)level_cur)+48;//7 is "X" above.
			word lc = (word)level_cur;//note: "signed char" causes bugs out in the [128,255] range because it is out of range; "unsigned char" allows 255.
			lvlstrnew[string_pos("X",lvlstrnew)] = ((lc/100)%10) + 48;//48="0"
			lvlstrnew[string_pos("Y",lvlstrnew)] = ((lc/10 )%10) + 48;//%10 maps to 0-9.
			lvlstrnew[string_pos("Z",lvlstrnew)] = ((lc/1  )%10) + 48;//
			//sprintf(lvlstr,"Level:#",level_cur);
			
			draw_text_color(renderer,uix,uiy                ,font_ascii_w*gw,font_ascii_h*gh,font_ascii,lvlstrnew,font_ascii_w,font_ascii_h,tc);
			draw_text_color(renderer,uix,uiy+font_ascii_h*gh,font_ascii_w*gw,font_ascii_h*gh,font_ascii,mapstr_location,font_ascii_w,font_ascii_h,tc);
			
			uiy += font_ascii_h*2*gh;
			
			//Map.
			int mapx1,mapy1,mapx2,mapy2;
			mapx1=uix;
			mapy1=uiy;
			mapx2=mapx1+256;
			mapy2=mapy1+256;
			draw_image(renderer,mapx1,mapy1,mapx2,mapy2,spr_map);
			//Discovered map levels.
			for (int i=0; i<256; i++)
			{
				if (!BG(mapvisit[i/32],i%32))
				{
					draw_image(renderer,
					(int)lerp((double)mapx1,(double)mapx2,(double)(i%16+0)/16.0),
					(int)lerp((double)mapy1,(double)mapy2,(double)(i/16+0)/16.0),
					(int)lerp((double)mapx1,(double)mapx2,(double)(i%16+1)/16.0),
					(int)lerp((double)mapy1,(double)mapy2,(double)(i/16+1)/16.0),
					spr_mapicon_unknown);
				}
			}
			//Location crosshair lines.			
			int mcx=(int)lerp((double)mapx1,(double)mapx2,(double)(BGG(lc,4,0)/16.0));
			draw_rectangle_color(renderer,mcx-1,mapy1,mcx+1,mapy2,c_red);//ver(x)
			int mcy=(int)lerp((double)mapy1,(double)mapy2,(double)(BGG(lc,4,1)/16.0));
			draw_rectangle_color(renderer,mapx1,mcy-1,mapx2,mcy+1,c_red);//hor(y)
			if (!(lc>>8))
			{
				draw_rectangle_color(renderer,mcx,mcy,
					(int)lerp((double)mapx1,(double)mapx2,(double)((BGG(lc,4,0)+1)/16.0)),
					(int)lerp((double)mapy1,(double)mapy2,(double)((BGG(lc,4,1)+1)/16.0)),
					c_red);
			}
			uiy += mapy2-mapy1;
			
			//Weekday.
			uiy += gh;
			int wyh=font_ascii_h*gh;
			char wc[2];
			double wf=1.0;
			draw_rectangle_color(renderer,
				uix+font_ascii_w*weekday*gw+(int)(wf*weekday*gw),uiy,
				uix+font_ascii_w*weekday*gw+(int)(wf*weekday*gw)+font_ascii_w*gw,uiy+wyh,
				c_red);
			for (int i=0; i<7; i++)
			{
				int wcol=i==6?c_red:c_black;
				wcol=i==weekday?c_white:wcol;
				wc[0]=weekday_string[i];
				draw_text_color(renderer,
					uix+font_ascii_w*i*gw+(int)(wf*i*gw),uiy,
					font_ascii_w*gw,font_ascii_h*gh,
					font_ascii,wc,
					font_ascii_w,font_ascii_h,wcol);
			}
			//Day of the month.
			month_str[0]=((monthday+1)/10)+48;
			month_str[1]=((monthday+1)%10)+48;
			month_str[2]=100+((monthday+1)%20>=4?16:mux_int((monthday+1)%20,16,15,10,14));
			month_str[3]=100+((monthday+1)%20>=4? 4:mux_int((monthday+1)%20, 4,16, 0, 0));
			draw_rectangle_color(renderer,
				uix+8*font_ascii_w*gw,uiy,
				uix+8*font_ascii_w*gw+4*font_ascii_w*gw,uiy+wyh,
				c_blue);
			draw_text_color(renderer,
				uix+8*font_ascii_w*gw,uiy,
				font_ascii_w*gw,font_ascii_h*gh,
				font_ascii,month_str,
				font_ascii_w,font_ascii_h,
				c_aqua);
			uiy += wyh;
			
			//Timekeeping.
			//Digital clock.
			int coff=0;
			int clocky1 = uiy;
			int clocky2 = uiy+32*gh;
			draw_set_color(renderer,tc);
			for (int i=0; i<5; i++)
			{
				int clo = mux_int(i,(time_clock/600),(time_clock/60)%10,737,(time_clock/10)%6,time_clock%10);
				if (i != 2)
				{
				draw_image_part(renderer,
					uix+(i+0)*16*gw+coff,clocky1,
					uix+(i+1)*16*gw+coff,clocky2,
					spr_clock_digital,
					clo*16,0,
					16,32);
				coff += gw;
				}
				else
				{
					draw_text_color(renderer,uix+2*16*gw,clocky1,font_ascii_w*gw,font_ascii_h*gh,font_ascii,":",font_ascii_w,font_ascii_h,tc);
				}
			}
			draw_set_color(renderer,c_white);
			uiy += clocky2-clocky1;
			
			//Time of day as string.
			uiy += gh;
			//char ct[10];
			//const char time_clock_str="Daytime";
			//strcpy(ct,time_clock_str);
			int ct=0;
			if (clock_is_between(time_clock, 0,0, 5,59)) {ct=0;}
			if (clock_is_between(time_clock, 6,0,11,59)) {ct=1;}
			if (clock_is_between(time_clock,12,0,17,59)) {ct=2;}
			if (clock_is_between(time_clock,18,0,23,59)) {ct=3;}
			//placeholder 1/2
			/**/
			draw_text_color(renderer,
				uix,uiy,
				font_ascii_w*gw,font_ascii_h*gh,
				font_ascii,mux_str(ct,timestr_a,timestr_b,timestr_c,timestr_d),
				font_ascii_w,font_ascii_h,tc);
			/**/
			uiy += font_ascii_h*gh;
			
			//Temperature.
			int tempy1,tempy2;
			tempy1=uiy;
			tempy2=tempy1+48*gh;
			//int dgc=draw_get_color();
			//draw_set_color(renderer,c_blue);
			draw_image(renderer,uix,tempy1,uix+16*gw,tempy2,spr_thermometer);
			//draw_set_color(renderer,dgc);
			draw_text_color(renderer,uix+48,(int)lerp((double)tempy1,(double)tempy2,0.25),font_ascii_w*gw,font_ascii_h*gh,font_ascii,newtempstr,font_ascii_w,font_ascii_h,tc);
			uiy += tempy2-tempy1;
			
			
		}
		//Game area.
		int d = win_game_tile_dim;
		int defcol=make_color_hsv(0,0,((int)(get_timer()))/16);
		for (int k=0; k<level_layers; k++)
		{
			for (int j=0; j<win_game_tile_num; j++)
			{
				for (int i=0; i<win_game_tile_num; i++)
				{
					int ij = i+j*win_game_tile_num+k*lvl_off_obj;
					int x1,y1,x2,y2;
					x1 = win_game_x + (i+0)*gw*win_game_tile_dim;
					y1 = win_game_y + (j+0)*gh*win_game_tile_dim;
					x2 = win_game_x + (i+1)*gw*win_game_tile_dim;
					y2 = win_game_y + (j+1)*gh*win_game_tile_dim;
					
					//int defcol = mux_int(ij%3,c_red,c_green,c_blue);
					
					int off = ij + level_size*level_cur;
					int tex = level_data[off];
					if (k==0)
					{
						draw_rectangle_color(renderer,x1,y1,x2,y2,defcol);//will show if image drawing below fails.
						draw_image_part(renderer,x1,y1,x2,y2,spr_tileset,d*(tex%win_game_tile_num),d*(tex/win_game_tile_num),d,d);
					}
					else if (k==1)
					{
						//animated
						if ((tex>=0x10) && (tex <=0x1F))
						{
							int fr=16;
							int di=(tex<0x12)?(60):(120);
							int at=(int)get_timer();
							SDL_Texture *spr;
								 if (tex==0x10) {spr=spr_water;}
							else if (tex==0x11) {spr=spr_water_shallow;}
							else if (tex==0x12) {spr=spr_lava;}
							else if (tex==0x13) {spr=spr_lava_shallow;}
							else                {spr=spr_water;}
							draw_image_part(renderer,x1,y1,x2,y2,spr,d*((at/di)%fr),0,d,d);
						}
						//unhandled.
						else
						{
							if (tex!=0)//lazy hack.
							{
								tex+=0x100;
								draw_image_part(renderer,x1,y1,x2,y2,spr_tileset,d*(tex%win_game_tile_num),d*(tex/win_game_tile_num),d,d);
							}
						}
					}
				}
			}
		}
		//Player.
		draw_image_part(renderer,
			Player.x,Player.y,
			Player.x+d*gw,Player.y+d*gh,
			sprstrip_player,
			(Player.facedir*d*Player.anim_max)+(Player.anim_cur*d*1),0,
			d,d);
		
		//NPC chat box
		if (buttonVis >= 1) 
		{
			// Update the buttonRect using the chat box position and size
			buttonRect.x = globalNpc->x + 60;
			buttonRect.y = globalNpc->y - 120;
			if(buttonRect.x>600)
			{
				//if np is on the right side of the map, place the chat box to the left of them
				buttonRect.x-=200;
				buttonRect.y-=20;
			}
			// Render the filled rectangle using the updated buttonRectPtr
			SDL_SetRenderDrawColor(renderer, 245, 245, 200, 255);//chat box colour
			SDL_RenderFillRect(renderer, buttonRectPtr);

			//Render the lines to make it look chat box-like
			// Draw a line from the player's mouth to the chat box
			SDL_SetRenderDrawColor(renderer, 245, 245, 200, 255);//line colour
			// SDL_RenderDrawLine(renderer, globalNpc->x+45, globalNpc->y-15, buttonRectPtr->x + buttonRectPtr->w*0.1, buttonRectPtr->y + buttonRectPtr->h / 4);//top line
			// SDL_RenderDrawLine(renderer, globalNpc->x+45, globalNpc->y-15, buttonRectPtr->x + buttonRectPtr->w*0.3, buttonRectPtr->y + buttonRectPtr->h / 1);//bottom line
			// Render text on the button (chat box)
			SDL_Color textColor = { 0, 0, 0 }; // black text color
			int maxTextWidth = buttonRectPtr->w - 10; // Adjust this value to leave some padding for the text
			// Use TTF_RenderText_Blended_Wrapped with error-checking
			SDL_Surface* textSurface = TTF_RenderText_Blended_Wrapped(font, buttonText, textColor, maxTextWidth);
			if (!textSurface) 
			{
				// Handle error: Unable to render text

				textSurface = TTF_RenderText_Solid(font, "Error: Text Rendering Failed", textColor);
			}
			// Calculate the actual text dimensions
			int textWidth = textSurface->w;
			int textHeight = textSurface->h;
			// Position the text in the center of the button (chat box)
			int textX = buttonRectPtr->x + (buttonRectPtr->w - textWidth) / 2;
			int textY = buttonRectPtr->y + (buttonRectPtr->h - textHeight) / 2;
			// Create the destination SDL_Rect for the text
			SDL_Rect textRect = { textX, textY, textWidth, textHeight };
			// Render the text on the button (chat box)
			SDL_Texture* textTexture = SDL_CreateTextureFromSurface(renderer, textSurface);
			SDL_RenderCopy(renderer, textTexture, NULL, &textRect);

			// Cleanup
			SDL_FreeSurface(textSurface);
			SDL_DestroyTexture(textTexture);
		}
		// Rendering the global enemy(use for boss fight?? keep code unless decided we do not need.)

		// if (globalEnemy != NULL && globalEnemy->health > 0)
		// {
			
		// 	float directionX = Player.x - globalEnemy->x;
        // 	float directionY = Player.y - globalEnemy->y;
		// 	float distanceToPlayer = distance(Player.x, Player.y, globalEnemy->x, globalEnemy->y);
		// 	//stop the enemy when within the selected units (125)
		// 	if(distanceToPlayer > 110){
		// 		// Normalize the direction vector (make it a unit vector)
		// 		if (distanceToPlayer != 0) {
		// 			directionX /= distanceToPlayer;
		// 			directionY /= distanceToPlayer;
		// 		}
		// 		float enemySpeed = 2.0; //adjust this value to control the enemy's speed
		// 		globalEnemy->x += directionX * enemySpeed;
		// 		globalEnemy->y += directionY * enemySpeed;
		// 	}
		// 	SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
		// 	SDL_Rect enemyRect = { globalEnemy->x, globalEnemy->y, globalEnemy->width, globalEnemy->height };
		// 	// SDL_RenderFillRect(renderer, &enemyRect);
		// 	draw_image(renderer, globalEnemy->x, globalEnemy->y, globalEnemy->x + globalEnemy->width, globalEnemy->y + globalEnemy->height, globalEnemy->texture);
		// 	if (checkCollision(playerHitbox, enemyRect)) {
        //     // If the player collides with the enemy, apply damage to the player
        //     printf("Player collided with enemy!\n");
        //     int enemyDamage = globalEnemy->dmg; // Adjust this value as needed
        //     damageMe(enemyDamage);
		// 	// Bump back the enemy when they run into us
        //     int bumpDistance = 50;
        //     float bumpDirectionX = directionX;
        //     float bumpDirectionY = directionY;
        //     if (distanceToPlayer != 0) {
        //         bumpDirectionX /= distanceToPlayer;
        //         bumpDirectionY /= distanceToPlayer;
        //     }
        //     globalEnemy->x -= bumpDirectionX * bumpDistance;
        //     globalEnemy->y -= bumpDirectionY * bumpDistance;
        // }
		// }
		//for all randomly spawned enemies.
		for (int i = 0; i < MAX_ENEMIES; i++) 
		{
			struct Enemy* currentEnemy = &enemies[i];
			if (currentEnemy->health > 0 && currentEnemy->spawnLevel == level_cur)
			{
				// Enemy movement logic
				float directionX = Player.x - currentEnemy->x;
				float directionY = Player.y - currentEnemy->y;
				float distanceToPlayer = distance(Player.x, Player.y, currentEnemy->x, currentEnemy->y);

				// Stop the enemy when within the selected units (125)
				if (distanceToPlayer > 110) 
				{
					// Normalize the direction vector (make it a unit vector)
					if (distanceToPlayer != 0) 
					{
						directionX /= distanceToPlayer;
						directionY /= distanceToPlayer;
					}
					if(quizOn==false)
					{
						//enemies won't move when quiz is active
						float enemySpeed = 2.0; // Adjust this value to control the enemy's speed
						currentEnemy->x += directionX * enemySpeed;
						currentEnemy->y += directionY * enemySpeed;
					}
				}
				
				// Rendering
				SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
				SDL_Rect enemyRect = { currentEnemy->x, currentEnemy->y, currentEnemy->width, currentEnemy->height };
				draw_image(renderer, currentEnemy->x, currentEnemy->y, currentEnemy->x + currentEnemy->width, currentEnemy->y + currentEnemy->height, currentEnemy->texture);

				// Collision detection with the player
				if (checkCollision(playerHitbox, enemyRect)) 
				{
					// If the player collides with the enemy, apply damage to the player
					printf("Player collided with enemy!\n");
					int enemyDamage = currentEnemy->dmg; // Adjust this value as needed
					damageMe(enemyDamage);

					// Bump back the enemy when they run into the player
					int bumpDistance = 50;
					float bumpDirectionX = directionX;
					float bumpDirectionY = directionY;
					if (distanceToPlayer != 0)
					{
						bumpDirectionX /= distanceToPlayer;
						bumpDirectionY /= distanceToPlayer;
					}
					currentEnemy->x -= bumpDirectionX * bumpDistance;
					currentEnemy->y -= bumpDirectionY * bumpDistance;
				}
			}
		}

		// Resetting the global enemy
		if (globalEnemy != NULL && globalEnemy->health <= 0)
		{
    		resetEnemy(globalEnemy);
		}
		//first quiz. Rename variables for alpha.

		//Second quiz used for testing purposes.
		// if(level_cur==2)
		// {
		// 	if(quiz2Called==false)
		// 	{
		// 		//boolean check so the quiz doesn't open every time they hit level 2.
		// 		quizQuestion="Greetings wanderer\nAnswer my riddle to pass through\n Which of these macronutrients contains the most calories per gram";answerA="1. Carbohydrate";answerB="2. Fat";answerC="3. Protein";
		// 		quiz2Called=true;
		// 		quizOn=true;
		// 		correctAnswer=2;
		// 		Player.move_spd=0;
		// 		quizLoopOn=true;								 
		// 	}
		// }
		//third quiz (currently used for testing, change for real game.) 
		//Quiz turns on once the player enters level_curr==3, for other quizzes just copy this code and change the trigger. 
		if(level_cur==3)
		{
			if(quiz3Called==false && quizTutorChatCompleted==1)
			{
				//boolean check so the quiz doesn't open every time they hit level 3.
				quizQuestion="Answer my riddle to pass through\n Should this quiz work?";answerA="1. yes";answerB="2. no";answerC="3. definitely not";
				quiz3Called=true;	quizOn=true;correctAnswer=1;Player.move_spd=0; quizLoopOn=true; quizInfo="";
			}
		}
		//loop to go through three questions relating to food data. (copy this but replace questions.txt with data from other dataset if we choose.)
		if(quizLoopOn)
		{
			if(quizQNum==1)
			{//if first question
				if(userAnswer==0)
				{
					//keeps it from looping infinite
				}
				else if(userAnswer==correctAnswer)
				{
					quizInfo="Correct";
					updateQuizDataFromRandomLine("questions.txt", &quizQuestion, &answerA, &answerB, &answerC, &userAnswer, &correctAnswer, &quizInfoHolder);quizQNum++;score+=500;
				}
				else
				{
					quizInfo="false";
					updateQuizDataFromRandomLine("questions.txt", &quizQuestion, &answerA, &answerB, &answerC, &userAnswer, &correctAnswer, &quizInfoHolder);quizQNum++;score+=0;
				}
			}
			else if(quizQNum==2)
			{
				//if second question
				if(userAnswer==0)
				{
					
				}
				else if(userAnswer==correctAnswer)
				{
					quizInfo="correct";
					updateQuizDataFromRandomLine("questions.txt", &quizQuestion, &answerA, &answerB, &answerC, &userAnswer, &correctAnswer, &quizInfoHolder);quizQNum++;score+=500;
				}
				else
				{
					quizInfo="false";
					updateQuizDataFromRandomLine("questions.txt", &quizQuestion, &answerA, &answerB, &answerC, &userAnswer, &correctAnswer, &quizInfoHolder);quizQNum++;score+=0;
				}		
			}
			else if(quizQNum==3)
			{
				//if third question
				if(userAnswer==0)
				{
					
				}
				else if(userAnswer==correctAnswer)
				{
					quizInfo="correct";
					updateQuizDataFromRandomLine("questions.txt", &quizQuestion, &answerA, &answerB, &answerC, &userAnswer, &correctAnswer, &quizInfoHolder);quizQNum++;score+=500;
				}
				else
				{
					quizInfo="false";
					updateQuizDataFromRandomLine("questions.txt", &quizQuestion, &answerA, &answerB, &answerC, &userAnswer, &correctAnswer, &quizInfoHolder);quizQNum++;score+=0;
				}		
			}
			//end quiz
			else if(quizQNum=4)
			{
				quizQuestion=" ";
				answerA="press 1 2 or 3 to exit";
				answerB="";
				answerC="";//quiz finished
				if(userAnswer==0)
				{
					
				}
				else if(userAnswer==1||userAnswer==2||userAnswer==3)
				{
					quizOn=false;Player.move_spd=3*4;quizQNum=1;quizInfo="";userAnswer=0;quizLoopOn=false;
				}
			}
		}	
		
		//render the quiz popup
		if (quizOn) 
		{
			// Render the quiz popup with a beige square background
			SDL_Color bgColor = { 200, 200, 200 }; // Beige color
			SDL_SetRenderDrawColor(renderer, bgColor.r, bgColor.g, bgColor.b, 255);
			int popupWidth = 400; // Adjust this value to change the width of the popup
			int popupHeight = 200; // Adjust this value to change the height of the popup
			int popupX = (800 - popupWidth) / 2 + 300; // Center the popup horizontally and move it right by 300 pixels
			int popupY = (600 - popupHeight) / 2;
			SDL_Rect popupRect = { popupX, popupY, popupWidth, popupHeight };
			SDL_RenderFillRect(renderer, &popupRect);

			// Render the quiz header just above the quiz text
			SDL_Color headerColor = { 0, 0, 255 }; // blue header color
			int maxHeaderWidth = popupWidth - 20; // Adjust this value based on your desired maximum header width
			SDL_Surface* headerSurface = TTF_RenderText_Blended_Wrapped(font, quizHeader, headerColor, maxHeaderWidth);
			SDL_Texture* headerTexture = SDL_CreateTextureFromSurface(renderer, headerSurface);
			// Calculate the position to center the header inside the beige square background
			int headerWidth = headerSurface->w;
			int headerHeight = headerSurface->h;
			int headerX = popupX + (popupWidth - headerWidth) / 2;
			int headerY = popupY + 10; // Adjust the value 10 for the vertical position of the header
			// Render the header
			SDL_Rect headerRect = { headerX, headerY, headerWidth, headerHeight };
			SDL_RenderCopy(renderer, headerTexture, NULL, &headerRect);
			// Cleanup
			SDL_FreeSurface(headerSurface);
			SDL_DestroyTexture(headerTexture);

			// Combine quizInfo and quizQuestion into one string separated by newline
			char combinedText[1024];
			snprintf(combinedText, sizeof(combinedText), "\n%s\n%s\n%s\n%s\n%s", quizInfo, quizQuestion, answerA, answerB, answerC);

			// Render the quiz text inside the beige square background
			SDL_Color textColor = { 0, 0, 0 }; // black text color
			int maxTextWidth = popupWidth - 20; // Adjust this value based on your desired maximum text width
			SDL_Surface* textSurface = TTF_RenderText_Blended_Wrapped(font, combinedText, textColor, maxTextWidth);
			if (textSurface == NULL) 
			{
				printf("Error creating text surface: %s\n", TTF_GetError());
				return;
			}

			SDL_Texture* textTexture = SDL_CreateTextureFromSurface(renderer, textSurface);
			if (textTexture == NULL) 
			{
				printf("Error creating text texture: %s\n", SDL_GetError());
				SDL_FreeSurface(textSurface);
				return;
			}

			// Calculate the position to center the text inside the beige square background
			int textWidth = textSurface->w;
			int textHeight = textSurface->h;
			int textX = popupX + (popupWidth - textWidth) / 2;
			int textY = popupY + (popupHeight - textHeight) / 2;
			// Render the text
			SDL_Rect textRect = { textX, textY, textWidth, textHeight };
			SDL_RenderCopy(renderer, textTexture, NULL, &textRect);
			// Cleanup
			SDL_FreeSurface(textSurface);
			SDL_DestroyTexture(textTexture);
		}
		// Draw water particles
		for (int i = 0; i < MAX_WATER_PARTICLES; i++) 
		{
			if (waterParticles[i].active) 
			{
				draw_image(renderer, waterParticles[i].x, waterParticles[i].y, waterParticles[i].x + 5, waterParticles[i].y + 15, spr_water);
			}
		}
		// Draw snow particles
		for (int i = 0; i < MAX_SNOW_PARTICLES; i++) 
		{
			if (snowParticles[i].active) 
			{
				draw_image(renderer, snowParticles[i].x, snowParticles[i].y, snowParticles[i].x + 25, snowParticles[i].y + 25, snowflake);
			}
		}
		//npc stuff
		for (int i = 0; i < MAX_NPCS; i++) 
		{
    		struct NPC* currentNPC = &npcs[i];
			if (currentNPC->appearsOnLevel == level_cur)
			{
				// Rendering
				globalNpc = currentNPC;
				SDL_Rect npcRect = { currentNPC->x, currentNPC->y, currentNPC->width, currentNPC->height };
				SDL_RenderCopy(renderer, currentNPC->texture, NULL, &npcRect);
			}
		}
		if(level_cur==1)
		{
			if(tutorlvl2ChatCompleted==0)
			{
				buttonVis=1;
				strcpy(buttonTexts, "Greetings, press 1 to continue npc dialogue");
			}
			if(nextChat==1)
			{
				strcpy(buttonTexts, "Following the path will provide safety");
			}
			if(nextChat==2)
			{
				strcpy(buttonTexts, "But exploring is more likely to be rewarded..");
			}
			if(nextChat==3)
			{
				buttonVis=0;
				nextChat=0;
				tutorlvl2ChatCompleted=1;
			}
		}
		//tutor on level 16 chat.
		if(level_cur==16)
		{
			if(tutorChatCompleted==0)
			{
				buttonVis=1;
				strcpy(buttonTexts, "Greetings, press 1 to continue npc dialogue");
			}
			if(nextChat==1)
			{
				strcpy(buttonTexts, "Beware for this road is far more treacherous");
			}
			if(nextChat==2)
			{
				strcpy(buttonTexts, "Carry forward at your own risk..");
			}
			if(nextChat==3)
			{
				buttonVis=0;
				nextChat=0;
				tutorChatCompleted=1;
			}
		}
		if(level_cur==110)
		{
			if(penguinSamChatCompleted==0)
			{
				buttonVis=1;
				strcpy(buttonTexts, "Wow, you have made it so far!");
			}
			if(nextChat==1)
			{
				strcpy(buttonTexts, "Walk on further, you are almost done with your journey.");
			}
			if(nextChat==2)
			{
				strcpy(buttonTexts, "Beware though, for Andrew is heard to lurk here...");
			}
			if(nextChat==3)
			{
				buttonVis=0;
				nextChat=0;
				penguinSamChatCompleted=1;
			}
		}
				if(level_cur==160)
		{
			if(forestManChatCompleted==0)
			{
				buttonVis=1;
				strcpy(buttonTexts, "Hello wanderer, are you lost?");
			}
			if(nextChat==1)
			{
				strcpy(buttonTexts, "To the east from here you will seek what you find.");
			}
			if(nextChat==2)
			{
				strcpy(buttonTexts, "Follow the southern peninsula and you will be rewarded greatly.");
			}
			if(nextChat==3)
			{
				buttonVis=0;
				nextChat=0;
				forestManChatCompleted=1;
			}
		}
		if(level_cur==3){
			if(quizTutorChatCompleted==0)
			{
				buttonVis=1;
				strcpy(buttonTexts, "Hello wanderer");
			}
			if(nextChat==1)
			{
				strcpy(buttonTexts, "To learn more about the enemies you will face");
			}
			if(nextChat==2)
			{
				strcpy(buttonTexts, "You must learn about them.. complete quizzes to learn more");
			}
			if(nextChat==3)
			{
				buttonVis=0;
				nextChat=0;
				quizTutorChatCompleted=1;
			}
		}
		/*
		Overlay Drawing.
		*/
		//Splash intro screen.
		if (splashintro_bool)
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
		
		// Clear the renderer
        SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
		// Render the score at the bottom left
        char scoreText[20];
        snprintf(scoreText, sizeof(scoreText), "Score: %d", score);
        SDL_Surface* surface = TTF_RenderText_Solid(font, scoreText, scoreColour);
        SDL_Texture* texture = SDL_CreateTextureFromSurface(renderer, surface);
        SDL_Rect textRect = { 10, 720, surface->w, surface->h };
        SDL_RenderCopy(renderer, texture, NULL, &textRect);
        SDL_FreeSurface(surface);
        SDL_DestroyTexture(texture);
		
		//Render to screen.
		SDL_RenderPresent(renderer);
		SDL_Delay(16);//60 fps.
		
		//End of main loop.
	}
	printf("...exited main loop.\n");

	//Shut down SDL
	free(waterParticles);
	TTF_CloseFont(font);
	SDL_DestroyTexture(spr_grass);
	SDL_DestroyTexture(spr_sand);
	SDL_DestroyTexture(spr_water);
	SDL_DestroyTexture(spr_lava);
	SDL_DestroyTexture(spr_water_shallow);
	SDL_DestroyTexture(spr_lava_shallow);
	SDL_DestroyTexture(spr_tileset);
	SDL_DestroyTexture(spr_map);
	SDL_DestroyTexture(spr_mapicon_unknown);
	SDL_DestroyTexture(sprstrip_player);
	SDL_DestroyTexture(splashintro_img1);
	SDL_DestroyTexture(splashintro_img2);
	SDL_DestroyTexture(splashintro_img3);
	SDL_DestroyTexture(font_ascii);
	SDL_DestroyTexture(spr_clock_digital);
	SDL_DestroyTexture(spr_thermometer);
	SDL_DestroyTexture(spr_hudshade);
	SDL_DestroyTexture(spr_nutrients);
	SDL_DestroyTexture(spr_enemy1);
	IMG_Quit();
	
	//music_free();
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
