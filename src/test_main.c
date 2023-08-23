#include <stdio.h>
#include "main.h"
#include "everything.h"

// Custom assertion function
void assert_equal(int expected, int actual, const char *message) {
    if (expected == actual) {
        printf("PASSED: %s\n", message);
    } else {
        printf("FAILED: %s (Expected: %d, Actual: %d)\n", message, expected, actual);
    }
}

// Test activateAllWaterParticles function
void test_activateAllWaterParticles() {
    activateAllWaterParticles();

    for (int i = 0; i < MAX_WATER_PARTICLES; i++) {
        assert_equal(1, waterParticles[i].active, "activateAllWaterParticles test");
    }
}
int main_test() { // Use a unique name for your test main function
    test_activateAllWaterParticles();
    return 0;
}