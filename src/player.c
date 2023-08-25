#include "everything.h"

void calculateAttackHitbox(struct player* player, SDL_Rect* attackHitbox)
{
    // Calculate the position of the attack hitbox based on player direction
    int attackX = player->x;
    int attackY = player->y;
    // Adjust the position of the attack hitbox based on the player's direction
    if (player->facedir == 1) 
	{
		// Up
        attackY -= player->attackRangeHeight;
    } 
	else if (player->facedir == 0)
	{
		// Right
        attackX += player->attackRangeWidth;
    }
	else if (player->facedir == 3)
	{
		// Down
        attackY += player->attackRangeHeight;
    } 
	else if (player->facedir == 2)
	{
		// Left
        attackX -= player->attackRangeWidth;
    }

    // Set the attack hitbox's position and size
    attackHitbox->x = attackX;
    attackHitbox->y = attackY;
    attackHitbox->w = player->attackRangeWidth;
    attackHitbox->h = player->attackRangeHeight;
}

// Function to perform the player's attack
void attack(struct player* player) 
{
    for (int i = 0; i < MAX_ENEMIES; i++) 
	{
        struct Enemy* currentEnemy = &enemies[i];

        if (currentEnemy->health > 0) 
		{
            // Create a rectangle representing the attack hitbox
            SDL_Rect attackHitbox;
            calculateAttackHitbox(player, &attackHitbox);

            // Create a rectangle representing the enemy hitbox
            SDL_Rect enemyHitbox = { currentEnemy->x, currentEnemy->y, currentEnemy->width, currentEnemy->height };

            // Check for collision with the enemy
            if (checkCollision(attackHitbox, enemyHitbox)) 
			{
                // If the attack hitbox collides with the enemy, apply damage to the enemy
                printf("Hit enemy!\n");
                currentEnemy->health -= player->damage;
            }
        }
    }
}

// Function to render the weapon swing animation
void renderWeaponSwing(SDL_Renderer* renderer, SDL_Texture* weaponTexture, struct player* player)
{
    // Calculate the angle increment per frame
    float angleIncrementPerFrame = ANGLE_INCREMENT;

    // Calculate the initial angle based on the player's facing direction
    float initialAngle = 0.0;
    if (player->facedir == 0)
	{	// Right
        initialAngle = 0.0; // Swing right (right of the player) when facing right
    }
	else if (player->facedir == 1)
	{	// Up
        initialAngle = -90.0; // Swing up (above the player) when facing up
    }
	else if (player->facedir == 2)
	{	// Left
        initialAngle = 180.0; // Swing left (left of the player) when facing left
    }
	else if (player->facedir == 3)
	{	// Down
        initialAngle = 90.0; // Swing down (below the player) when facing down
    }

    // Calculate the center offset for the weapon texture
    int weaponCenterX, weaponCenterY;
    SDL_QueryTexture(weaponTexture, NULL, NULL, &weaponCenterX, &weaponCenterY);
    weaponCenterX /= 2;
    weaponCenterY /= 2;

    // Define the scaling factor to make the weapon smaller
    float scalingFactor = 0.2; // Adjust this value to control the size

    // Define the offset distance from the player for the weapon to appear in front
    int distanceFromPlayer = 20; // Adjust this value to control the distance

    // Render the weapon swing animation
    for (int i = 0; i < NUM_FRAMES; i++) 
	{
        // Calculate the angle for this frame
        float currentAngle = initialAngle + (i * angleIncrementPerFrame);

        // Calculate the position for the weapon's anchor point based on the current angle and facing direction
        int anchorOffsetX = distanceFromPlayer * cosf(currentAngle * M_PI / 180.0);
        int anchorOffsetY = distanceFromPlayer * sinf(currentAngle * M_PI / 180.0);

        // Calculate the scaled size of the weapon texture
        int scaledWidth = weaponCenterX * 2 * scalingFactor;
        int scaledHeight = weaponCenterY * 2 * scalingFactor;

        // Render the weapon texture at the current angle with the anchor offset and scaled size
        SDL_Rect renderRect;
        renderRect.w = scaledWidth;
        renderRect.h = scaledHeight;
        
        // Position the weapon in front of the player (adjust the offsets as needed)
        renderRect.x = player->x - weaponCenterX + anchorOffsetX+120;
		if(player->facedir==0)
		{
			renderRect.x+=20;
			renderRect.y+=5;
		}
        renderRect.y = player->y - weaponCenterY + anchorOffsetY +40;

        SDL_RenderCopyEx(renderer, weaponTexture, NULL, &renderRect, currentAngle, NULL, SDL_FLIP_NONE);

        // Update the screen
        SDL_RenderPresent(renderer);

        // Add a delay to control the animation speed (adjust as needed)
        SDL_Delay(10);
    }
}

void player_movement()
{
	//Player movement.
	
}