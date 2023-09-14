/**
* @file unittest.c
* @brief Implements unittest.h
*/

#include <stdio.h>
#include "main.h"
#include "everything.h"

    SDL_Renderer* renderer;
	IMG_Init(IMG_INIT_PNG);
// Mock enemy struct

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

struct player* setupPlayer(int x, int y, int facedir, int attackRangeWidth, int attackRangeHeight) {
    struct player* player = (struct player*)malloc(sizeof(struct player));
    player->x = x;
    player->y = y;
    player->facedir = facedir;
    player->attackRangeWidth = attackRangeWidth;
    player->attackRangeHeight = attackRangeHeight;
    return player;
}
int testResetEnemy(){
	int ret = 0;
	struct Enemy enemy1;
	SDL_Texture *spr_enemy1 = IMG_LoadTexture(renderer,"img/spr_enemy1.png");
	initEnemy(&enemy1, 500, 500, 100, 100, 100, 10, 10, 10, 10, 10, spr_enemy1, 1);
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
int calculateAttackHitboxTest() {
	int ret = 0;
    struct player* player = setupPlayer(100, 100, 0, 20, 30);
    SDL_Rect attackHitbox;

    calculateAttackHitbox(player, &attackHitbox);

    // Check the values of attackHitbox based on the input player
    ret += assert_equal(120, attackHitbox.x, "AttackHitbox x-coordinate");
    ret += assert_equal(100, attackHitbox.y, "AttackHitbox y-coordinate");
    ret += assert_equal(30, attackHitbox.w, "AttackHitbox width");
    ret += assert_equal(40, attackHitbox.h, "AttackHitbox height");

    // Free the allocated player struct
    free(player);

    return ret;
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
	initEnemy(&enemy1, 500, 500, 100, 100, 100, 10,10,10,10,10, spr_enemy1, 1);
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
//needs work.
int test_attack() {
    int ret = 0;

    // Mock a player object
    struct player player;
    memset(&player, 0, sizeof(player));
    player.facedir = 0;  // Set player's facedir to test different directions
    player.damage = 5;
    player.move_spd = 10;

    // Initialize the global array of enemies
    struct Enemy enemies[MAX_ENEMIES];
    memset(enemies, 0, sizeof(enemies));

    // Initialize an enemy at a specific position
    enemies[0].x = 110;
    enemies[0].y = 100;
    enemies[0].width = 10;
    enemies[0].height = 10;
    enemies[0].health = 10;

    // Call the attack function
    attack(&player);

    // Assert that the enemy was hit, pushed, and damaged correctly
    ret += assert_equal(210, enemies[0].x, "Enemy X-coordinate after attack");
    ret += assert_equal(100, enemies[0].y, "Enemy Y-coordinate after attack");
    ret += assert_equal(5, enemies[0].health, "Enemy health after attack");

    return ret;
}
int test_clock_get_hour() {
	int ret = 0;
    // Test case 1: Test with a time of 90 minutes (1 hour and 30 minutes)
    int result1 = clock_get_hour(90);
    ret += assert_equal(1, result1, "Test case 1");

    // Test case 2: Test with a time of 150 minutes (2 hours and 30 minutes)
    int result2 = clock_get_hour(150);
    ret += assert_equal(2, result2, "Test case 2");


	return ret;
}
int test_clock_get_minute() {
	int ret = 0;
    int result1 = clock_get_minute(90);
    ret += assert_equal(30, result1, "Test case 1");

    int result2 = clock_get_minute(150);
    ret += assert_equal(30, result2,  "Test case 2");

return ret;
}
int test_clock_is_between() {
	int ret = 0;
    // Test case 1: Time is between 8:30 AM and 4:45 PM
    int result1 = clock_is_between(930, 8, 30, 16, 45);
    ret += assert_equal(1, result1, "Test case 1");

    // Test case 2: Time is not between 2:00 AM and 6:00 AM
    int result2 = clock_is_between(100, 2, 0, 6, 0);
    ret += assert_equal(0, result2, "Test case 2");


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
	acc += calculateAttackHitboxTest();
	acc += test_attack();//needs work
	acc += test_clock_get_hour();
	acc+= test_clock_get_minute();
	acc += test_clock_is_between();
	//acc += ();
    //acc += ();
    //acc += ();
    return acc;
}