/**
* @file enemy.h
* @brief Defines enemy-related behaviour.
*/

#ifndef enemy_h
#define enemy_h

#include "everything.h"

//enemy struct
struct Enemy 
{
    int x;//position x
    int y;//position y
    int width;//hit box stats
    int height;
    int health;
	int dmg;//damage it deals
	int fat;
	int carb;
	int protein;
	int alcohol;
	SDL_Texture* texture;
	int spawnLevel;
	int attackRangeWidth;
    int attackRangeHeight;
	int facedir;
    // Add more enemy-related attributes as needed
};
#define MAX_ENEMIES 250
#define MAX_NPCS 250

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
	int isRanged;
	int destroyed;
	
};

struct NPC npcs[MAX_NPCS];
// Function to initialize an enemy with position and size
void initEnemy(struct Enemy* enemy, int x, int y, int width, int height, int health, int dmg, int fat, int carb, int protein, int alcohol, SDL_Texture* texture,int spawnLevel);
//initialize an npc
void initNPC(struct NPC* npc, int x, int y,int width,int height, int xprevious, int yprevious, uint8_t face_dir, SDL_Texture* texture, int appearsOnLevel);
// add an NPC reference to the npcs array
void addNPC(struct NPC* npc);
// Function to reset an enemy to its default state
void resetEnemy(struct Enemy* enemy) ;
// Function to add an enemy to the array
struct Enemy enemies[MAX_ENEMIES];
void addEnemy(int x, int y, int width, int height, int health, int dmg, int fat, int carb, int protein, int alcohol,SDL_Texture* texture, int level);
void randomSpawnEnemy(int x, int y, int width, int height, int health, int dmg, int fat, int carb, int protein, int alcohol,SDL_Texture* texture, int level);




#endif