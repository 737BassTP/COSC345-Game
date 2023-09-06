/**
* @file enemy.c
* @brief Implements enemy.h
*/

#include "everything.h"


//struct NPC npcs[MAX_NPCS];
// Function to initialize an enemy with position and size
void initEnemy(struct Enemy* enemy, int x, int y, int width, int height, int health, int dmg, int fat, int carb, int protein, int alcohol, SDL_Texture* texture,int spawnLevel)
{
    enemy->x = x;
    enemy->y = y;
    enemy->width = width;
    enemy->height = height;
    enemy->health = health;
    enemy->dmg = dmg;
    enemy->fat = fat;
    enemy->carb = carb;
    enemy->protein = protein;
    enemy->alcohol = alcohol;
	enemy->texture = texture;
	enemy->spawnLevel = spawnLevel;
}
//initialize an npc
void initNPC(struct NPC* npc, int x, int y,int width,int height, int xprevious, int yprevious, uint8_t face_dir, SDL_Texture* texture, int appearsOnLevel)
{
    npc->x = x;
    npc->y = y;
	npc->width = width;
	npc->height = height;
    npc->xprevious = xprevious;
    npc->yprevious = yprevious;
    npc->face_dir = face_dir;
    npc->texture = texture;
    npc->appearsOnLevel = appearsOnLevel;
}
// add an NPC reference to the npcs array
void addNPC(struct NPC* npc) 
{
    for (int i = 0; i < MAX_NPCS; i++) 
	{
        struct NPC* currentNPC = &npcs[i];
        if (currentNPC->appearsOnLevel <= 0)
		{
            *currentNPC = *npc; // Copy the contents of the passed NPC to the array
            return;
        }
    }
}
// Function to reset an enemy to its default state
void resetEnemy(struct Enemy* enemy)
{
    enemy->x = 0;
    enemy->y = 0;
    enemy->width = 0;
    enemy->height = 0;
    enemy->health = 0;
    enemy->dmg = 0;
    // Add other attributes reset if needed
}
// Function to add an enemy to the array
//struct Enemy enemies[MAX_ENEMIES];

void addEnemy(int x, int y, int width, int height, int health, int dmg, int fat, int carb, int protein, int alcohol, SDL_Texture* texture, int level)
{
    for (int i = 0; i < MAX_ENEMIES; i++)
	{
        struct Enemy* currentEnemy = &enemies[i];
        if (currentEnemy->health <= 0)
		{
            initEnemy(currentEnemy, x, y, width, height, health, dmg, fat, carb, protein, alcohol, texture, level);
            return; // Exit the function after adding the enemy
        }
    }
    // If all slots are filled, you can handle this case as needed (e.g., ignore or overwrite)
}
void randomSpawnEnemy(int x, int y, int width, int height, int health, int dmg, int fat, int carb, int protein, int alcohol, SDL_Texture* texture, int level)
{
	int spawnChance = 25; //25% chance of enemy spawning
	srand((unsigned int)time(NULL));
	int randomValue = rand() % 100;
	if(randomValue<spawnChance)
	{
		addEnemy(x, y, width, height, health, dmg, fat, carb, protein, alcohol, texture, level);//size, stats and image to go with it.
	}
}