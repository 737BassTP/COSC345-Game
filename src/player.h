#ifndef player_h
#define player_h

#include "everything.h"

//Player.
struct player
{
	//pos Pos;
	int x;
	int y;
	int xprevious;
	int yprevious;
	byte facedir;
	byte anim_spd_cur;//counter.
	byte anim_spd_spd;//inc counter by spd per frame.
	byte anim_spd_wrap;//inc sprite frame when counter exceeds this value.
	byte anim_cur;//current sprite frame.
	byte anim_max;//max sprite frame before rollover.
	byte move_spd;//moving speed of player.
	byte can_move;//bit-flag to be set while displaying map, questions, etc..., to prevent the player from moving.
	// Attack attributes
	int damage;
    int attackRangeWidth;
    int attackRangeHeight;
	int width;
	int height;
};

void calculateAttackHitbox(struct player* player, SDL_Rect* attackHitbox);
void attack(struct player* player);// Function to perform the player's attack

#define NUM_FRAMES 8
#define ANGLE_INCREMENT 5.625
void renderWeaponSwing(SDL_Renderer* renderer, SDL_Texture* weaponTexture, struct player* player);// Function to render the weapon swing animation

#endif