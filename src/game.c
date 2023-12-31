/**
* @file game.c
* @brief Implements game.h
*/

#include "everything.h"

//initialize number of water particles wanted
const int MAX_WATER_PARTICLES = 100;
const int MAX_SNOW_PARTICLES = 100;

struct WaterParticle* waterParticles;
struct SnowParticle* snowParticles;
int waterOn = 0; //decide if raining or not
int waterSlow = 0;//turn on to have rain fade away instead of turning off instantly
//function to create water particle.
void createWaterParticle(int index, int window_width, int window_height)
{
    waterParticles[index].x = rand() % (screen_w-596)+298;     // Random x position within window width
    waterParticles[index].y = -(rand() % window_height); // Random initial y position above the window
    waterParticles[index].speed = 10;        // Rain speed
    waterParticles[index].active = 1;                    // Set active to 1 (true)
}
// Function to initialize a snow particle
void createSnowParticle(int index, int window_width, int window_height)
{
    snowParticles[index].x = rand() % (screen_w-596)+298;  
    snowParticles[index].y = -(rand() % window_height); // Start above the screen
    snowParticles[index].speed = 5;    // Adjust the falling speed as needed
    snowParticles[index].active = 1;               // Set active to 1 (true)
}
//function to reactivate water particles
void activateAllWaterParticles()
{
    for (int i = 0; i < MAX_WATER_PARTICLES; i++)
	{
        waterParticles[i].active = 1; // Set active to 1 (true)
    }
}
//function to reactivate snow particles
void activateAllSnowParticles()
{
    for (int i = 0; i < MAX_SNOW_PARTICLES; i++)
	{
        snowParticles[i].active = 1; // Set active to 1 (true)
    }
}
//deactivate them all
void deactivateAllWaterParticles()
{
    for (int i = 0; i < MAX_WATER_PARTICLES; i++)
	{
        waterParticles[i].active = 0; // Set active to 0 (false)
    }
}
//deactivate them all
void deactivateAllSnowParticles()
{
    for (int i = 0; i < MAX_SNOW_PARTICLES; i++)
	{
        snowParticles[i].active = 0; // Set active to 0 (false)
    }
}


//Health System test
int maxHealth=100;
int minHealth=0;
int health = 100;//todo: remove hard-coding of this value.
SDL_Rect playerHitbox;
// Function to update the globalRect's position and size
void updatePlayerHitbox(int x, int y, int width, int height)
{
    playerHitbox.x = x;
    playerHitbox.y = y;
    playerHitbox.w = width;
    playerHitbox.h = height;
}
//damaging test
void damageMe(int dmg)
{
	if(health-dmg<=minHealth)
	{
		health=minHealth;
		audio_sfx_play_id(1,1);//player died.
	}
	else
	{
		health -= dmg;
	}
}
//healing test
void healMe(int dmg)
{
	if(health+dmg>=maxHealth)
	{
		health=maxHealth;
	}
	else
	{
		health += dmg;
	}
}

//Game clock. (HH:MM)
int clock_get_hour(int time)
{
	return (time/60)%24;
}
int clock_get_minute(int time)
{
	return time%60;
}
int clock_is_between(int time,int h1,int m1,int h2,int m2)
{
	int c1,c2;
	c1 = (h1%24)*60 + m1%60;
	c2 = (h2%24)*60 + m2%60;
	return ((time>=c1) && (time<=c2));
}
//Temperature.
double temp_ctof(int c)
{
	//Celsius to Fahrenheit.
	return (double)c * 1.8 + 32.0;
}

void rain_create()
{
	//rain
    // Allocate memory for water particles
    waterParticles = malloc(MAX_WATER_PARTICLES * sizeof(struct WaterParticle));
    if (waterParticles == NULL)
	{
        // Handle allocation failure
        fprintf(stderr, "Failed to allocate memory for water particles\n");
        return 1;
    }
    // Initialize water particles
    for (int i = 0; i < MAX_WATER_PARTICLES; i++)
	{
        createWaterParticle(i, screen_w, screen_h);
    }
}
void snow_create()
{
	//rain
    // Allocate memory for water particles
    snowParticles = malloc(MAX_SNOW_PARTICLES * sizeof(struct SnowParticle));
    if (snowParticles == NULL)
	{
        // Handle allocation failure
        fprintf(stderr, "Failed to allocate memory for snow particles\n");
        return 1;
    }
    // Initialize water particles
    for (int i = 0; i < MAX_SNOW_PARTICLES; i++)
	{
        createWaterParticle(i, screen_w, screen_h);
    }
}

//Bus (fast travel)
void bus_show_timetable(int lvl)
{
	
}

//Signposts.
int signpost_bool=0;
byte signpost_txt[256];
void signpost_load(int id)
{
	if (!signpost_bool)
	{
		FILE *sf=fopen("signpost.dat","rb");
		while (id)
		{
			int c=fgetc(sf);
			if (c == NULL) {id--;}
		}
		int i=0;
		while (1)
		{
			int c=fgetc(sf);
			signpost_txt[i]=(byte)c;
			if (c==NULL) {break;}
			i++;
		}
		fclose(sf);
		//Default message.
		if (i==0)
		{
			signpost_load(0);
			return;
		}
		signpost_bool=1;
		//printf("signpost:\n%s\n",signpost_txt);
	}
}
void signpost_draw()
{
	if (signpost_bool)
	{
		int xx,yy,ww,hh;
		xx=win_game_x;
		yy=screen_h-gh*font_ascii_h*2;
		ww=gw*font_ascii_w*min_int(2,32,strlen(signpost_txt));
		hh=gh*font_ascii_h*2;
		draw_rectangle_color(renderer,xx,yy,xx+ww,yy+hh,c_black);
		draw_text_color(renderer,xx,yy,font_ascii_w*gw,font_ascii_h*gh,font_ascii,signpost_txt,font_ascii_w,font_ascii_h,c_white);
		
		if (keyboard_check_anykey())
		{
			signpost_bool=0;
			//printf("closed signpost.\n");
		}
	}
}