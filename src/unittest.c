#include <stdio.h>
#include "main.h"
#include "everything.h"

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
//Perform all unit tests
int unit_test_all()
{
	//Accumulate the number of failed unit tests.
	//If 0, then all unit tests passed.
	
	int acc = 0;
    acc += test_WaterParticles();
	//acc += ();
    //acc += ();
    //acc += ();
    return acc;
}