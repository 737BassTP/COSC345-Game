/**
* @file unittest.c
* @brief Implements unittest.h
*/

#include <stdio.h>
#include "main.h"
#include "everything.h"

    SDL_Renderer* renderer;
	IMG_Init(IMG_INIT_PNG);

// Custom assertion function
int assert_equal(int expected, int actual, const char *message)
{
    if (expected == actual)
	{
        printf("PASSED: %s\n", message);
		return 0;
    }
	else
	{
        printf("FAILED: %s (Expected: %d, Actual: %d)\n", message, expected, actual);
		return 1;
    }
}

// Test WaterParticles
int test_WaterParticles()
{
	/*
	TODO: Be consistent; is it waterParticle, waterParticles, WaterParticle, or WaterParticles?
	*/
	int ret = 0;
	printf("Testing %i water particles:\n",MAX_WATER_PARTICLES);
    
	//Create some water particles.
	rain_create();
	
	//Deactivate them.
	deactivateAllWaterParticles();
	for (int i = 0; i < MAX_WATER_PARTICLES; i++)
	{
        ret = assert_equal(0, waterParticles[i].active, "deactivate WaterParticles");
    }
	
	//Activate them.
    activateAllWaterParticles();
	printf("Testing %i water particles:\n",MAX_WATER_PARTICLES);
    for (int i = 0; i < MAX_WATER_PARTICLES; i++)
	{
        ret = assert_equal(1, waterParticles[i].active, "activate WaterParticles");
    }
	
	//Clean up and return.
	free(waterParticles);
	return ret;
}
int testHealth()
{
	int ret = 0;
	health = 100;
	damageMe(10);
	ret=assert_equal(90, health, "damageMe 10");
	healMe(10);
	ret=assert_equal(100,health, "healMe 10");
	return ret;
}
int testUpdatePlayerHitbox()
{
	int ret = 0;
	playerHitbox.x = 10;
    playerHitbox.y = 10;
    playerHitbox.w = 100;
    playerHitbox.h = 100;
	updatePlayerHitbox(11, 11, 101, 101);
	if(playerHitbox.x==11 && playerHitbox.y==11 && playerHitbox.w==101 && playerHitbox.h==101)
	{
		printf("Test Passed: updatePlayerHitbox \n");
		ret=0;
	}
	else
	{
		printf("Test Failed: updatePlayerHitbox \n");
		ret=1;
	}
	return ret;
}
int testInitEnemy()
{
	int ret = 0;
	struct Enemy enemy1;
	SDL_Texture *spr_enemy1 = IMG_LoadTexture(renderer,"img/spr_enemy1.png");
	initEnemy(&enemy1, 500, 500, 100, 100, 100, 10, spr_enemy1, 1);
	ret=(enemy1.x!=500);
	ret=(enemy1.y!=500);
	ret=(enemy1.width!=100);
	ret=(enemy1.height!=100);
	ret=(enemy1.dmg!=100);
	ret=(enemy1.spawnLevel!=1);
	if(ret==1)
	{
		printf("Test Failed: testInitEnemy\n");
	}
	else
	{
		printf("Test passed: testInitEnemy\n");
	}
	return ret;
}
int testResetEnemy()
{
	int ret = 0;
	struct Enemy enemy1;
	SDL_Texture *spr_enemy1 = IMG_LoadTexture(renderer,"img/spr_enemy1.png");
	initEnemy(&enemy1, 500, 500, 100, 100, 100, 10, spr_enemy1, 1);
	resetEnemy(&enemy1);
	ret=(enemy1.x!=0);
	ret=(enemy1.y!=0);
	ret=(enemy1.width!=0);
	ret=(enemy1.height!=0);
	ret=(enemy1.dmg!=0);
	if(ret==1)
	{
		printf("Test Failed: resetEnemy\n");
	}
	else
	{
		printf("Test passed: resetEnemy\n");
	}
	return ret;
}
//Perform all unit tests
int unit_test_all()
{
	//Accumulate the number of failed unit tests.
	//If 0, then all unit tests passed.
	
	int acc = 0;
    acc += test_WaterParticles();
	acc += testHealth();
	acc += testUpdatePlayerHitbox();
	acc += testInitEnemy();
	acc += testResetEnemy();
	//acc += ();
    //acc += ();
    //acc += ();
    return acc;
}