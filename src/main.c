/*
COSC345 - Game

Authors: (sorted alphabetically)
	Matthew Yi
	Campbell Nicholas
	Sven Russell
	Thomas Pedersen

SDL2 Documentation:
https://wiki.libsdl.org/SDL2/APIByCategory

*/

/**
* @file main.c
* @brief Implements main.h
*/

#define WEATHERDATA_ENTRIES 80640

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

//Main loop.
int running=1;

//Splash screens.
int splashintro_bool=1;

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
	//!
	//! command line args
	//!
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
	//read weatherdata and save it into an array called records
	FILE *weatherdata = fopen("data/weather_10yrs.csv", "r");
    if (weatherdata == NULL)
	{
        perror("Error opening file");
        return 1;
    }

	char line[MAX_LINE_LENGTH];
    fgets(line, sizeof(line), weatherdata);

    CSVRecord *records = NULL;
	int recordCount = 0;
    int maxRecords = 80642; 
	records = (CSVRecord *)malloc(maxRecords * sizeof(CSVRecord));
	if (records == NULL)
	{
        perror("Memory allocation failed");
        fclose(weatherdata);
        return 1;
    }
    while (fgets(line, sizeof(line), weatherdata))
	{
        char *token;
        char *rest = line;
        int fieldCount = 0;

        while ((token = strtok_r(rest, ",", &rest)) != NULL && fieldCount < 17)
		{
            switch (fieldCount)
			{
                case 1:
                    strncpy(records[recordCount].day, token + 1, sizeof(records[recordCount].day) - 1);
                    break;
                case 2:
                    strncpy(records[recordCount].season, token + 1, sizeof(records[recordCount].season) - 1);
                    break;
                case 3:
                    strncpy(records[recordCount].source_date, token, sizeof(records[recordCount].source_date) - 1);
                    break;
                case 5:
                    records[recordCount].temp = atof(token);
					//strncpy(records[recordCount].temp, token, sizeof(records[recordCount].temp) - 1);
                    break;
                case 6:
                    records[recordCount].rh = atoi(token);
                    break;
                case 7:
                    records[recordCount].windspd = atof(token);
                    break;
                case 8:
                    records[recordCount].windir = atoi(token);
                    break;
                case 9:
                    records[recordCount].global = atof(token);
                    break;
                case 10:
                    records[recordCount].uva = atof(token);
                    break;
                case 11:
                    records[recordCount].uvb = atof(token);
                    break;
                case 12:
                    records[recordCount].visible = atoi(token);
                    break;
                case 13:
                    records[recordCount].rain = atof(token);
                    break;
                case 14:
                    records[recordCount].press = atoi(token);
                    break;
                case 15:
                    records[recordCount].maxgust = atof(token);
                    break;
                case 16:
                    records[recordCount].gustime = atoi(token);
                    break;
            }
            fieldCount++;
        }

        if (fieldCount == 17)
		{
            recordCount++;
            if (recordCount >= maxRecords)
			{
                printf("Warning: Too many records. Increase maxRecords.\n");
                break;
            }
        }
		else
		{
            // Handle the case when not all fields are parsed
            printf("Warning: Skipping record %d due to incomplete data.\n", recordCount + 1);
        }
    }
    printf("Day: %s\n"        , records[0].day[0]         != '\0' ? records[0].day         : "N/A");
    printf("Season: %s\n"     , records[0].season[0]      != '\0' ? records[0].season      : "N/A");
    printf("Source Date: %s\n", records[0].source_date[0] != '\0' ? records[0].source_date : "N/A");
    printf("Temp: %lf\n"      , records[0].temp);//[0]        != '\0' ? records[0].temp        : "N/A");
    printf("RH: %d\n"         , records[0].rh);
	
	//Weather data: Temperature.
	int WeatherData_NumEntries = WEATHERDATA_ENTRIES;
	byte WeatherData_Array_Temperature[WEATHERDATA_ENTRIES];
	char* WeatherData_File_Temperature = "data/weather_temperature.dat";
	FILE *wdfil = fopen(WeatherData_File_Temperature,"rb");
	
	for (int i=0; i<WeatherData_NumEntries; i++)
	{
		WeatherData_Array_Temperature[i] = fgetc(wdfil);
	}
	fclose(wdfil);
	//records = (CSVRecord *)malloc(maxRecords * sizeof(CSVRecord));
	
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
	SDL_Texture *spr_error = IMG_LoadTexture(renderer,"img/spr_error.png");
	SDL_Texture *spr_grass = IMG_LoadTexture(renderer,"img/spr_grass.png");
	SDL_Texture *spr_sand  = IMG_LoadTexture(renderer,"img/spr_sand.png");
	SDL_Texture *spr_water = IMG_LoadTexture(renderer,"img/spr_water_strip16.png");
	SDL_Texture *spr_lava  = IMG_LoadTexture(renderer,"img/spr_lava_strip16.png");
	SDL_Texture *spr_water_shallow = IMG_LoadTexture(renderer,"img/spr_water_shallow_strip16.png");
	SDL_Texture *spr_lava_shallow  = IMG_LoadTexture(renderer,"img/spr_lava_shallow_strip16.png");
	SDL_Texture *spr_tileset = IMG_LoadTexture(renderer,"tiled/tileset.png");
	SDL_Texture *spr_hudshade = IMG_LoadTexture(renderer,"img/hudshade.png");
	SDL_Texture *spr_enemy1 = IMG_LoadTexture(renderer,"img/spr_enemy1.png");
	SDL_Texture *spr_burger = IMG_LoadTexture(renderer,"img/burger.png");
	SDL_Texture *spr_bread = IMG_LoadTexture(renderer,"img/bread.png");
	SDL_Texture *spr_avo = IMG_LoadTexture(renderer,"img/avo.png");
	SDL_Texture *spr_boiledEgg = IMG_LoadTexture(renderer,"img/boiled-egg.png");
	SDL_Texture *spr_carrot = IMG_LoadTexture(renderer,"img/carrot.png");
	SDL_Texture *spr_friedEgg = IMG_LoadTexture(renderer,"img/fried-egg.png");
	SDL_Texture *spr_fries = IMG_LoadTexture(renderer,"img/fries.png");
	SDL_Texture *spr_mushroom = IMG_LoadTexture(renderer,"img/mushroom.png");
	SDL_Texture *spr_pizza = IMG_LoadTexture(renderer,"img/pizza.png");
	SDL_Texture *spr_potato = IMG_LoadTexture(renderer,"img/potato.png");
	SDL_Texture *spr_tomato = IMG_LoadTexture(renderer,"img/tomato.png");

	SDL_Texture *penguinSamImg = IMG_LoadTexture(renderer,"img/sammy.png");
	SDL_Texture *snowflake = IMG_LoadTexture(renderer,"img/snowflake.png");
	//SDL_Texture *spr_ = IMG_LoadTexture(renderer,"img/spr_.png");
	//SDL_Texture *spr_ = IMG_LoadTexture(renderer,"img/spr_.png");
	//Player.
	SDL_Texture *sprstrip_player = IMG_LoadTexture(renderer,"img/player_strip8.png");
	//Text.
	SDL_Texture *font_ascii = IMG_LoadTexture(renderer,"img/ascii_strip96.png");
	int font_ascii_w = 8;
	int font_ascii_h = 24;

	SDL_Texture *enemySprites[] = 
	{
		spr_burger, spr_bread, spr_avo, spr_boiledEgg, spr_carrot,
		spr_friedEgg, spr_fries, spr_mushroom, spr_pizza, spr_potato, spr_tomato
	};//enemy sprites to be used for random spawning.

	int fat[] = {9.6, 2.9, 19.6, 10.5, 0.2, 16.5, 16.9, 0.1, 5.5, 0.1, 0.2};
	int carb[] = {17, 46.6, 0.4, 0.3, 4.6, 0.3, 39.9, 0.1, 25.7, 11.2, 1.2};
	int protein[] = {12.8, 9.4, 1.8, 12.9, 0.9, 13.4, 3, 2.3, 7.3, 1.5, 0.9};
	int alcohol[] = {0,0,0,0,0,0,0,0,0,0,0};
	

	//Clock (digital).
	SDL_Texture *spr_clock_digital = IMG_LoadTexture(renderer,"img/clock1_strip10.png");
	int time_clock_max=1440;
	int time_clock = 0;//range: 0-1439 = 00:00-23:59
	int time_clock_fps=0;//rapidly emulate sub-seconds.
	int time_clock_fps_max=57;//below 60 to accommodate for delays.
	int time_clock_fps_multiplier_dev = 60;//60=(1 in-game-day = 24 IRL-seconds)
	int time_clock_fps_multiplier_release = 3;//3=(1 in-game-day = 8 IRL-minutes); 2=12, 3=8, 4=6, 5=4:48, 6=4, ...
	int time_clock_fps_multiplier=time_clock_fps_multiplier_dev;
	char *timestr_a="Night";
	char *timestr_b="Morning";
	char *timestr_c="Day";
	char *timestr_d="Evening";
	int weekday=0;
	char *weekday_string="MTWTFSS";
	int monthday=0;//4 weeks=28 days.
	char month_str[5];//e.g "21stNULL"
	int year=0;
	
	//Game Level.
	int level_size = sqr(win_game_tile_num);//16*16=256
	int level_realms = 2;//overworld, underworld.
	int level_count = 256*level_realms;
	int level_layers = 2;
	int level_cur=0;//256 = 16*16 
	int level_prev=level_cur;
	byte level_data[262144];//static; can not be free'd.
	//262144 = 256*512*2 (level size * level count * level layers)
	//Objects.
	struct gameobject Objects[256];
	for (int i=0; i<0x100; i++)
	{
		Objects[i].tileid = 0xFF;
		Objects[i].img = spr_error;
		Objects[i].x = (i%16)*16;
		Objects[i].y = (i/16)*16;
		Objects[i].bbox_L = win_game_x + Objects[i].x * gw;
		Objects[i].bbox_T = win_game_y + Objects[i].y * gh;
		Objects[i].bbox_R = Objects[i].bbox_L + 16*gw;
		Objects[i].bbox_B = Objects[i].bbox_T + 16*gh;
	}
	//Load Level.
	int lvl_off_obj=0x20000;
	int lvl_yoff=(int)sqrt(level_count/level_realms);
	level_load(level_data,level_size,level_count,level_layers);
	level_load_objects(level_data,Objects,level_cur,level_size);
	
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
	Player.move_spd_orig = 3*2;
	Player.move_spd = Player.move_spd_orig;
	//damage stats
	Player.attackRangeHeight=50;
	Player.attackRangeWidth=15;
	Player.damage=50;
	Player.width=15;
	Player.height=15;
	// Player.health=100;
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
	struct NPC seanBoss;
	struct NPC campbellBoss;
	struct NPC thomasBoss;
	struct NPC matthewBoss;
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
	initNPC(&seanBoss, 900, 300,150, 150, 400, 400, 2, spr_enemy1, 75);//init protein boss on level 75
	addNPC(&seanBoss); int seanBossChatDone = 0;
	initNPC(&campbellBoss, 900, 300,150, 150, 400, 400, 2, spr_enemy1, 80);//init  boss on level 80
	addNPC(&campbellBoss); int campbellBossChatDone = 0;
	initNPC(&matthewBoss, 900, 300,150, 150, 400, 400, 2, spr_enemy1, 179);//init  boss on level 179 (octagon)
	addNPC(&matthewBoss); int matthewBossChatDone = 0;
	initNPC(&thomasBoss, 900, 300,150, 150, 400, 400, 2, spr_enemy1, 202);//init fat boss at level 202 (sandymount)
	addNPC(&thomasBoss); int thomasBossChatDone = 0;
	//Nutrients.
	SDL_Texture *spr_nutrients = IMG_LoadTexture(renderer,"img/spr_nutrients_strip4.png");
	
	//Audio (Music + SFX).
	audio_init();
	audio_music_play_id(0);
	audio_music_volume((double)0.75);
	
	//Splash intro screen.
	//int splashintro_bool=1;//moved.
	SDL_Texture *splashintro_img1 = IMG_LoadTexture(renderer,"img/logo1a.png");
	SDL_Texture *splashintro_img2 = IMG_LoadTexture(renderer,"img/logo1b.png");
	SDL_Texture *splashintro_img3 = IMG_LoadTexture(renderer,"img/logo1c.png");
	char* splashintro_string = "Press SPACE to continue.";
	char* splashintro_string_copyright = "(C) 2023 - Thomas, Sean, Matthew, Campbell - COSC345";
	int splashintro_slen1=strlen(splashintro_string);
	int splashintro_slen2=strlen(splashintro_string_copyright);
	char* splashintro_txt_option[4];
	splashintro_txt_option[0] = "Continue";
	splashintro_txt_option[1] = "New Game";
	splashintro_txt_option[2] = "Settings";
	splashintro_txt_option[3] = "Exit";
	
	//Splash photo screen.
	int splashphoto_bool=0;
	SDL_Texture *splashphoto_img_signalhill = IMG_LoadTexture(renderer,"img/photo/photographies.png");
	char* splashphoto_str_continue = "Press TAB to continue.";
	//char* splashphoto_str_name = "Signal Hill Lookout";//make changeable.
	char splashphoto_str_name[40] = "Signal Hill Lookout";//make changeable.
	int splashphoto_found=0;
	char* splashphoto_str_found = "Found: 01/32";//make changeable.
	int splashphoto_slen_tab=strlen(splashphoto_str_continue);
	int splashphoto_slen_found=strlen(splashphoto_str_found);
	int splashphoto_slen_name=strlen(splashphoto_str_name);
	byte splashphoto_cur=0;
	int splashphoto_w=455;//todo: auto-detect.
	int splashphoto_h=256;
	int splashphoto_max=32;
	//csv to mem (todo: move to a function).
	FILE* spf = fopen("img/photo/photographies.txt","rb");
	char *splashphoto_names[32];
	char splashphoto_tmp[1024];
	fread(splashphoto_tmp,1024,1,spf);
	char *spd=",";
	char *token;	
	for (int i=0; i<splashphoto_max; i++)
	{
		if (i==0)
		{
			token = strtok(splashphoto_tmp,spd);
		}
		else
		{
			token = strtok(NULL,spd);
		}
		splashphoto_names[i] = token;
	}
	fclose(spf);
	//free(splashphoto_tmp);//only for heap.
	
	FILE *spp=fopen("photoid.dat","rb");
	word splashphoto_ids[32];
	for (int i=0; i<32; i++)
	{
		splashphoto_ids[i] = fgetc(spp)|(fgetc(spp)<<8);
		//printf("ids=%hu\n",splashphoto_ids[i]);
	}
	fclose(spp);
	
	//Splash bustimes screen.
	int splashbustimes_bool=0;
	char splashbustimes_arr[1024];
	char* splashbustimes_route=15;
	char splashbustimes_txt_routename[32];
	char *splashbustimes_infostr="Bus Timetable Fast Travel";
	FILE *sbf = fopen("data/bustimes-15a.dat","rb");
	splashbustimes_route=fgetc(sbf);
	for (int i=0; i<32; i++)
	{
		char b = fgetc(sbf);
		if (b == NULL)
		{
			break;
		}
		splashbustimes_txt_routename[i] = b;
	}
	//unfinished.
	fclose(sbf);
	
	//Help menu.
	int helpmenu_bool=0;
	char* helpmenu_str="Player Controls: Inspect source code.";
	
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

	//Tests.
	//none
	
	//Mainloop here.
	printf("Entering main loop...\n");
	while (running)
	{
		//Update previous key presses.
		keyboard_update_previous();
		
		//Organize SDL Polls.
        keyboard_sdl_polls(event);
		
		/*
		Process inputs.
		*/
		//Help menu.
		if (keyboard_check_pressed(glob_vk_f1))
		{
			helpmenu_bool ^= 1;
		}
		//Development input.
		if (keyboard_check_pressed(glob_vk_f2))
		{
			printf("F2 started!\n");	
			dev_tiled_to_leveldata(level_data);
			level_load_objects(level_data,Objects,level_cur,level_size);
			printf("F2 finished!\n");	
		}
		//Debug input.
		if (keyboard_check_pressed(glob_vk_f3))
		{
			int off=0x96;
			struct gameobject objid = Objects[off];//level 16.
			printf("px=%i\npy=%i\nmean(px)=%i\nmean(py)=%i\nrx1=%i\nry1=%i\nrx2=%i\nry2=%i\n\n",
				Player.x,Player.y,
				mean_int(2,Player.x,Player.x+16*gw),mean_int(2,Player.y,Player.y+16*gh),
				objid.bbox_L,objid.bbox_T,objid.bbox_R,objid.bbox_B);
			
		}
		
		if (keyboard_check_pressed(glob_vk_7))
		{
			attack(&Player);//calls attack function
			renderWeaponSwing(renderer, spr_water, &Player);//renders the swing
		}
		if (keyboard_check_pressed(glob_vk_8))
		{
			enemyAttack(&enemies[0], &Player);
		}
		//Rain toggle.
		if (keyboard_check_pressed(glob_vk_0))
		{
			//turn water on and off for testing
			// waterSlow=1; //testing waterSlow function
			waterOn ^= 1;
			if (waterOn==1)
			{
				activateAllWaterParticles();
				activateAllSnowParticles();
			}
			else
			{
				deactivateAllWaterParticles();
				deactivateAllSnowParticles();
			}
		}
		//Popup window.
		if (keyboard_check_pressed(glob_vk_9))
		{
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
		if (keyboard_check_pressed(glob_vk_1))
		{
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
		if (keyboard_check_pressed(glob_vk_2))
		{
			if(buttonVis==1)
			{
				//functionality to be added
			}
			else if(quizOn)
			{
				userAnswer=2;
			}
		}
		if (keyboard_check_pressed(glob_vk_3))
		{
			if(buttonVis==1)
			{
				//functionality to be added
			}
			else if(quizOn)
			{
				userAnswer=3;
			}
		}
		if (keyboard_check_pressed(glob_vk_4))
		{
			if(buttonVis==1)
			{
				//functionality to be added
			}
		}
		if (keyboard_check_pressed(glob_vk_5))
		{
			damageMe(10);
		}
		if (keyboard_check_pressed(glob_vk_6))
		{
			healMe(10);
		}
		//Debug: Change photograph.
		if (splashphoto_bool)
		{
			if (keyboard_check_pressed(glob_vk_pageup))
			{
				splashphoto_cur = (++splashphoto_cur)%splashphoto_max;
			}
			if (keyboard_check_pressed(glob_vk_pagedown))
			{
				splashphoto_cur = (--splashphoto_cur)%splashphoto_max;
			}
			
			strcpy(splashphoto_str_name,splashphoto_names[splashphoto_cur]);//TODO: Move into a function.
		}
		//Menu input.
		menu_input();
		
		//Show splash photo.
		if (keyboard_check_pressed(glob_vk_tab))
		{
			splashphoto_bool ^= 1;
		}
		//Show bus times.
		if (keyboard_check_pressed(glob_vk_home))
		{
			splashbustimes_bool ^= 1;
		}
		
		//Player movement.
		int mvspd = Player.move_spd;
		int khr,khl,khu,khd;
		khr = keyboard_check(glob_vk_right);
		khl = keyboard_check(glob_vk_left);
		khu = keyboard_check(glob_vk_up);
		khd = keyboard_check(glob_vk_down);
		int khrl,khud,khrlud;
		khrl = khr-khl;
		khud = khd-khu;
		khrlud = ((khrl!=0)|(khud!=0));
		if (khrlud)
		{
			//Facing direction.
			if (khr) {Player.facedir=0;}
			if (khu) {Player.facedir=1;}
			if (khl) {Player.facedir=2;}
			if (khd) {Player.facedir=3;}
			
			//Position.
			if (khrl!=0)
			{
				Player.x += mvspd*khrl;
			}
			if (khud!=0)
			{
				Player.y += mvspd*khud;
			}
			savegame_set_pos((byte)Player.x,(byte)Player.y);
			savegame_set_lvl((word)level_cur);
			
			//Hitbox.
			updatePlayerHitbox(Player.x, Player.y, Player.width, Player.height);
			
			//Object collision.
			for (int i=0; i<256; i++)//can be improved upon.
			{
				if (point_in_rectangle(
					mean_int(2,Player.x,Player.x+win_game_tile_dim*gw),mean_int(2,Player.y,Player.y+win_game_tile_dim*gh),
					Objects[i].bbox_L,Objects[i].bbox_T,Objects[i].bbox_R,Objects[i].bbox_B))
				{
					int objid = Objects[i].tileid;
					//printf("objid=%i\n",objid);
					switch (objid)
					{
						//Door object.
						case 0x116:
						{
							//printf("door\n");
							int door=level_load_door(level_cur,i);
							if (door != 0x1FFFF)
							{
								printf("door (0x%X, 0x%X)\n",door&0x1FF,(door>>9)&0xFF);//lvl,pos
								level_cur = (door&0x1FF);
								level_load_objects(level_data,Objects,level_cur,level_size);
								audio_music_level(level_cur,level_prev);
								//incomplete level load; call a level loading function.
								//todo: stop rain/snow in underworld.
								int npos = (door>>9)&0xFF;
								Player.x = win_game_x + gw*win_game_tile_dim*BGG(npos,4,0);
								Player.y = win_game_y + gh*win_game_tile_dim*BGG(npos,4,1);
								level_prev = level_cur;//important!
								keyboard_reset(glob_vk_left);
								keyboard_reset(glob_vk_right);
								keyboard_reset(glob_vk_up);
								keyboard_reset(glob_vk_down);
							}
							else
							{
								printf("door has no link\n");
								Player.x = Player.xprevious;
								Player.y = Player.yprevious;
							}
						} break;
						//Photograph object.
						case 0x1F:
						{
							//printf("photo\n");
							int sp=-1;
							for (int j=0; j<32; j++)
							{
								word spid=splashphoto_ids[j];
								if ((((int)(spid))&0xFF) == ((int)(level_cur)))
								{
									sp=spid>>8;
									break;
								}
							}
							//printf("sp=%i\n",sp);
							if (sp==-1)
							{
								printf("missing photo id: lvl=%i\n",level_cur);
								break;
							}
							sp%=32;
							Player.x = Player.xprevious;
							Player.y = Player.yprevious;
							splashphoto_bool=1;
							splashphoto_cur=sp;
							strcpy(splashphoto_str_name,splashphoto_names[splashphoto_cur]);//TODO: Move into a function.
						} break;
						default:
						{
							
						}
					}
					
				}
			}
			
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
				int randomIndex = rand() % (sizeof(enemySprites) / sizeof(enemySprites[0]));
				
				SDL_Texture *enemyTexture = enemySprites[randomIndex];

				randomSpawnEnemy(500, 500, 100, 100, 100, 10, fat[randomIndex], carb[randomIndex], protein[randomIndex], alcohol[randomIndex],enemyTexture, level_cur);//random spawn an enemy with these stats
				buttonVis=0;//remove npc chatbox if you walk away
				
				level_cur += level_count;//allows negative wrap.
				level_cur %= level_count;//prevents overflow.
				printf("lvl=%i\n",level_cur);
				level_get_name(level_cur,mapstr_location);
				level_load_objects(level_data,Objects,level_cur,level_size);
				mapvisit[level_cur/32] |= (Uint32)(1<<level_cur%32);
				audio_music_level(level_cur,level_prev);
				
				level_prev = level_cur;//finished handling level loading.
			}
		}
		else
		{
			Player.anim_spd_cur = 0;
			Player.anim_cur = 0;
		}

		/*
		Post-update of inputs.
		*/
		//If buggy, move to before updating inputs.
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
		year += ((monthday==27) && (weekday==6) && (time_clock==(time_clock_max-1)));
		monthday = (monthday+(time_clock>=time_clock_max))%28;
		time_clock %= time_clock_max;
		time_clock_fps %= time_clock_fps_max;
		
		//Temperature.
		int temp_off = 2*((time_clock % time_clock_max) + (time_clock_max * monthday) + (year%2));
		temp_cur = (int)WeatherData_Array_Temperature[temp_off];
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
				draw_image_part(renderer,uix,uiy+nx,uix+nd*gw,uiy+nx+nd*gh,spr_nutrients,i*nd,0,nd,nd);
				draw_text_color(renderer,uix+nd*gw,uiy+nx+nd/2,font_ascii_w*gw,font_ascii_h*gh,font_ascii,mux_str(i,"Fat","Carbs","Protein","Alcohol"),font_ascii_w,font_ascii_h,tc);
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
			draw_text_color(renderer,
				uix,uiy,
				font_ascii_w*gw,font_ascii_h*gh,
				font_ascii,mux_str(ct,timestr_a,timestr_b,timestr_c,timestr_d),
				font_ascii_w,font_ascii_h,tc);
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
			//if (k!=0) {break;}
			for (int j=0; j<win_game_tile_num; j++)
			{
				for (int i=0; i<win_game_tile_num; i++)
				{
					int ij = i+j*win_game_tile_num;
					int ijk = ij+k*lvl_off_obj;
					int x1,y1,x2,y2;
					x1 = win_game_x + (i+0)*gw*win_game_tile_dim;
					y1 = win_game_y + (j+0)*gh*win_game_tile_dim;
					x2 = win_game_x + (i+1)*gw*win_game_tile_dim;
					y2 = win_game_y + (j+1)*gh*win_game_tile_dim;
					
					int off = ijk + level_size*level_cur;
					int tex = level_data[off];
					if (k==0)
					{
						int defcol = mux_int(ij%3,c_red,c_green,c_blue);
						draw_rectangle_color(renderer,x1,y1,x2,y2,defcol);//will show if image drawing below fails.
						draw_image_part(renderer,x1,y1,x2,y2,spr_tileset,d*(tex%win_game_tile_num),d*(tex/win_game_tile_num),d,d);
					}
					else if (k==1)
					{
						//animated
						if ((tex>=0x10) && (tex <=0x13))
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
						/*
						else
						{
							if ((tex!=0) && (tex!=0xFF))//lazy hack.
							{
								tex+=0x100;
								draw_image_part(renderer,x1,y1,x2,y2,spr_tileset,d*(tex%win_game_tile_num),d*(tex/win_game_tile_num),d,d);
							}
						}
						/**/
						//Static object.
						int oti=Objects[ij].tileid;
						int skipoti=0;
						skipoti |= (oti == 0xFF);//undefined object.
						skipoti |= ((oti >= 0x10) && (oti <= 0x13));//animated water/lava
						if (!skipoti)
						{
							oti += 0x100*(oti<0x100);
							draw_image_part(renderer,
								x1,//win_game_x+Objects[ij].bbox_L,
								y1,//win_game_y+Objects[ij].bbox_T,
								x2,//win_game_x+Objects[ij].bbox_R,
								y2,//win_game_y+Objects[ij].bbox_B,
								spr_tileset,d*(oti%win_game_tile_num),d*(oti/win_game_tile_num),d,d);
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
					    // Calculate the angle in radians
					
					if(quizOn==false)
					{
						//enemies won't move when quiz is active
						float enemySpeed = 2.0; // Adjust this value to control the enemy's speed
						currentEnemy->x += directionX * enemySpeed;
						currentEnemy->y += directionY * enemySpeed;
					}
				}
				float angle = atan2(directionY, directionX);

					// Convert the angle to degrees
					float degrees = angle * (180.0 / M_PI);

					// Determine the enemy's facedir based on the angle
					if (degrees >= -45 && degrees < 45)
					{
						// Right
						currentEnemy->facedir = 0;
					} else if (degrees >= 45 && degrees < 135)
					{
						// Up
						currentEnemy->facedir = 1;
					} else if ((degrees >= 135 && degrees <= 180) || (degrees >= -180 && degrees < -135))
					{
						// Left
						currentEnemy->facedir = 2;
					}
					else
					{
						// Down
						currentEnemy->facedir = 3;
					}
				// Rendering
				SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
				SDL_Rect enemyRect = { currentEnemy->x-5, currentEnemy->y-5, currentEnemy->width+5, currentEnemy->height+5 };
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
					audio_sfx_play_id(0,0);//explosion sound.
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
					quizOn=false;Player.move_spd=Player.move_spd_orig;quizQNum=1;quizInfo="";userAnswer=0;quizLoopOn=false;
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
			if (waterParticles[i].active) {
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
		//npc rendering stuff
		for (int i = 0; i < MAX_NPCS; i++)
		{
			struct NPC* currentNPC = &npcs[i];
			if (currentNPC->appearsOnLevel == level_cur && currentNPC->destroyed!=1)
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
		if(level_cur==3)
		{
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
		if(level_cur==75)
		{
			if(seanBossChatDone==0)
			{
				buttonVis=1;
				strcpy(buttonTexts, "Greetings fool");
			}
			if(nextChat==1)
			{
				strcpy(buttonTexts, "I am Sean");
			}
			if(nextChat==2)
			{
				strcpy(buttonTexts, "You think you can face me? you are mistaken.");
			}
			if(nextChat==3)
			{
				buttonVis=0;
				nextChat=0;
				seanBossChatDone=1;
				addEnemy(900, 300, 150, 150, 400, 10, 0,0,200,0, spr_enemy1,75);
				seanBoss.destroyed=1;
				globalNpc->destroyed=1;
			}
		}
		if(level_cur==80)
		{
			if(campbellBossChatDone==0)
			{
				buttonVis=1;
				strcpy(buttonTexts, "You have finally found me");
			}
			if(nextChat==1)
			{
				strcpy(buttonTexts, "I am Campbell");
			}
			if(nextChat==2)
			{
				strcpy(buttonTexts, "Prepare to face your doom");
			}
			if(nextChat==3)
			{
				buttonVis=0;
				nextChat=0;
				campbellBossChatDone=1;
				addEnemy(900, 300, 150, 150, 400, 10, 0,0,200,0, spr_enemy1,80);
				campbellBoss.destroyed=1;
				globalNpc->destroyed=1;
			}
		}
		if(level_cur==179)
		{
			if(matthewBossChatDone==0)
			{
				buttonVis=1;
				strcpy(buttonTexts, "What a surprise");
			}
			if(nextChat==1)
			{
				strcpy(buttonTexts, "I am Matthew");
			}
			if(nextChat==2)
			{
				strcpy(buttonTexts, "it is too late to run");
			}
			if(nextChat==3)
			{
				buttonVis=0;
				nextChat=0;
				matthewBossChatDone=1;
				addEnemy(900, 300, 150, 150, 400, 10, 0,0,200,0, spr_enemy1,179);
				matthewBoss.destroyed=1;
				globalNpc->destroyed=1;
			}
		}
		if(level_cur==202)
		{
			if(thomasBossChatDone==0)
			{
				buttonVis=1;
				strcpy(buttonTexts, "What a surprise");
			}
			if(nextChat==1)
			{
				strcpy(buttonTexts, "I am Thomas");
			}
			if(nextChat==2)
			{
				strcpy(buttonTexts, "sorry to have to do this to you.");
			}
			if(nextChat==3)
			{
				buttonVis=0;
				nextChat=0;
				thomasBossChatDone=1;
				addEnemy(900, 300, 150, 150, 400, 10, 0,0,200,0, spr_enemy1,202);
				thomasBoss.destroyed=1;
				globalNpc->destroyed=1;
			}
		}
		/*
		Overlay Drawing.
		*/
		//Splash bustimes screen.
		if (splashbustimes_bool)
		{
			draw_rectangle_color(renderer,0,0,screen_w,screen_h,c_black);
			int xx,yy;
			xx=0;
			yy=0;
			draw_text_color(renderer,xx,yy,font_ascii_w*gw,font_ascii_h*gh,font_ascii,splashbustimes_infostr,font_ascii_w,font_ascii_h,c_green);
			yy += gh*font_ascii_h*2;
			draw_text_color(renderer,xx,yy,font_ascii_w*gw,font_ascii_h*gh,font_ascii,splashbustimes_txt_routename,font_ascii_w,font_ascii_h,c_green);
			
		}
		
		//Splash photo screen.
		if (splashphoto_bool)
		{
			//draw_image(renderer,0,0,screen_w,screen_h,splashphoto_img_signalhill);
			draw_image_part(renderer,0,0,screen_w,screen_h,splashphoto_img_signalhill,
				splashphoto_w*(splashphoto_cur%4),splashphoto_h*(splashphoto_cur/4),splashphoto_w,splashphoto_h);
			int xx,yy;
			//Press TAB to continue.
			int timer=(int)get_timer();
			if (timer/60%8>=4)
			{
				xx=384;
				yy=screen_h-font_ascii_h*gh;
				draw_text_color(renderer,xx,yy,font_ascii_w*gw,font_ascii_h*gh,font_ascii,splashphoto_str_continue,font_ascii_w,font_ascii_h,c_yellow);
			}
			//Location name.
			xx=gw;
			yy=gh;
			draw_rectangle_color(renderer,xx,yy,xx+gw*font_ascii_w*strlen(splashphoto_str_name),yy+gh*font_ascii_h,0);
			draw_text_color(renderer,xx,yy,font_ascii_w*gw,font_ascii_h*gh,font_ascii,splashphoto_str_name,font_ascii_w,font_ascii_h,c_yellow);
			//Found locations.
			xx=screen_w-splashphoto_slen_found*font_ascii_w*gw;
			yy=0;
			draw_rectangle_color(renderer,xx,yy,xx+gw*font_ascii_w*strlen(splashphoto_str_found),yy+gh*font_ascii_h,0);
			draw_text_color(renderer,xx,yy,font_ascii_w*gw,font_ascii_h*gh,font_ascii,splashphoto_str_found,font_ascii_w,font_ascii_h,c_yellow);
		}
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
			//Options.
			for (int i=0; i<menucursor_max; i++)
			{
				int tv = (i==menucursor_cur);
				int cc = (tv)?(c_green):(c_orange);
				int yo = (tv)?(font_ascii_h*gh):(0);
				draw_text_color(renderer,(int)lerp((double)0,(double)screen_w,(double)(i+0.5)/menucursor_max),(int)(screen_h/1.5)+yo,font_ascii_w*gw,font_ascii_h*gh,font_ascii,splashintro_txt_option[i],font_ascii_w,font_ascii_h,cc);
				
			}
		}

		//Help menu.
		if (helpmenu_bool)
		{
			draw_rectangle_color(renderer,0,0,screen_w,screen_h,c_black);
			int xx,yy;
			xx=0;
			yy=0;
			draw_text_color(renderer,xx,yy,font_ascii_w*gw,font_ascii_h*gh,font_ascii,helpmenu_str,font_ascii_w,font_ascii_h,c_red);
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
	
	//Save progress.
	savegame_save();

	//Shut down SDL
	free(waterParticles);
	TTF_CloseFont(font);
	SDL_DestroyTexture(spr_error);
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
	SDL_DestroyTexture(splashphoto_img_signalhill);
	SDL_DestroyTexture(font_ascii);
	SDL_DestroyTexture(spr_clock_digital);
	SDL_DestroyTexture(spr_thermometer);
	SDL_DestroyTexture(spr_hudshade);
	SDL_DestroyTexture(spr_nutrients);
	SDL_DestroyTexture(spr_enemy1);
	
	SDL_DestroyTexture(spr_burger);
	SDL_DestroyTexture(spr_bread);
	SDL_DestroyTexture(spr_avo);
	SDL_DestroyTexture(spr_boiledEgg);
	SDL_DestroyTexture(spr_carrot);
	SDL_DestroyTexture(spr_friedEgg);
	SDL_DestroyTexture(spr_fries);
	SDL_DestroyTexture(spr_mushroom);
	SDL_DestroyTexture(spr_pizza);
	SDL_DestroyTexture(spr_potato);
	SDL_DestroyTexture(spr_tomato);
	IMG_Quit();
	
	audio_free();
	//SDL_FreeWAV(&audio_spec);
	//SDL_CloseAudioDevice(deviceid);
    //SDL_FreeWAV(wavbuffer);
	
	SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
	fclose(weatherdata);
	free(records);
    //Wait n milliseconds jic something went wrong (so that printfs can be read)
    SDL_Delay(500);
    	
	return 0;
	
    /* Upon an error, print message and quit properly */
error:
    fprintf(stderr, "%s Error returned: %s\n", errmsg, SDL_GetError());
    SDL_Quit();
    exit(EXIT_FAILURE);
}
