/**
* @file player.c
* @brief Implements player.h
*/

#include "everything.h"
struct player Player;
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
    attackHitbox->w = player->attackRangeWidth+10;
    attackHitbox->h = player->attackRangeHeight+10;
}
void calculateEnemyAttackHitbox(struct Enemy* enemy, SDL_Rect* attackHitbox)
{
    // Calculate the position of the attack hitbox based on enemy direction
    int attackX = enemy->x;
    int attackY = enemy->y;

    // Set the size of the attack hitbox
    attackHitbox->w = 50; // Width of the attack hitbox
    attackHitbox->h = 50; // Height of the attack hitbox

    // Adjust the position of the attack hitbox based on the enemy's direction
    switch (enemy->facedir)
    {
        case 1: // Up
            attackY -= attackHitbox->h;
            break;
        case 0: // Right
            attackX += enemy->width;
            break;
        case 3: // Down
            attackY += enemy->height;
            break;
        case 2: // Left
            attackX -= attackHitbox->w;
            break;
        // Add more cases if needed for other directions
    }

    // Set the attack hitbox's position
    attackHitbox->x = attackX;
    attackHitbox->y = attackY;
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
                // Calculate the direction to push the enemy based on the player's facedir
                int pushDirectionX = 0;
                int pushDirectionY = 0;

                switch (player->facedir) 
                {
                    case 0: // Right
                        pushDirectionX = 1;
                        break;
                    case 1: // Up
                        pushDirectionY = -1;
                        break;
                    case 2: // Left
                        pushDirectionX = -1;
                        break;
                    case 3: // Down
                        pushDirectionY = 1;
                        break;
                }

                // Apply the push to the enemy's position
                currentEnemy->x += pushDirectionX * 100; //distance the enemy gets pushed (change if you think it is too much)
                currentEnemy->y += pushDirectionY * 100;

                // Apply damage to the enemy
                printf("Hit enemy!\n");
                currentEnemy->health -= player->damage;

                // When the enemy dies, increase player's stats
                if (currentEnemy->health <= 0) 
                {
                    printf("Killed enemy!\n");

                    // Protein --> damage
                    printf("Player damage increased from %d", player->damage);
                    player->damage += currentEnemy->protein;
                    printf(" to %d\n", player->damage);

                    // Fat --> heal
                    healMe(currentEnemy->fat);

                    // Carb --> move speed (NEED TO CHANGE A BIT)
                    //printf("Move speed increased from %d", player->move_spd);
                    //player->move_spd += 0.1 * currentEnemy->carb;//too unwieldy.
                    //printf(" to %d\n", player->move_spd);
                }
            }
        }
    }
}
void enemyAttack(struct Enemy* enemy, struct player* Player)
{
    // Calculate the position of the attack hitbox based on the enemy's position and direction
    SDL_Rect attackHitbox;
    calculateEnemyAttackHitbox(enemy, &attackHitbox);
    
    // Create a rectangle representing the player's hitbox
    SDL_Rect playerHitbox = { Player->x, Player->y, Player->width, Player->height };
    // Check for collision with the player
    printf("Player Hitbox: x=%d, y=%d, width=%d, height=%d\n", playerHitbox.x, playerHitbox.y, playerHitbox.w, playerHitbox.h);
    printf("Attack Hitbox: x=%d, y=%d, width=%d, height=%d\n", attackHitbox.x, attackHitbox.y, attackHitbox.w, attackHitbox.h);
    if (checkCollision(attackHitbox, playerHitbox))
	{
        // If the attack hitbox collides with the player, apply damage to the player
        printf("Enemy attacked player!\n");
        damageMe(enemy->dmg);
    }
}
// Function to render the weapon swing animation
void renderWeaponSwing(SDL_Renderer* renderer, SDL_Texture* weaponTexture, struct player* player, int currentFrame) {
    // Calculate the angle increment per frame
    float angleIncrementPerFrame = ANGLE_INCREMENT;

    // Calculate the initial angle based on the player's facing direction
float initialAngle = 0.0;
if (player->facedir == 0) {
    // Right
    initialAngle = -45.0; // Adjusted starting angle for right-facing
} else if (player->facedir == 1) {
    // Up
    initialAngle = -135.0; // Adjusted starting angle for up-facing
} else if (player->facedir == 2) {
    // Left
    initialAngle = 135.0; // Adjusted starting angle for left-facing
} else if (player->facedir == 3) {
    // Down
    initialAngle = 45.0; // Adjusted starting angle for down-facing
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

    // Calculate the angle for the current frame
    float currentAngle = initialAngle + (currentFrame * angleIncrementPerFrame);
    // Calculate the position for the weapon's anchor point based on the current angle and facing direction
    int anchorOffsetX = distanceFromPlayer * cosf(currentAngle * M_PI / 180.0);
    int anchorOffsetY = distanceFromPlayer * sinf(currentAngle * M_PI / 180.0);

    // Calculate the scaled size of the weapon texture
    int scaledWidth = weaponCenterX * 2 * scalingFactor;
    int scaledHeight = weaponCenterY * 2 * scalingFactor;
    scaledHeight +=5;
    // Position the weapon in front of the player (adjust the offsets as needed)
    int renderX = player->x - weaponCenterX + anchorOffsetX + 120;
    int renderY = player->y - weaponCenterY + anchorOffsetY + 40;
    if (player->facedir == 0) {
        renderX += 20;
        renderY += 5;
    }
    

    // Render the weapon texture at the current angle with the anchor offset and scaled size
    SDL_Rect renderRect;
    renderRect.x = renderX;
    renderRect.y = renderY;
    renderRect.w = scaledWidth;
    renderRect.h = scaledHeight;

    SDL_RenderCopyEx(renderer, weaponTexture, NULL, &renderRect, currentAngle, NULL, SDL_FLIP_NONE);

    // Update the screen
    SDL_RenderPresent(renderer);

    // Add a delay to control the animation speed (adjust as needed)
    // SDL_Delay(10);
}



void player_movement()
{
	//Player movement.
	
}