#ifndef main_h
#define main_h

#include <stdint.h>

#include "functions.h"

#include "../SDL2/include/SDL2/SDL.h"
#include "../SDL2/include/SDL2/SDL_image.h"
#include "../SDL2/include/SDL2/SDL_ttf.h"

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
	int width;
	int height;
	int xprevious;
	int yprevious;
	byte face_dir;
	SDL_Texture* texture;
	int appearsOnLevel;
};

//rain struct
struct WaterParticle {
    float x;
    float y;
    float speed;
    int active;
};

void initNPC(struct NPC* npc, int x, int y,int width,int height, int xprevious, int yprevious, uint8_t face_dir, SDL_Texture* texture, int appearsOnLevel);
void damageMe(int dmg);
void healMe(int dmg);

void createWaterParticle(int index, int window_width, int window_height);
void activateAllWaterParticles();
void deactivateAllWaterParticles();












#endif