#ifndef game_h
#define game_h

#include "everything.h"





//Position.
struct pos
{
	int x;
	int y;
	int xprevious;
	int yprevious;
};

//rain struct
struct WaterParticle
{
    float x;
    float y;
    float speed;
    int active;
};
//Pushable block.
struct pushblock
{
	int x;
	int y;
	char pushmask;
};

//initialize number of water particles wanted
const int MAX_WATER_PARTICLES;
struct WaterParticle* waterParticles;
int waterOn; //decide if raining or not
int waterSlow;//turn on to have rain fade away instead of turning off instantly
void createWaterParticle(int index, int window_width, int window_height);//function to create water particle.
void activateAllWaterParticles();//function to reactivate water particles
void deactivateAllWaterParticles();//deactivate them all

//Health System test
int health;
int maxHealth;
SDL_Rect playerHitbox;
// Function to update the globalRect's position and size
void updatePlayerHitbox(int x, int y, int width, int height);
void damageMe(int dmg);//damaging test
void healMe(int dmg);//healing test

//Game clock. (HH:MM)
int clock_get_hour(int time);
int clock_get_minute(int time);
int clock_is_between(int time,int h1,int m1,int h2,int m2);

//Temperature.
double temp_ctof(int c);//Celsius to Fahrenheit.

void rain_create();

#endif