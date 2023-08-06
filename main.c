/*
COSC345 - Game

Authors: (sorted alphabetically)
	Matthew Yi
	Nicholas Campbell
	Sven Russell
	Thomas Pedersen

SDL2 Documentation:
https://wiki.libsdl.org/SDL2/APIByCategory

*/

//Includes.
#include <stdbool.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h> // for rand() and srand()
#include <time.h>   // for time()
#include <string.h>
#include <stdarg.h> //for variadic functions.
//#include <.h>
//#include "SDL2.dll"
#include "SDL2/include/SDL2/SDL.h"
#include "SDL2/include/SDL2/SDL_image.h"
#include "SDL2/include/SDL2/SDL_ttf.h"

//Definitions.
#define PI 3.1415926535897932

//Typedef'ing.
typedef unsigned char byte;//0-255, 0x00-0xFF
typedef unsigned short word;//0-65535, 0x0000-0xFFFF

//Colors (BGR because Big-Endianness).
const int c_black 	= 0x000000;
const int c_dkgray 	= 0x404040;
const int c_gray 	= 0x808080;
const int c_ltgray 	= 0xC0C0C0;
const int c_white 	= 0xFFFFFF;
const int c_red 	= 0x0000FF; 
const int c_orange 	= 0x0080FF;
const int c_yellow 	= 0x00FFFF;
const int c_lime 	= 0x00FF80;
const int c_green 	= 0x00FF00;
const int c_slime	= 0x80FF00;
const int c_aqua 	= 0xFFFF00;//turquoise
const int c_sky 	= 0xFF8000;
const int c_blue 	= 0xFF0000;
const int c_purple 	= 0xFF0080;
const int c_fuchsia = 0xFF00FF;
const int c_rose 	= 0x8000FF;
/*
const int c_ = 0x;
const int c_ = 0x;
const int c_ = 0x;
/**/

//Global variables.
int glob_draw_alpha = 255;
int glob_draw_color = c_white;
int glob_vk_right 	= 0;
int glob_vk_left 	= 0;
int glob_vk_up 		= 0;
int glob_vk_down 	= 0;
int glob_vk_space   = 0;
int glob_vk_enter   = 0;
int glob_vk_f2      = 0;
int glob_vk_0       = 0;
int glob_vk_1       = 0;
int glob_vk_2       = 0;
int glob_vk_3       = 0;
int glob_vk_4       = 0;
int glob_vk_5       = 0;
int glob_vk_6       = 0;
int glob_vk_7       = 0;
int glob_vk_8       = 0;
int glob_vk_9       = 0;

//Functions.
//Clear the surface by filling it with a colour.
void clear_screen(SDL_Surface *surface)
{
    if(SDL_FillRect(surface, NULL, 0xFF000040) < 0){
        fprintf(stderr, "Unable to clear the surface. Error returned: %s\n", SDL_GetError());
        SDL_Quit();
        exit(EXIT_FAILURE);
    }
}
int make_color_rgb(int r,int g,int b)
{
	return (r&0xFF)|((g&0xFF)<<8)|((b&0xFF)<<16);
}
double lerp(double from,double to,double percentage)
{
	//Lerp = Linear Interpolation.
	return from+(to-from)*percentage;
}
int make_color_hsv(int h,int s,int v)
{
	//source: https://stackoverflow.com/questions/3018313/algorithm-to-convert-rgb-to-hsv-and-hsv-to-rgb-in-range-0-255-for-both/14733008#14733008
	byte region, remainder, p, q, t;
    if (s == 0) {return make_color_rgb(v,v,v);}
    region = h / 43;
    remainder = (h - (region * 43)) * 6; 
    p = (v * (255 - s)) >> 8;
    q = (v * (255 - ((s * remainder) >> 8))) >> 8;
    t = (v * (255 - ((s * (255 - remainder)) >> 8))) >> 8;
	byte rr,gg,bb;//if buggy, change to int.
    switch (region)
    {
        case 0:
            rr = v; gg = t; bb = p;
            break;
        case 1:
            rr = q; gg = v; bb = p;
            break;
        case 2:
            rr = p; gg = v; bb = t;
            break;
        case 3:
            rr = p; gg = q; bb = v;
            break;
        case 4:
            rr = t; gg = p; bb = v;
            break;
        default:
            rr = v; gg = p; bb = q;
            break;
    }
    return make_color_rgb(rr,gg,bb);
}
int draw_get_alpha()
{
	return glob_draw_alpha;
}
int draw_get_color()
{
	return glob_draw_color;
}
void draw_set_color(SDL_Renderer* renderer,int bgr)
{
	glob_draw_color = bgr&0xFFFFFF;
	SDL_SetRenderDrawColor(renderer,bgr&0xFF,(bgr>>8)&0xFF,(bgr>>16)&0xFF,draw_get_alpha());
}
void draw_set_alpha(SDL_Renderer* renderer,int alpha)
{
	glob_draw_alpha = alpha&0xFF;
	int bgr = draw_get_color();
	SDL_SetRenderDrawColor(renderer,bgr&0xFF,(bgr>>8)&0xFF,(bgr>>16)&0xFF,alpha);
}
void draw_clear(SDL_Renderer* renderer,int bgr)
{
	draw_set_color(renderer,bgr);
	SDL_RenderClear(renderer);//fills whole with draw-color.	
}
void draw_clear_alpha(SDL_Renderer* renderer,int bgr,int alpha)
{
	draw_set_alpha(renderer,alpha);
	draw_clear(renderer,bgr);//invokes above function to avoid duplicate functionality.
}
void draw_rectangle(SDL_Renderer *renderer,int x1,int y1,int x2,int y2)
{
	//bug lookout: SDL_Rect is x,y,w,h, and draw_rectangle is x1,y1,x2,y2.
	SDL_Rect r;// = {.x=32,.y=64,.w=480,.h=480};
	r.x = x1;
	r.y = y1;
	r.w = x2-x1;//convert x2,y2 to w,h
	r.h = y2-y1;
	SDL_RenderFillRect(renderer,&r);
}
void draw_rectangle_color(SDL_Renderer *renderer,int x1,int y1,int x2,int y2,int bgr)
{
	int tmp=draw_get_color();
	draw_set_color(renderer,bgr);
	draw_rectangle(renderer,x1,y1,x2,y2);
	draw_set_color(renderer,tmp);
}
void draw_image(SDL_Renderer *renderer,int x1,int y1,int x2,int y2,SDL_Texture *texture)
{
	//draws the whole texture into a rectangle, stretch-to-fit.
	SDL_Rect r;// = {.x=32,.y=64,.w=480,.h=480};
	r.x = x1;
	r.y = y1;
	r.w = x2-x1;//convert x2,y2 to w,h
	r.h = y2-y1;
	int col=glob_draw_color;
	SDL_SetTextureColorMod(texture,col&0xFF,(col>>8)&0xFF,(col>>16)&0xFF);
	SDL_RenderCopy(renderer,texture,NULL,&r);//texture fill whole renderer.
}
void draw_image_part(SDL_Renderer *renderer,int x1,int y1,int x2,int y2,SDL_Texture *texture,int left,int top,int width,int height)
{
	SDL_Rect r;
	r.x = x1;
	r.y = y1;
	r.w = x2-x1;//convert x2,y2 to w,h
	r.h = y2-y1;
	SDL_Rect s;
	s.x = left;
	s.y = top;
	s.w = width;
	s.h = height;
	int col=glob_draw_color;
	SDL_SetTextureColorMod(texture,col&0xFF,(col>>8)&0xFF,(col>>16)&0xFF);
	SDL_RenderCopy(renderer,texture,&s,&r);
}
void draw_text(SDL_Renderer *renderer,int x,int y,int w,int h,SDL_Texture *font,char* str,int fontw,int fonth)
{
	//"#" = newline.
	//"##" = prints "#" with newline (unfinished: without newline).
	int len=strlen(str);
	int ch=0;
	int xo=0;
	int yo=0;
	int nl=((int)"#"[0])-32;//should I be proud or scared of myself?
	for (int i=0; i<len; i++)
	{
		ch = ((int)str[i])-32;
		if (ch == nl)
		{
			if (!(((int)str[i+1])-32 == nl))//next char is not nl.
			{
				xo = 0;
				yo += h;
				continue;
			}
		}
		draw_image_part(renderer,
			x+xo+0,y+yo,x+xo+w,y+yo+h,
			font,
			ch*fontw,0,fontw,fonth);
		xo += w;
	}
}
void draw_text_color(SDL_Renderer *renderer,int x,int y,int w,int h,SDL_Texture *font,char* str,int fontw,int fonth,int color)
{
	int dgc=draw_get_color();
	draw_set_color(renderer,color);
	draw_text(renderer,x,y,w,h,font,str,fontw,fonth);
	draw_set_color(renderer,dgc);
}
int keyboard_check(int key)
{
	return glob_vk_down;
}
int keyboard_check_pressed(int key)
{
	return glob_vk_down;
}
int keyboard_check_released(int key)
{
	return glob_vk_down;
}
int mux_int(int nth,...)
{
	//Multiplexer for ints.
	//Returns the nth argument.
	va_list args;
	va_start(args,nth);
	int ret = va_arg(args,int);
	for (int i=0; i<nth; i++)
	{
		ret = va_arg(args,int);
	}
	va_end(args);
	return ret;
}
char* mux_str(int nth,...)
{
	//Multiplexer for ints.
	//Returns the nth argument.
	va_list args;
	va_start(args,nth);
	char* ret = va_arg(args,int);
	for (int i=0; i<nth; i++)
	{
		ret = va_arg(args,char*);
	}
	va_end(args);
	return ret;
}
SDL_Texture* mux_sdltex(int nth,...)
{
	//Multiplexer for SDL_Texture pointers.
	//Returns the nth argument.
	va_list args;
	va_start(args,nth);
	int ret = va_arg(args,int);
	for (int i=0; i<nth; i++)
	{
		ret = va_arg(args,SDL_Texture*);
	}
	va_end(args);
	return ret;
}
int pos_int(int num,int val,...)
{
	//A demultiplexer variant for ints.
	//Returns the position a value appears in, or -1 if not.
	
	//untested.
	
	va_list args;
	va_start(args,val);
	int ret = va_arg(args,int);
	int i=0;
	int tmp;
	for (i=0; i<num; i++)
	{
		tmp = va_arg(args,int);
		if (val == tmp)
		{
			va_end(args);
			return i;
		}
	}
	va_end(args);
	return -1;
}
int BG(int val,int nth)
{
	return (val>>nth)&1;
}
int BGG(int val,int size,int nth)
{
	return (val>>(nth*size))&((1<<size)-1);
}
int sqr(int v)
{
	return v*v;
}
double degtorad(double deg)
{
	return (deg/180)*PI;
}
double radtodeg(double rad)
{
	return (rad/PI)*180;
}
double dcos(double deg)
{
	return cos(degtorad(deg));
}
double dsin(double deg)
{
	return sin(degtorad(deg));
}
Uint64 get_timer()
{
	return SDL_GetTicks64();
}
int point_in_rectangle(int px,int py,int rx1,int ry1,int rx2,int ry2)
{
	return ((px>=rx1 && px<rx2) && (py>=ry1 && py<ry2));
}
int rectangle_in_rectangle(int sx1,int sy1,int sx2,int sy2,int dx1,int dy1,int dx2,int dy2)
{
	//returns: 0=outside, 1=inside, 2=partially
	//ensure that *x2,*y2 are larger than *x1,*y1 for best results.
	int tmp=0;
	tmp += point_in_rectangle(sx1,sy1,dx1,dy1,dx2,dy2);
	tmp += point_in_rectangle(sx2,sy1,dx1,dy1,dx2,dy2);
	tmp += point_in_rectangle(sx1,sy2,dx1,dy1,dx2,dy2);
	tmp += point_in_rectangle(sx2,sy2,dx1,dy1,dx2,dy2);
	     if (tmp == 0) {return 0;}
	else if (tmp == 4) {return 1;}
	else {return 2;}
}
int string_pos(char *substr,char *str)
{
	//finds single-char substr in str.
	//todo: find multiple-char substr in str.
	//if not found, returns -1
	char *a = substr[0];
	char *b;// = str[0];
	int len=strlen(str);
	int ret=0;
	for (int i=0; i<len; i++)
	{
		b = str[i];
		if ((char)a == (char)b)
		//if (strcmp((const char*)&a,(const char*)&b)==0)
		{
			return i;
		}
	}
	return -1;
}
double darctan2(int y,int x)
{
	return radtodeg(atan2(y,x));
}
double cartodir(int x,int y)
{
	//return (darctan2(y,x)+360.0)%360.0;
	double ret = darctan2(y,x)+360.0;
	if (ret >= 360.0) {ret -= 360.0;}
	return ret;
}
void game_level_load(int lvl,int lvlmax)
{
	//done below.
}
void level_load(byte arr[],int siz,int count,int layers)
{
	FILE *fil = fopen("level.dat","rb");
	for (int i=0; i<siz*count*layers; i++)
	{
		arr[i] = 0;
	}
	fread(arr,siz*count*layers,1,fil);
	fclose(fil);
}
void dev_tiled_to_leveldata(byte arr[])
{
	//Extracts Tiles (done) and Objects (unfinished (unnecessary if tiles and objects share tileset)).
	printf("may take a while; please wait.\n");
	glob_vk_f2=0;//fakes a keyboard press event (fails if held).
	FILE *filin = fopen("tiled/cosc345-game.tmx","rb");
	FILE *filout = fopen("level.dat","wb");
	int layers=2;
	int layersize=131072;
	//layersize=512;//debug only
	int maxsize = layersize*layers;//131072
	byte array[262144];//tiles + objects.
	int arrsiz=sizeof(array);
	for (long i=0; i<maxsize; i++) {array[i] = 0;}
	//Discard input header.
	fseek(filin,(long int)0x1FC-0,SEEK_SET);//hardcoded; may bug out in future, so avoid renaming or resizing in Tiled project file.
	//Read Tiles and Objects.
	byte comma=","[0];
	int ch=0;
	byte entry[3];
	word val;
	int counter=0;
	int off=0;
	int ij=0;
	//Extract and restructure.
	for (int i=0; i<arrsiz; i++)
	{
		ch=fgetc(filin);
		for (int j=0; j<3; j++) {entry[j]=48;}
		while ((ch==0xD) || (ch==0xA)) {ch=fgetc(filin);}
		entry[2]=ch;
		ch=fgetc(filin);
		if (ch!=comma)
		{
			entry[1]=entry[2];
			entry[2]=ch;
			ch=fgetc(filin);
			if (ch!=comma)
			{
				entry[0]=entry[1];
				entry[1]=entry[2];
				entry[2]=ch;
				fgetc(filin);//important.
			}
		}
		val^=val;
		for (int j=0; j<3; j++) {val+=(entry[j]-48)*(byte)pow((double)10,(double)(2-j));}
		printf("i=%i/%i (v=%i)\n",i,layersize,val);//comment out to speed up.
		val-=(val==0)?(-0xFF):(1)&0xFF;
		array[(((1<<(1<<1))<<1)<<((1|(1<<1)|(1<<(1<<1)))<<1))*(val>=(((1<<1)<<1)<<((1+1+1)<<1)))+(1<<(3<<(1<<1)))*(i>>(3<<(1<<1)))+(1<<(1<<3))*((i>>(1<<(1<<1)))&(3*(1<<(1<<1)|1)))+(1<<(1<<(1<<1)))*((i>>(1<<3))&(3*(1<<(1<<1)|1)))+(i&(3*(1<<(1<<1)|1)))]=val;//security through obscurity, or what? (it crashes the compiler...)
	}
	//Compress.
	val^=val;
	counter=0;
	for (int i=0; i<layersize; i++)
	{
		break;
	}
	//Write to file.
	fwrite(array,maxsize,1,filout);
	fclose(filin);
	fclose(filout);
	//Re-load in-game.
	level_load(arr,256,512,2);
}
char* level_get_name(int lvl,char* ret)
{
	//Translates e.g level 8/256 to "Warrington".
	FILE *fil;
	fil=fopen("location.dat","rb");
	fseek(fil,(long int)lvl,SEEK_SET);
	int tmp=(int)fgetc(fil);
	fseek(fil,(long int)256,SEEK_SET);
	fgets(ret,16,fil);
	while (tmp>0)
	{
		fgets(ret,16,fil);
		tmp--;
	}
	fclose(fil);
	return ret;
}


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
	int xprevious;
	int yprevious;
	byte face_dir;
};
//rain struct
struct WaterParticle {
    float x;
    float y;
    float speed;
    int active;
};
//initialize number of water particles wanted
const int MAX_WATER_PARTICLES = 100;
struct WaterParticle* waterParticles;
int waterOn = 0; //decide if raining or not
//function to create water particle.
void createWaterParticle(int index, int window_width, int window_height) {
    waterParticles[index].x = rand() % (1366-596)+298;     // Random x position within window width
    waterParticles[index].y = -(rand() % window_height); // Random initial y position above the window
    waterParticles[index].speed = 10;        // Rain speed
    waterParticles[index].active = 1;                    // Set active to 1 (true)
}
//function to reactivate water particles
void activateAllWaterParticles() {
    for (int i = 0; i < MAX_WATER_PARTICLES; i++) {
        waterParticles[i].active = 1; // Set active to 1 (true)
    }
}
//deactivate them all
void deactivateAllWaterParticles() {
    for (int i = 0; i < MAX_WATER_PARTICLES; i++) {
        waterParticles[i].active = 0; // Set active to 0 (false)
    }
}
//Health System test
int health = 100;
int maxHealth=100;
SDL_Rect playerHitbox;
// Function to update the globalRect's position and size
void updatePlayerHitbox(int x, int y, int width, int height) {
    playerHitbox.x = x;
    playerHitbox.y = y;
    playerHitbox.w = width;
    playerHitbox.h = height;
}
//damaging test
void damageMe(int dmg)
{
	if(health-dmg<=0)
	{
		health=0;
	}
	else
	{
		health -= dmg;
	}
}
//healing test
void healMe(int dmg)
{
	if(health+dmg>=maxHealth)
	{
		health=100;
	}
	else
	{
		health += dmg;
	}
}					
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
//enemy struct
struct Enemy {
    int x;//position x
    int y;//position y
    int width;//hit box stats
    int height;
    int health;
	int dmg;//damage it deals
	SDL_Texture* texture;
    // Add more enemy-related attributes as needed
};
#define MAX_ENEMIES 250

// Function to initialize an enemy with position and size
void initEnemy(struct Enemy* enemy, int x, int y, int width, int height, int health, int dmg, SDL_Texture* texture) {
    enemy->x = x;
    enemy->y = y;
    enemy->width = width;
    enemy->height = height;
    enemy->health = health;
    enemy->dmg = dmg;
	enemy->texture = texture;
}
// Function to reset an enemy to its default state
void resetEnemy(struct Enemy* enemy) {
    enemy->x = 0;
    enemy->y = 0;
    enemy->width = 0;
    enemy->height = 0;
    enemy->health = 0;
    enemy->dmg = 0;
    // Add other attributes reset if needed
}
// Function to add an enemy to the array
struct Enemy enemies[MAX_ENEMIES];

void addEnemy(int x, int y, int width, int height, int health, int dmg, SDL_Texture* texture) {
    for (int i = 0; i < MAX_ENEMIES; i++) {
        struct Enemy* currentEnemy = &enemies[i];
        if (currentEnemy->health <= 0) {
            initEnemy(currentEnemy, x, y, width, height, health, dmg, texture);
            return; // Exit the function after adding the enemy
        }
    }
    // If all slots are filled, you can handle this case as needed (e.g., ignore or overwrite)
}
void randomSpawnEnemy(int x, int y, int width, int height, int health, int dmg, SDL_Texture* texture){
	int spawnChance = 50; //50% chance of enemy spawning
	srand((unsigned int)time(NULL));
	int randomValue = rand() % 100;
	if(randomValue<spawnChance){
		addEnemy(x, y, width, height, health, dmg, texture);//size, stats and image to go with it.
	}
}
//distance to player
float distance(float x1, float y1, float x2, float y2) {
    float dx = x2 - x1;
    float dy = y2 - y1;
    return sqrt(dx * dx + dy * dy);
}
// Function to check for collision between two rectangles
// Returns true (non-zero) if the rectangles collide, false (0) otherwise
int checkCollision(SDL_Rect rect1, SDL_Rect rect2) {
    return (rect1.x < rect2.x + rect2.w &&
            rect1.x + rect1.w > rect2.x &&
            rect1.y < rect2.y + rect2.h &&
            rect1.y + rect1.h > rect2.y) ||
           (rect2.x < rect1.x + rect1.w &&
            rect2.x + rect2.w > rect1.x &&
            rect2.y < rect1.y + rect1.h &&
            rect2.y + rect2.h > rect1.y);
}
void calculateAttackHitbox(struct player* player, SDL_Rect* attackHitbox) {
    // Calculate the position of the attack hitbox based on player direction
    int attackX = player->x;
    int attackY = player->y;
    // Adjust the position of the attack hitbox based on the player's direction
    if (player->facedir == 1) { // Up
        attackY -= player->attackRangeHeight;
    } else if (player->facedir == 0) { // Right
        attackX += player->attackRangeWidth;
    } else if (player->facedir == 3) { // Down
        attackY += player->attackRangeHeight;
    } else if (player->facedir == 2) { // Left
        attackX -= player->attackRangeWidth;
    }

    // Set the attack hitbox's position and size
    attackHitbox->x = attackX;
    attackHitbox->y = attackY;
    attackHitbox->w = player->attackRangeWidth;
    attackHitbox->h = player->attackRangeHeight;
}
struct Enemy* globalEnemy = NULL; // Initialize the global pointer to NULL initially

// Function to perform the player's attack
void attack(struct player* player) {
    for (int i = 0; i < MAX_ENEMIES; i++) {
        struct Enemy* currentEnemy = &enemies[i];

        if (currentEnemy->health > 0) {
            // Create a rectangle representing the attack hitbox
            SDL_Rect attackHitbox;
            calculateAttackHitbox(player, &attackHitbox);

            // Create a rectangle representing the enemy hitbox
            SDL_Rect enemyHitbox = { currentEnemy->x, currentEnemy->y, currentEnemy->width, currentEnemy->height };

            // Check for collision with the enemy
            if (checkCollision(attackHitbox, enemyHitbox)) {
                // If the attack hitbox collides with the enemy, apply damage to the enemy
                printf("Hit enemy!\n");
                currentEnemy->health -= player->damage;
            }
        }
    }
}
#define NUM_FRAMES 8
#define ANGLE_INCREMENT 5.625
// Function to render the weapon swing animation
void renderWeaponSwing(SDL_Renderer* renderer, SDL_Texture* weaponTexture, struct player* player) {
    // Calculate the angle increment per frame
    float angleIncrementPerFrame = ANGLE_INCREMENT;

    // Calculate the initial angle based on the player's facing direction
    float initialAngle = 0.0;
    if (player->facedir == 0) { // Right
        initialAngle = 0.0; // Swing right (right of the player) when facing right
    } else if (player->facedir == 1) { // Up
        initialAngle = -90.0; // Swing up (above the player) when facing up
    } else if (player->facedir == 2) { // Left
        initialAngle = 180.0; // Swing left (left of the player) when facing left
    } else if (player->facedir == 3) { // Down
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
    for (int i = 0; i < NUM_FRAMES; i++) {
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
		if(player->facedir==0){
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
//Pushable block.
struct pushblock
{
	int x;
	int y;
	char pushmask;
};

//Audio.
typedef struct
{
    Uint8* buffer;
    Uint32 length;
    Uint32 position;
} AudioData;//must be typedef'ed like this to fix compile bugs.

void audioCallback(void* userdata, Uint8* stream, int len) {
    AudioData* audiodata = (AudioData*)userdata;
    if (audiodata->position >= audiodata->length) {
        audiodata->position = 0;  // Reset position to the beginning of the buffer
    }
    Uint32 remainingBytes = audiodata->length - audiodata->position;
    Uint32 bytesToCopy = len < remainingBytes ? len : remainingBytes;
    SDL_memcpy(stream, audiodata->buffer + audiodata->position, bytesToCopy);
    audiodata->position += bytesToCopy;
}
void play_WAV(const char* wavfile,SDL_AudioSpec spec,Uint8 *wavbuffer,int wavlength)
{
	/*
	if (SDL_LoadWAV(wavfile,&wavspec,&wavbuffer,&wavlength)==0)
	{
		printf("play_WAV failed");
	}
	//
	/**/
}

//Game clock. (HH:MM)
int clock_get_hour(int time) {return (time/60)%24;}
int clock_get_minute(int time) {return time%60;}
int clock_is_between(int time,int h1,int m1,int h2,int m2)
{
	int c1,c2;
	c1 = (h1%24)*60 + m1%60;
	c2 = (h2%24)*60 + m2%60;
	return ((time>=c1) && (time<=c2));
}

//Temperature.
double temp_ctof(int c) {return (double)c * 1.8 + 32.0;}//Celsius to Fahrenheit.

//quiz
// Define the quiz question and answers
const char* quizHeader = "INSERT NAME HERE";//Name of person we are talking to
const char* quizInfo = "";//"correct or false"
const char* quizInfoHolder ="";//does nothing currently
const char* quizQuestion = "What is the capital of France?";//default question
const char* answerA = "A) Paris";//default answer a
const char* answerB = "B) London";//default answer b
const char* answerC = "C) Berlin";//default answer c
int correctAnswer = 0;//current number relating to the correct answer.
int userAnswer = 0;//user input for the quiz (1,2,3), 0 is default.
bool quizOn = false;//if a quiz is active (rendering)

int quizQNum = 1;//question counter for quiz (ends at 4 for three question quiz)

bool quiz2Called = false;//boolean to see if the player has completed quiz 2 etc
bool quiz3Called = false;
bool quizLoopOn = false;//are we going through the quiz loop in main
int usedQuestions[100] = {0}; // Array to keep track of used question numbers (for random question)
int usedQuestionCount = 0;    // Variable to keep track of the number of used questions (so we dont get the same random question)
// Function to check if a question number has been used before
int isQuestionUsed(int questionNumber) {
    for (int i = 0; i < usedQuestionCount; i++) {
        if (usedQuestions[i] == questionNumber) {
            return 1; // Question number is already in the usedQuestions list
        }
    }
    return 0; // Question number has not been used before
}
void updateQuizDataFromRandomLine(const char *filename,
                                  const char **quizQuestion,
                                  const char **answerA,
                                  const char **answerB,
                                  const char **answerC,
                                  int *userAnswer,
                                  int *correctAnswer,
                                  const char **quizInfoHolder) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening the file.\n");
        return;
    }

    // Count the number of lines in the file
    int lineCount = 0;
    char ch;
    while ((ch = fgetc(file)) != EOF) {
        if (ch == '\n') {
            lineCount++;
        }
    }
    // Reset the file pointer to the beginning
    rewind(file);

    // Generate a random line number
    srand(time(NULL));
    int randomLine;

    // Keep generating random line numbers until we get a line that hasn't been used before
    do {
        randomLine = rand() % lineCount;
    } while (isQuestionUsed(randomLine));

    // Add the question number to the list of used questions
    usedQuestions[usedQuestionCount] = randomLine;
    usedQuestionCount++;

    // Read and process lines until we reach the randomly selected line
    char line[1024];
    for (int i = 0; i <= randomLine; i++) {
        if (fgets(line, sizeof(line), file)) {
            char *token;
            const char *delim = ";";
            token = strtok(line, delim);
            while (token != NULL) {
                char varName[256], varValue[768];
                if (sscanf(token, "%[^=]=%[^\n]", varName, varValue) == 2) {
                    if (strcmp(varName, "quizQuestion") == 0) {
                        *quizQuestion = strdup(varValue);
                    } else if (strcmp(varName, "answerA") == 0) {
                        *answerA = strdup(varValue);
                    } else if (strcmp(varName, "answerB") == 0) {
                        *answerB = strdup(varValue);
                    } else if (strcmp(varName, "answerC") == 0) {
                        *answerC = strdup(varValue);
                    } else if (strcmp(varName, "userAnswer") == 0) {
                        *userAnswer = atoi(varValue);
                    } else if (strcmp(varName, "correctAnswer") == 0) {
                        *correctAnswer = atoi(varValue);
                    } else if (strcmp(varName, "quizInfoHolder") == 0) {
                        *quizInfoHolder = strdup(varValue);
                    } 
                }
                token = strtok(NULL, delim);
            }
        }
    }
    fclose(file);
}

/*
Entry point.
*/
int SDL_main(int argc, char *argv[])
{
	//Error printing.
	const size_t bufsize = 0x100;
	char errmsg[bufsize];
	
	//Print SDL2 version.
	if (1)
	{
		SDL_version sdlver_compiled;
		SDL_version sdlver_linked;
		SDL_VERSION(&sdlver_compiled);
		SDL_GetVersion(&sdlver_linked);
		SDL_Log("Compiled with SDL version %u.%u.%u ...\n",sdlver_compiled.major,sdlver_compiled.minor,sdlver_compiled.patch);
		SDL_Log("Linked against SDL version %u.%u.%u.\n",sdlver_linked.major,sdlver_linked.minor,sdlver_linked.patch);
	}
	
	//Window size.
	//Dimensions.
	const int screen_w = 1366;
    const int screen_h = 768;
	//Game area.
	const int win_game_x = (screen_w-screen_h)/2;//(1366-768)/2=299
	const int win_game_y = 0;
	const int win_game_w = screen_h;
	const int win_game_h = screen_h;//both are "h" to make it quadratic.
	const int win_game_x2 = win_game_x+win_game_w;
	const int win_game_y2 = win_game_y+win_game_h;
	
	const int win_game_tile_num = 16;//16 "tiles" per screen axis.
	const int win_game_tile_dim = 16;//each tile is 16 "pixels" along each axis.
	
	int gw,gh;//scaling.
	gw = screen_h/sqr(win_game_tile_num);// == 3, an int (for res. 1366/768 and 16x 16*16 px tiles per axis).
	gh = gw;
		
	SDL_Surface* surface;
    SDL_Window* window;
    SDL_Renderer* renderer;
    SDL_Event event;
	//rain

    // Allocate memory for water particles
    waterParticles = malloc(MAX_WATER_PARTICLES * sizeof(struct WaterParticle));
    if (waterParticles == NULL) {
        // Handle allocation failure
        fprintf(stderr, "Failed to allocate memory for water particles\n");
        return 1;
    }
	//initialize random number generator seed
	srand(time(NULL));
    // Initialize water particles
    for (int i = 0; i < MAX_WATER_PARTICLES; i++) {
        createWaterParticle(i, screen_w, screen_h);
    }
	//void SDL_SetMainReady(void);
	//int flags = SDL_INIT_VIDEO|SDL_INIT_AUDIO;
	int flags = SDL_INIT_EVERYTHING;
	if (SDL_Init(flags) != 0)
	{
		printf("SDL init error:%s\n",SDL_GetError());
		return -1;
	}
	
	//Create window (main window).
	window = SDL_CreateWindow("COSC345 - Game",SDL_WINDOWPOS_UNDEFINED,SDL_WINDOWPOS_UNDEFINED,screen_w,screen_h,0);
	if (!window)
	{
		snprintf(errmsg, bufsize, "Window error");
		goto error;
	}
	//Create renderer.
    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_PRESENTVSYNC);
    if (!renderer)
    {
        snprintf(errmsg, bufsize, "Render error");
        goto error;
    }
    //Create the surface in RAM that we manipulate the pixels of.
    surface = SDL_GetWindowSurface(window);
    if (!surface) {
        snprintf(errmsg, bufsize, "Surface error");
        goto error;
    }
	
	//int option = 0;
    //char optionText[2] = "0";
    //pop up window test
	SDL_Rect buttonRect = { 800, 100, 100, 100 };//dimension of popup
	char buttonTexts[100] = "default message";//message in the window
	char* buttonText = buttonTexts;
	SDL_Rect* buttonRectPtr = &buttonRect; // Declare and initialize buttonRectPtr to point to buttonRect
	
	int buttonVis = 0;//0 for no window and 1 for visible window
	int buttonVis2 = 0;//for second person chatting
	

    // Load a TTF font (adjust the file path and size as needed)
	    // Initialize SDL_ttf
    if (TTF_Init() == -1) {
        printf("SDL_ttf could not initialize! TTF_Error: %s\n", TTF_GetError());
        return 1;
    }
    TTF_Font* font = TTF_OpenFont("font.ttf", 12);
    if (font == NULL) {
        printf("Failed to load font! SDL_ttf Error: %s\n", TTF_GetError());
        return 1;
    }
	int popup = 0;
	
	//score display
	int score = 0; //initial score
	SDL_Color scoreColour = { 0, 0, 0, 255 };
    //Create a renderer for the window
    SDL_Renderer* rendererPop = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    if (renderer == NULL) {
        printf("Renderer could not be created! SDL_Error: %s\n", SDL_GetError());
    }
	
	//Images.
	IMG_Init(IMG_INIT_PNG);
	//SDL_Texture *spr_grass = IMG_LoadTexture(renderer,"image-test.png");
	SDL_Texture *spr_grass = IMG_LoadTexture(renderer,"img/spr_grass.png");
	SDL_Texture *spr_sand  = IMG_LoadTexture(renderer,"img/spr_sand.png");
	SDL_Texture *spr_water = IMG_LoadTexture(renderer,"img/spr_water_strip16.png");
	SDL_Texture *spr_lava  = IMG_LoadTexture(renderer,"img/spr_lava_strip16.png");
	SDL_Texture *spr_water_shallow = IMG_LoadTexture(renderer,"img/spr_water_shallow_strip16.png");
	SDL_Texture *spr_lava_shallow  = IMG_LoadTexture(renderer,"img/spr_lava_shallow_strip16.png");
	SDL_Texture *spr_tileset = IMG_LoadTexture(renderer,"tiled/tileset.png");
	SDL_Texture *spr_hudshade = IMG_LoadTexture(renderer,"img/hudshade.png");
	SDL_Texture *spr_enemy1 = IMG_LoadTexture(renderer,"img/spr_enemy1.png");
	
	//Player.
	SDL_Texture *sprstrip_player = IMG_LoadTexture(renderer,"img/player_strip8.png");
	//Text.
	SDL_Texture *font_ascii = IMG_LoadTexture(renderer,"img/ascii_strip96.png");
	int font_ascii_w = 8;
	int font_ascii_h = 24;
	
	//Clock (digital).
	SDL_Texture *spr_clock_digital = IMG_LoadTexture(renderer,"img/clock1_strip10.png");
	int time_clock_max=1440;
	int time_clock = 0;//range: 0-1439 = 00:00-23:59
	int time_clock_fps=0;//rapidly emulate sub-seconds.
	int time_clock_fps_max=57;//below 60 to accommodate for delays.
	int time_clock_fps_multiplier=60;//1=1/1 second, 4=1/4 second.
	char *timestr_a="Night";
	char *timestr_b="Morning";
	char *timestr_c="Day";
	char *timestr_d="Evening";
	int weekday=0;
	char *weekday_string="MTWTFSS";
	int monthday=0;//4 weeks=28 days.
	char month_str[5];//e.g "21stNULL"
	
	//Game Level.
	int level_size = sqr(win_game_tile_num);//16*16=256
	int level_realms = 2;//overworld, underworld.
	int level_count = 256*level_realms;
	int level_layers = 2;
	int level_cur=0;//256 = 16*16 
	byte level_data[262144];//static; can not be free'd.
	//262144 = 256*512*2 (level size * level count * level layers)
	level_load(level_data,level_size,level_count,level_layers);
	int lvl_off_obj=0x20000;
	int lvl_yoff=(int)sqrt(level_count/level_realms);
	
	//Map.
	SDL_Texture *spr_map = IMG_LoadTexture(renderer,"img/dunedin-map.png");
	SDL_Texture *spr_mapicon_unknown = IMG_LoadTexture(renderer,"img/spr_map_unknown.png");
	char mapstr_location[16];
	level_get_name(level_cur,mapstr_location);
	Uint32 mapvisit[16];//512 bools.
	mapvisit[level_cur/32]=1<<(level_cur%32);
	
	//Temperature.
	int temp_mode=0;//0=Celsius, 1=Fahrenheit.
	int temp_cur=10;
	char temp_str[5];//(-/+)xy*(C/F)
	temp_str[3]="*"[0];
	SDL_Texture *spr_thermometer = IMG_LoadTexture(renderer,"img/spr_thermometer.png");
	byte temp_col=0x80;
	
	//Player.
	struct player Player;
	//struct pos Pos;
	//Player.Pos = Pos;
	Player.x = win_game_x + 8*gw*win_game_tile_dim;
	Player.y = win_game_y + 8*gh*win_game_tile_dim;
	Player.facedir = 0;
	Player.anim_spd_cur = 0;//counter.
	Player.anim_spd_spd = 1;//inc counter by spd per frame.
	Player.anim_spd_wrap = 12;//inc sprite frame when counter exceeds this value.
	Player.anim_cur = 0;//current sprite frame.
	Player.anim_max = 2;//max sprite frame before rollover.
	Player.move_spd = 3*4;
	//damage stats
	Player.attackRangeHeight=50;
	Player.attackRangeWidth=15;
	Player.damage=50;
	Player.width=15;
	Player.height=15;
	updatePlayerHitbox(Player.x, Player.y, Player.width, Player.height);

	//test enemy
	// struct Enemy enemy1;//Random player enemy
	// initEnemy(&enemy1, 500, 500, 100, 100, 100, 10, spr_enemy1);//size, stats and image to go with it.
	// globalEnemy = &enemy1;//making it the global enemy.



	//Nutrients.
	SDL_Texture *spr_nutrients = IMG_LoadTexture(renderer,"img/spr_nutrients_strip4.png");
	
	//Music.
	const char *wavfile="music.wav";
	SDL_AudioSpec wavspec;
	Uint8 *wavbuffer;
	Uint32 wavlength;
	if (SDL_LoadWAV(wavfile, &wavspec, &wavbuffer, &wavlength) == NULL) 
	{
        printf("Failed to load WAV file: %s\n", SDL_GetError());
        return;
    }
	AudioData audiodata;
    audiodata.buffer = wavbuffer;
    audiodata.length = wavlength;
    audiodata.position = 0;
	wavspec.callback = audioCallback;
    wavspec.userdata = &audiodata;
	
	SDL_AudioDeviceID deviceid;
	deviceid = SDL_OpenAudioDevice(NULL,0,&wavspec,NULL,0);
	if (deviceid == 0) {
        printf("Failed to open audio device: %s\n", SDL_GetError());
        SDL_FreeWAV(wavbuffer);
        return;
    }
	SDL_QueueAudio(deviceid,wavbuffer,wavlength);
	SDL_PauseAudioDevice(deviceid,0);//0 is unpause
	//SDL_MixAudioFormat(wavbuffer,wavbuffer,AUDIO_S16,wavlength,32);
	//play_WAV(wavfile,&wavspec,&wavbuffer,&wavlength);
	
	//Splash intro screen.
	int splashintro_bool=1;
	SDL_Texture *splashintro_img1 = IMG_LoadTexture(renderer,"img/logo1a.png");
	SDL_Texture *splashintro_img2 = IMG_LoadTexture(renderer,"img/logo1b.png");
	SDL_Texture *splashintro_img3 = IMG_LoadTexture(renderer,"img/logo1c.png");
	char* splashintro_string = "Press SPACE to continue.";
	char* splashintro_string_copyright = "(C) 2023 - Thomas, Sean, Matthew, Nicholas - COSC345";
	int splashintro_slen1=strlen(splashintro_string);
	int splashintro_slen2=strlen(splashintro_string_copyright);
	
	//Mainloop here.
	int running=1;
	printf("Entering main loop...\n");
	while (running)
	{
		//Organize SDL Polls.
        while (SDL_PollEvent(&event))
        {
            switch (event.type)
            {
                case SDL_QUIT:
                {
					//close using red cross or ALT+F4.
                    running = 0;
                    break;
                }
				case SDL_KEYDOWN:
				{
					//key held down or pressed
					int v=1;
					switch (event.key.keysym.sym)
					{
						case SDLK_ESCAPE:{running=0;} break;//escape quits game.
						case SDLK_RIGHT: {glob_vk_right	=v;} break;
						case SDLK_LEFT:  {glob_vk_left	=v;} break;
						case SDLK_UP:    {glob_vk_up	=v;} break;
						case SDLK_DOWN:  {glob_vk_down	=v;} break;
						case SDLK_SPACE: {glob_vk_space	=v;} break;
						case SDLK_KP_ENTER: {glob_vk_enter	=v;} break;//seems broken.
						case SDLK_F2:  {glob_vk_f2	=v;} break;
						case SDLK_0:  {glob_vk_0=v;} break;
						case SDLK_1:  {glob_vk_1=v;} break;
						case SDLK_2:  {glob_vk_2=v;} break;
						case SDLK_3:  {glob_vk_3=v;} break;
						case SDLK_4:  {glob_vk_4=v;} break;
						case SDLK_5:  {glob_vk_5=v;} break;
						case SDLK_6:  {glob_vk_6=v;} break;
						case SDLK_7:  {glob_vk_7=v;} break;
						case SDLK_8:  {glob_vk_8=v;} break;
						case SDLK_9:  {glob_vk_9=v;} break;
						//case SDLK_:  {glob_vk_	=v;} break;
						
					}
					break;
				}
				case SDL_KEYUP:
				{
					//key released
					int v=0;
					switch (event.key.keysym.sym)
					{
						case SDLK_RIGHT: {glob_vk_right	=v;} break;
						case SDLK_LEFT:  {glob_vk_left	=v;} break;
						case SDLK_UP:    {glob_vk_up	=v;} break;
						case SDLK_DOWN:  {glob_vk_down	=v;} break;
						case SDLK_SPACE: {glob_vk_space	=v;} break;
						case SDLK_KP_ENTER: {glob_vk_enter	=v;} break;
						case SDLK_F2:  {glob_vk_f2	=v;} break;
						case SDLK_0:  {glob_vk_0=v;} break;
						case SDLK_1:  {glob_vk_1=v;} break;
						case SDLK_2:  {glob_vk_2=v;} break;
						case SDLK_3:  {glob_vk_3=v;} break;
						case SDLK_4:  {glob_vk_4=v;} break;
						case SDLK_5:  {glob_vk_5=v;} break;
						case SDLK_6:  {glob_vk_6=v;} break;
						case SDLK_7:  {glob_vk_7=v;} break;
						case SDLK_8:  {glob_vk_8=v;} break;
						case SDLK_9:  {glob_vk_9=v;} break;
						//case SDLK_:  {glob_vk_	=v;} break;
						
					}
					break;
				}
				
            }
        }
		
		/*
		Process inputs.
		*/
		//Debug input:
		if (glob_vk_f2)
		{
			printf("F2 started!\n");	
			dev_tiled_to_leveldata(level_data);
			printf("F2 finished!\n");	
		}
		if(glob_vk_7)
		{
			glob_vk_7=0;
			attack(&Player);//calls attack function
			renderWeaponSwing(renderer, spr_water, &Player);//renders the swing
		}

		//Rain toggle.
		if (glob_vk_0)
		{
			glob_vk_0=0;
			//turn water on and off for testing
			if(waterOn==0)
			{
				waterOn=1;
				activateAllWaterParticles();
			}
			else
			{
				waterOn=0;
				deactivateAllWaterParticles();
			}
		}
		//Popup window.
		if (glob_vk_9)
		{
			glob_vk_9=0;//press, not hold.
			//pressing 9 brings up chat window
			if(buttonVis==0)
			{
				buttonVis=1;
				strcpy(buttonTexts, "press 1,2,3,4");
			}
			else
			{
				buttonVis=0;
			}
		}
		//pressing 1 changes text inside test box.
		if (glob_vk_1)
		{
			glob_vk_1=0;
			if(buttonVis==1)
			{
				// chatBoxMod(buttonRectPtr, 100, 200, 300, 400); //testing function to see if it works.
				const char* newButtonText = "you pressed 1, good job. Lets test the limit";
				size_t maxButtonLen = sizeof(buttonTexts) - 1; // Leave space for null terminator
				strncpy(buttonTexts, newButtonText, maxButtonLen);//pressing 1 changes text inside test box.
				buttonTexts[maxButtonLen] = '\0'; // Ensure the destination string is null-terminated
				score += 50;
			}
			else if(quizOn)
			{
				userAnswer=1;
			}
		}
		if (glob_vk_2)
		{
			glob_vk_2=0;
			if(buttonVis==1)
			{
				const char* newButtonText = "you pressed 2, good job. Lets test the limit woo";
				size_t maxButtonLen = sizeof(buttonTexts) - 1; // Leave space for null terminator
				strncpy(buttonTexts, newButtonText, maxButtonLen);//pressing 1 changes text inside test box.
				buttonTexts[maxButtonLen] = '\0'; // Ensure the destination string is null-terminated
				score += 50;
			}
			else if(quizOn)
			{
				userAnswer=2;
			}
		}
		if (glob_vk_3)
		{
			glob_vk_3=0;
			if(buttonVis==1)
			{
				const char* newButtonText = "you pressed 3";
				size_t maxButtonLen = sizeof(buttonTexts) - 1; // Leave space for null terminator
				strncpy(buttonTexts, newButtonText, maxButtonLen);//pressing 1 changes text inside test box.
				buttonTexts[maxButtonLen] = '\0'; // Ensure the destination string is null-terminated
				score += 50;
			}
			else if(quizOn)
			{
				userAnswer=3;
			}
		}
		if (glob_vk_4)
		{
			glob_vk_4=0;
			if(buttonVis==1)
			{
				const char* newButtonText = "you pressed 4, good job. Lets test the limit woo";
				size_t maxButtonLen = sizeof(buttonTexts) - 1; // Leave space for null terminator
				strncpy(buttonTexts, newButtonText, maxButtonLen);//pressing 1 changes text inside test box.
				buttonTexts[maxButtonLen] = '\0'; // Ensure the destination string is null-terminated
				score += 50;
			}
		}
		if (glob_vk_5)
		{
			glob_vk_5=0;
			damageMe(10);
		}
		if (glob_vk_6)
		{
			glob_vk_6=0;
			healMe(10);
		}		
		
		
		//Player movement.
		if (glob_vk_right)
		{
			Player.facedir=0;
			Player.x += Player.move_spd;
			updatePlayerHitbox(Player.x, Player.y, Player.width, Player.height);
		}
		if (glob_vk_up)
		{
			Player.facedir=1;
			Player.y -= Player.move_spd;
			updatePlayerHitbox(Player.x, Player.y, Player.width, Player.height);
		}
		if (glob_vk_left)
		{
			Player.facedir=2;
			Player.x -= Player.move_spd;
			updatePlayerHitbox(Player.x, Player.y, Player.width, Player.height);
		}
		if (glob_vk_down)
		{
			Player.facedir=3;
			Player.y += Player.move_spd;
			updatePlayerHitbox(Player.x, Player.y, Player.width, Player.height);
		}
		if (glob_vk_right|glob_vk_left|glob_vk_up|glob_vk_down)
		{
			//Position.
			
			//Animation.
			Player.anim_spd_cur += Player.anim_spd_spd;
			Player.anim_cur += (Player.anim_spd_cur >= Player.anim_spd_wrap);
			Player.anim_spd_cur %= Player.anim_spd_wrap;
			Player.anim_cur %= Player.anim_max;
			//Position wrapping and level loading.
			int p_east,p_north,p_west,p_south;
			p_east  = win_game_x2-win_game_tile_dim*gw;
			p_north = win_game_y;
			p_west  = win_game_x;
			p_south = win_game_y2-win_game_tile_dim*gh;
			int lvlbool = 0;
			lvlbool = ((Player.x > p_east)||(Player.y > p_south)||(Player.x < p_west)||(Player.y < p_north));//must be here, and not below the individual checks!
			if (Player.x > p_east)
			{
				//at east side
				Player.x = p_west;
				level_cur += 1;
				randomSpawnEnemy(500, 500, 100, 100, 100, 10, spr_enemy1);//size, stats and image to go with it.

				
			}
			if (Player.y < p_north)
			{
				//at north side
				Player.y = p_south;
				level_cur -= lvl_yoff;
				randomSpawnEnemy(500, 500, 100, 100, 100, 10, spr_enemy1);//size, stats and image to go with it.

			}
			if (Player.x < p_west)
			{
				//at west side
				Player.x = p_east;
				level_cur -= 1;
				randomSpawnEnemy(500, 500, 100, 100, 100, 10, spr_enemy1);//size, stats and image to go with it.

			}
			if (Player.y > p_south)
			{
				//at south side
				Player.y = p_north;
				level_cur += lvl_yoff;
				randomSpawnEnemy(500, 500, 100, 100, 100, 10, spr_enemy1);//size, stats and image to go with it.

			}
			if (lvlbool)//has changed level
			{
				
				level_cur += level_count;//allows negative wrap.
				level_cur %= level_count;//prevents overflow.
				//printf("lvl=%i\n",level_cur);
				level_get_name(level_cur,mapstr_location);
				
				mapvisit[level_cur/32] |= (Uint32)(1<<level_cur%32);
			}
		}
		else
		{
			Player.anim_spd_cur = 0;
			Player.anim_cur = 0;
		}
		if (glob_vk_space|glob_vk_enter)
		{
			splashintro_bool=0;
		}

		/*
		Post-update of inputs.
		*/
		Player.xprevious = Player.x;
		Player.yprevious = Player.y;
		
		/*
		General updates.
		*/
		//water stuff
		// Update water particles (rain drops)
        for (int i = 0; i < MAX_WATER_PARTICLES; i++) 
		{
            if (waterParticles[i].active) 
			{
                waterParticles[i].y += waterParticles[i].speed;

                // Check if particle has reached the bottom of the window
                if (waterParticles[i].y > screen_h) {
                    // Randomly deactivate particle (remove randomness for constant rain)
                    if (rand() % 100 < 5) {
                        waterParticles[i].active = 0; // Set active to 0 (false)
                    } else {
                        createWaterParticle(i, screen_w, screen_h);
                    }
                }
            }
        }
		//Timekeeping.
		time_clock_fps += 1*time_clock_fps_multiplier;
		//time_clock += (time_clock_fps>=time_clock_fps_max);
		while (time_clock_fps>=time_clock_fps_max)
		{
			time_clock++;
			time_clock_fps-=time_clock_fps_max;
		}
		weekday = (weekday+(time_clock>=time_clock_max))%7;
		monthday = (monthday+(time_clock>=time_clock_max))%28;
		time_clock %= time_clock_max;
		time_clock_fps %= time_clock_fps_max;
		
		//Temperature.
		char newtempstr[6];//[5]=NULL
		strcpy(newtempstr,temp_str);
		newtempstr[0] = (char)(temp_cur>=0)?("+"[0]):("-"[0]);
		newtempstr[1] = (char)(temp_cur/10)+48;
		newtempstr[2] = (char)(temp_cur%10)+48;
		newtempstr[3] = (char)("*"[0]);
		newtempstr[4] = (char)(temp_mode==0)?(67):(70);
		//newtempstr[4] = (char)(temp_mode==0)?("C"[0]):("F"[0]);
		
		/*
		Draw to the screen.
		*/
		//Drawing settings.
		draw_clear(renderer,c_black);
		draw_set_color(renderer,c_white);
		
		//UI areas.
		draw_rectangle_color(renderer,//left
			0,0,
			win_game_x,screen_h,
			c_orange);
		draw_image(renderer,0,0,win_game_x,screen_h,spr_hudshade);
		draw_rectangle_color(renderer,//middle
			win_game_x,0,
			screen_w-win_game_x,screen_h,
			c_rose);
		draw_rectangle_color(renderer,//right
			screen_w-win_game_x,0,
			screen_w,screen_h,
			c_orange);
		draw_image(renderer,screen_w-win_game_x,0,screen_w,screen_h,spr_hudshade);
		//SDL_RenderCopy(renderer,png,NULL,NULL);//test: texture fills whole renderer.
		
		//UI.
		int uix,uiy;
		int tc=c_black;
		//UI Left (player).
		uix = gw; 
		uiy = gh;
		if (!splashintro_bool)
		{
			draw_text_color(renderer,uix,uiy,font_ascii_w*gw,font_ascii_h*gh,font_ascii,"HEALTH:",font_ascii_w,font_ascii_h,tc);
			uiy += font_ascii_h*gh;
			//health bar
			//SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
			//draw_set_color(renderer,c_white);
			int maxWidth = 200; // Replace this with the maximum width of the health bar
			int maxHeight = 20; //this too.
			int currentWidth = (health * maxWidth) / maxHealth;
			// Render the red health bar
			/*
			SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
			SDL_Rect healthBarRect = { 0, 200, currentWidth, 20 };
			SDL_RenderFillRect(renderer, &healthBarRect);
			/**/
			//int col=make_color_hsv((int)lerp(120.0,0.0,(double)health/(double)maxHealth),255,255);
			int col=c_red;
			draw_rectangle_color(renderer,0,uiy,maxWidth,uiy+maxHeight,c_black);
			draw_rectangle_color(renderer,0,uiy,currentWidth,uiy+maxHeight,col);
			uiy += maxHeight;
			
			//Nutrients
			int nx,nd;
			nx=0;
			nd=32;
			for (int i=0; i<4; i++)
			{
				//placeholder 2/2
				// draw_image_part(renderer,uix,uiy+nx,uix+nd*gw,uiy+nx+nd*gh,spr_nutrients,i*nd,0,nd,nd);
				// draw_text_color(renderer,uix+nd*gw,uiy+nx+nd/2,font_ascii_w*gw,font_ascii_h*gh,font_ascii,mux_str(i,"Fat","Carbs","Protein","Vitamin"),font_ascii_w,font_ascii_h,tc);
				// nx += nd*gw;
			}
			// SDL_RenderPresent(renderer);
		}
		//UI Right (world).
		uix = gw+win_game_x2;
		uiy = gh;
		if (!splashintro_bool)
		{
			//Level.
			char *lvlstrold = "LVL: XYZ/511";
			char lvlstrnew[strlen(lvlstrold)];//a hard-coded value too small causes a code-overwrite bug that messes with player movement!
			strcpy(lvlstrnew,lvlstrold);
			//lvlstrnew[7] = ((char)level_cur)+48;//7 is "X" above.
			word lc = (word)level_cur;//note: "signed char" causes bugs out in the [128,255] range because it is out of range; "unsigned char" allows 255.
			lvlstrnew[string_pos("X",lvlstrnew)] = ((lc/100)%10) + 48;//48="0"
			lvlstrnew[string_pos("Y",lvlstrnew)] = ((lc/10 )%10) + 48;//%10 maps to 0-9.
			lvlstrnew[string_pos("Z",lvlstrnew)] = ((lc/1  )%10) + 48;//
			//sprintf(lvlstr,"Level:#",level_cur);
			
			draw_text_color(renderer,uix,uiy                ,font_ascii_w*gw,font_ascii_h*gh,font_ascii,lvlstrnew,font_ascii_w,font_ascii_h,tc);
			draw_text_color(renderer,uix,uiy+font_ascii_h*gh,font_ascii_w*gw,font_ascii_h*gh,font_ascii,mapstr_location,font_ascii_w,font_ascii_h,tc);
			
			
			//Map.
			int mapx1,mapy1,mapx2,mapy2;
			mapx1=uix;
			mapy1=uiy+font_ascii_h*2*gh;
			mapx2=mapx1+256;
			mapy2=mapy1+256;
			draw_image(renderer,mapx1,mapy1,mapx2,mapy2,spr_map);
			//Discovered map levels.
			for (int i=0; i<256; i++)
			{
				if (!BG(mapvisit[i/32],i%32))
				{
					draw_image(renderer,
					(int)lerp((double)mapx1,(double)mapx2,(double)(i%16+0)/16.0),
					(int)lerp((double)mapy1,(double)mapy2,(double)(i/16+0)/16.0),
					(int)lerp((double)mapx1,(double)mapx2,(double)(i%16+1)/16.0),
					(int)lerp((double)mapy1,(double)mapy2,(double)(i/16+1)/16.0),
					spr_mapicon_unknown);
				}
			}
			//Location crosshair lines.			
			int mcx=(int)lerp((double)mapx1,(double)mapx2,(double)(BGG(lc,4,0)/16.0));
			draw_rectangle_color(renderer,mcx-1,mapy1,mcx+1,mapy2,c_red);//ver(x)
			int mcy=(int)lerp((double)mapy1,(double)mapy2,(double)(BGG(lc,4,1)/16.0));
			draw_rectangle_color(renderer,mapx1,mcy-1,mapx2,mcy+1,c_red);//hor(y)
			if (!(lc>>8))
			{
				draw_rectangle_color(renderer,mcx,mcy,
					(int)lerp((double)mapx1,(double)mapx2,(double)((BGG(lc,4,0)+1)/16.0)),
					(int)lerp((double)mapy1,(double)mapy2,(double)((BGG(lc,4,1)+1)/16.0)),
					c_red);
			}
			//Timekeeping.
			//Digital clock.
			int coff=0;
			int clocky2 = mapy2+32*gh;
			draw_set_color(renderer,tc);
			for (int i=0; i<5; i++)
			{
				int clo = mux_int(i,(time_clock/600),(time_clock/60)%10,737,(time_clock/10)%6,time_clock%10);
				if (i != 2)
				{
				draw_image_part(renderer,
					uix+(i+0)*16*gw+coff,mapy2,
					uix+(i+1)*16*gw+coff,clocky2,
					spr_clock_digital,
					clo*16,0,
					16,32);
				coff += gw;
				}
				else
				{
					draw_text_color(renderer,uix+2*16*gw,mapy2,font_ascii_w*gw,font_ascii_h*gh,font_ascii,":",font_ascii_w,font_ascii_h,tc);
				}
			}
			draw_set_color(renderer,c_white);
			//char ct[10];
			//const char time_clock_str="Daytime";
			//strcpy(ct,time_clock_str);
			int ct=0;
			if (clock_is_between(time_clock, 0,0, 5,59)) {ct=0;}
			if (clock_is_between(time_clock, 6,0,11,59)) {ct=1;}
			if (clock_is_between(time_clock,12,0,17,59)) {ct=2;}
			if (clock_is_between(time_clock,18,0,23,59)) {ct=3;}
			//placeholder 1/2
			
			// draw_text_color(renderer,
			// 	uix,clocky2+gh,
			// 	font_ascii_w*gw,font_ascii_h*gh,
			// 	font_ascii,mux_str(ct,timestr_a,timestr_b,timestr_c,timestr_d),
			// 	font_ascii_w,font_ascii_h,tc);
			
			//Weekday.
			char wc[2];
			double wf=1.0;
			draw_rectangle_color(renderer,
				uix+font_ascii_w*weekday*gw+(int)(wf*weekday*gw),clocky2+gh,
				uix+font_ascii_w*weekday*gw+(int)(wf*weekday*gw)+font_ascii_w*gw,clocky2+gh+font_ascii_h*gh,
				c_red);
			for (int i=0; i<7; i++)
			{
				int wcol=i==6?c_red:c_black;
				wcol=i==weekday?c_white:wcol;
				wc[0]=weekday_string[i];
				draw_text_color(renderer,
					uix+font_ascii_w*i*gw+(int)(wf*i*gw),clocky2+gh,
					font_ascii_w*gw,font_ascii_h*gh,
					font_ascii,wc,
					font_ascii_w,font_ascii_h,wcol);
			}
			//Day of the month.
			month_str[0]=((monthday+1)/10)+48;
			month_str[1]=((monthday+1)%10)+48;
			month_str[2]=100+((monthday+1)%20>=4?16:mux_int((monthday+1)%20,16,15,10,14));
			month_str[3]=100+((monthday+1)%20>=4? 4:mux_int((monthday+1)%20, 4,16, 0, 0));
			draw_rectangle_color(renderer,
				uix+8*font_ascii_w*gw,clocky2+gh,
				uix+8*font_ascii_w*gw+4*font_ascii_w*gw,clocky2+gh+font_ascii_h*gh,
				c_blue);
			draw_text_color(renderer,
				uix+8*font_ascii_w*gw,clocky2+gh,
				font_ascii_w*gw,font_ascii_h*gh,
				font_ascii,month_str,
				font_ascii_w,font_ascii_h,
				c_aqua);
			
			//Temperature.
			int tempy1,tempy2;
			tempy1=clocky2+gh+font_ascii_h*gh;
			tempy2=tempy1+48*gh;
			//int dgc=draw_get_color();
			//draw_set_color(renderer,c_blue);
			draw_image(renderer,uix,tempy1,uix+16*gw,tempy2,spr_thermometer);
			//draw_set_color(renderer,dgc);
			draw_text_color(renderer,uix+48,(int)lerp((double)tempy1,(double)tempy2,0.25),font_ascii_w*gw,font_ascii_h*gh,font_ascii,newtempstr,font_ascii_w,font_ascii_h,tc);
			
			//
			
			
		}
		//Game area.
		int d = win_game_tile_dim;
		int defcol=make_color_hsv(0,0,((int)(get_timer()))/16);
		for (int k=0; k<level_layers; k++)
		{
			for (int j=0; j<win_game_tile_num; j++)
			{
				for (int i=0; i<win_game_tile_num; i++)
				{
					int ij = i+j*win_game_tile_num+k*lvl_off_obj;
					int x1,y1,x2,y2;
					x1 = win_game_x + (i+0)*gw*win_game_tile_dim;
					y1 = win_game_y + (j+0)*gh*win_game_tile_dim;
					x2 = win_game_x + (i+1)*gw*win_game_tile_dim;
					y2 = win_game_y + (j+1)*gh*win_game_tile_dim;
					
					//int defcol = mux_int(ij%3,c_red,c_green,c_blue);
					
					int off = ij + level_size*level_cur;
					int tex = level_data[off];
					if (k==0)
					{
						draw_rectangle_color(renderer,x1,y1,x2,y2,defcol);//will show if image drawing below fails.
						draw_image_part(renderer,x1,y1,x2,y2,spr_tileset,d*(tex%win_game_tile_num),d*(tex/win_game_tile_num),d,d);
					}
					else if (k==1)
					{
						//animated
						if ((tex>=0x10) && (tex <=0x1F))
						{
							int fr=16;
							int di=(tex<0x12)?(60):(120);
							int at=(int)get_timer();
							SDL_Texture *spr;
								 if (tex==0x10) {spr=spr_water;}
							else if (tex==0x11) {spr=spr_water_shallow;}
							else if (tex==0x12) {spr=spr_lava;}
							else if (tex==0x13) {spr=spr_lava_shallow;}
							else {spr=spr_water;}
							draw_image_part(renderer,x1,y1,x2,y2,spr,d*((at/di)%fr),0,d,d);
						}
						//unhandled.
						else
						{
							if (tex!=0)//lazy hack.
							{
								tex+=0x100;
								draw_image_part(renderer,x1,y1,x2,y2,spr_tileset,d*(tex%win_game_tile_num),d*(tex/win_game_tile_num),d,d);
							}
						}
					}
				}
			}
		}
		//Player.
		draw_image_part(renderer,
			Player.x,Player.y,
			Player.x+d*gw,Player.y+d*gh,
			sprstrip_player,
			(Player.facedir*d*Player.anim_max)+(Player.anim_cur*d*1),0,
			d,d);
		
		//test pop up chat box (button)
		if (buttonVis >= 1) 
		{
			// Update the buttonRect using the chat box position and size
			buttonRect.x = Player.x + 60;
			buttonRect.y = Player.y - 120;

			// Render the filled rectangle using the updated buttonRectPtr
			SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
			SDL_RenderFillRect(renderer, buttonRectPtr);

			//Render the lines to make it look chat box-like
			// Draw a line from the player's mouth to the chat box
			SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255); // white color for the line
			SDL_RenderDrawLine(renderer, Player.x+45, Player.y-15, buttonRectPtr->x + buttonRectPtr->w*0.1, buttonRectPtr->y + buttonRectPtr->h / 4);//top line
			SDL_RenderDrawLine(renderer, Player.x+45, Player.y-15, buttonRectPtr->x + buttonRectPtr->w*0.3, buttonRectPtr->y + buttonRectPtr->h / 1);//bottom line
			// Render text on the button (chat box)
			SDL_Color textColor = { 0, 0, 0 }; // black text color
			int maxTextWidth = buttonRectPtr->w - 10; // Adjust this value to leave some padding for the text
			// Use TTF_RenderText_Blended_Wrapped with error-checking
			SDL_Surface* textSurface = TTF_RenderText_Blended_Wrapped(font, buttonText, textColor, maxTextWidth);
			if (!textSurface) 
			{
				// Handle error: Unable to render text

				textSurface = TTF_RenderText_Solid(font, "Error: Text Rendering Failed", textColor);
			}
			// Calculate the actual text dimensions
			int textWidth = textSurface->w;
			int textHeight = textSurface->h;
			// Position the text in the center of the button (chat box)
			int textX = buttonRectPtr->x + (buttonRectPtr->w - textWidth) / 2;
			int textY = buttonRectPtr->y + (buttonRectPtr->h - textHeight) / 2;
			// Create the destination SDL_Rect for the text
			SDL_Rect textRect = { textX, textY, textWidth, textHeight };
			// Render the text on the button (chat box)
			SDL_Texture* textTexture = SDL_CreateTextureFromSurface(renderer, textSurface);
			SDL_RenderCopy(renderer, textTexture, NULL, &textRect);

			// Cleanup
			SDL_FreeSurface(textSurface);
			SDL_DestroyTexture(textTexture);
		}
		// Rendering the global enemy(use for boss fight?? keep code unless decided we do not need.)

		// if (globalEnemy != NULL && globalEnemy->health > 0)
		// {
			
		// 	float directionX = Player.x - globalEnemy->x;
        // 	float directionY = Player.y - globalEnemy->y;
		// 	float distanceToPlayer = distance(Player.x, Player.y, globalEnemy->x, globalEnemy->y);
		// 	//stop the enemy when within the selected units (125)
		// 	if(distanceToPlayer > 110){
		// 		// Normalize the direction vector (make it a unit vector)
		// 		if (distanceToPlayer != 0) {
		// 			directionX /= distanceToPlayer;
		// 			directionY /= distanceToPlayer;
		// 		}
		// 		float enemySpeed = 2.0; //adjust this value to control the enemy's speed
		// 		globalEnemy->x += directionX * enemySpeed;
		// 		globalEnemy->y += directionY * enemySpeed;
		// 	}
		// 	SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
		// 	SDL_Rect enemyRect = { globalEnemy->x, globalEnemy->y, globalEnemy->width, globalEnemy->height };
		// 	// SDL_RenderFillRect(renderer, &enemyRect);
		// 	draw_image(renderer, globalEnemy->x, globalEnemy->y, globalEnemy->x + globalEnemy->width, globalEnemy->y + globalEnemy->height, globalEnemy->texture);
		// 	if (checkCollision(playerHitbox, enemyRect)) {
        //     // If the player collides with the enemy, apply damage to the player
        //     printf("Player collided with enemy!\n");
        //     int enemyDamage = globalEnemy->dmg; // Adjust this value as needed
        //     damageMe(enemyDamage);
		// 	// Bump back the enemy when they run into us
        //     int bumpDistance = 50;
        //     float bumpDirectionX = directionX;
        //     float bumpDirectionY = directionY;
        //     if (distanceToPlayer != 0) {
        //         bumpDirectionX /= distanceToPlayer;
        //         bumpDirectionY /= distanceToPlayer;
        //     }
        //     globalEnemy->x -= bumpDirectionX * bumpDistance;
        //     globalEnemy->y -= bumpDirectionY * bumpDistance;
        // }
		// }
		//for all randomly spawned enemies.

		for (int i = 0; i < MAX_ENEMIES; i++) {
		struct Enemy* currentEnemy = &enemies[i];
		if (currentEnemy->health > 0) {
			// Enemy movement logic
			float directionX = Player.x - currentEnemy->x;
			float directionY = Player.y - currentEnemy->y;
			float distanceToPlayer = distance(Player.x, Player.y, currentEnemy->x, currentEnemy->y);

			// Stop the enemy when within the selected units (125)
			if (distanceToPlayer > 110) {
				// Normalize the direction vector (make it a unit vector)
				if (distanceToPlayer != 0) {
					directionX /= distanceToPlayer;
					directionY /= distanceToPlayer;
				}
				if(quizOn==false){//enemies won't move when quiz is active
				float enemySpeed = 2.0; // Adjust this value to control the enemy's speed
				currentEnemy->x += directionX * enemySpeed;
				currentEnemy->y += directionY * enemySpeed;
				}
			}

        // Rendering
        SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
        SDL_Rect enemyRect = { currentEnemy->x, currentEnemy->y, currentEnemy->width, currentEnemy->height };
        draw_image(renderer, currentEnemy->x, currentEnemy->y, currentEnemy->x + currentEnemy->width, currentEnemy->y + currentEnemy->height, currentEnemy->texture);

        // Collision detection with the player
        if (checkCollision(playerHitbox, enemyRect)) {
            // If the player collides with the enemy, apply damage to the player
            printf("Player collided with enemy!\n");
            int enemyDamage = currentEnemy->dmg; // Adjust this value as needed
            damageMe(enemyDamage);

            // Bump back the enemy when they run into the player
            int bumpDistance = 50;
            float bumpDirectionX = directionX;
            float bumpDirectionY = directionY;
            if (distanceToPlayer != 0) {
                bumpDirectionX /= distanceToPlayer;
                bumpDirectionY /= distanceToPlayer;
            }
            currentEnemy->x -= bumpDirectionX * bumpDistance;
            currentEnemy->y -= bumpDirectionY * bumpDistance;
        	}
    	}
	}

		// Resetting the global enemy
		if (globalEnemy != NULL && globalEnemy->health <= 0) {
    		resetEnemy(globalEnemy);
		}
		//first quiz. Rename variables for alpha.

		//Second quiz
		if(level_cur==2){
			if(quiz2Called==false){//boolean check so the quiz doesn't open every time they hit level 2.
				quizQuestion="Greetings wanderer\nAnswer my riddle to pass through\n Which of these macronutrients contains the most calories per gram";answerA="1. Carbohydrate";answerB="2. Fat";answerC="3. Protein";
				quiz2Called=true;	quizOn=true;correctAnswer=2;Player.move_spd=0; quizLoopOn=true;
			}
		}//third quiz (currently used for testing, change for real game.) 
		//Quiz turns on once the player enters level_curr==3, for other quizzes just copy this code and change the trigger. 
		if(level_cur==3){
			if(quiz3Called==false){//boolean check so the quiz doesn't open every time they hit level 3.
				quizQuestion="Greetings wanderer\nAnswer my riddle to pass through\n Should this quiz work?";answerA="1. yes";answerB="2. no";answerC="3. definitely not";
				quiz3Called=true;	quizOn=true;correctAnswer=1;Player.move_spd=0; quizLoopOn=true; quizInfo="";
			}
		}
		//loop to go through three questions relating to food data. (copy this but replace questions.txt with data from other dataset if we choose.)
		if(quizLoopOn){
			if(quizQNum==1){//if first question
			if(userAnswer==0){}//keeps it from looping infinite
			else if(userAnswer==correctAnswer){
				quizInfo="Correct";
    			updateQuizDataFromRandomLine("questions.txt", &quizQuestion, &answerA, &answerB, &answerC, &userAnswer, &correctAnswer, &quizInfoHolder);quizQNum++;score+=500;
			}
			else{
				quizInfo="false";
				updateQuizDataFromRandomLine("questions.txt", &quizQuestion, &answerA, &answerB, &answerC, &userAnswer, &correctAnswer, &quizInfoHolder);quizQNum++;score+=0;
			}
			}else if(quizQNum==2){//if second question
			if(userAnswer==0){}
			else if(userAnswer==correctAnswer){
				quizInfo="correct";
    			updateQuizDataFromRandomLine("questions.txt", &quizQuestion, &answerA, &answerB, &answerC, &userAnswer, &correctAnswer, &quizInfoHolder);quizQNum++;score+=500;
			}
			else{
				quizInfo="false";
				updateQuizDataFromRandomLine("questions.txt", &quizQuestion, &answerA, &answerB, &answerC, &userAnswer, &correctAnswer, &quizInfoHolder);quizQNum++;score+=0;
			}		
			}
			else if(quizQNum==3){//if third question
			if(userAnswer==0){}
			else if(userAnswer==correctAnswer){
				quizInfo="correct";
    			updateQuizDataFromRandomLine("questions.txt", &quizQuestion, &answerA, &answerB, &answerC, &userAnswer, &correctAnswer, &quizInfoHolder);quizQNum++;score+=500;
			}
			else{
				quizInfo="false";
				updateQuizDataFromRandomLine("questions.txt", &quizQuestion, &answerA, &answerB, &answerC, &userAnswer, &correctAnswer, &quizInfoHolder);quizQNum++;score+=0;
			}		
			}
			//end quiz
			else if(quizQNum=4){quizQuestion=" ",answerA="press 1 2 or 3 to exit";answerB="";answerC="";//quiz finished
			if(userAnswer==0){}else if(userAnswer==1||userAnswer==2||userAnswer==3){quizOn=false;Player.move_spd=3*4;quizQNum=1;quizInfo="";userAnswer=0;quizLoopOn=false;}
			}
		}	
		
		//render the quiz popup
if (quizOn) {
    // Render the quiz popup with a beige square background
    SDL_Color bgColor = { 200, 200, 200 }; // Beige color
    SDL_SetRenderDrawColor(renderer, bgColor.r, bgColor.g, bgColor.b, 255);
    int popupWidth = 400; // Adjust this value to change the width of the popup
    int popupHeight = 200; // Adjust this value to change the height of the popup
    int popupX = (800 - popupWidth) / 2 + 300; // Center the popup horizontally and move it right by 300 pixels
    int popupY = (600 - popupHeight) / 2;
    SDL_Rect popupRect = { popupX, popupY, popupWidth, popupHeight };
    SDL_RenderFillRect(renderer, &popupRect);

    // Render the quiz header just above the quiz text
    SDL_Color headerColor = { 0, 0, 255 }; // blue header color
    int maxHeaderWidth = popupWidth - 20; // Adjust this value based on your desired maximum header width
    SDL_Surface* headerSurface = TTF_RenderText_Blended_Wrapped(font, quizHeader, headerColor, maxHeaderWidth);
    SDL_Texture* headerTexture = SDL_CreateTextureFromSurface(renderer, headerSurface);
    // Calculate the position to center the header inside the beige square background
    int headerWidth = headerSurface->w;
    int headerHeight = headerSurface->h;
    int headerX = popupX + (popupWidth - headerWidth) / 2;
    int headerY = popupY + 10; // Adjust the value 10 for the vertical position of the header
    // Render the header
    SDL_Rect headerRect = { headerX, headerY, headerWidth, headerHeight };
    SDL_RenderCopy(renderer, headerTexture, NULL, &headerRect);
    // Cleanup
    SDL_FreeSurface(headerSurface);
    SDL_DestroyTexture(headerTexture);

    // Combine quizInfo and quizQuestion into one string separated by newline
char combinedText[1024];
snprintf(combinedText, sizeof(combinedText), "\n%s\n%s\n%s\n%s\n%s", quizInfo, quizQuestion, answerA, answerB, answerC);

// Render the quiz text inside the beige square background
SDL_Color textColor = { 0, 0, 0 }; // black text color
int maxTextWidth = popupWidth - 20; // Adjust this value based on your desired maximum text width
SDL_Surface* textSurface = TTF_RenderText_Blended_Wrapped(font, combinedText, textColor, maxTextWidth);
if (textSurface == NULL) {
    printf("Error creating text surface: %s\n", TTF_GetError());
    return;
}

SDL_Texture* textTexture = SDL_CreateTextureFromSurface(renderer, textSurface);
if (textTexture == NULL) {
    printf("Error creating text texture: %s\n", SDL_GetError());
    SDL_FreeSurface(textSurface);
    return;
}

// Calculate the position to center the text inside the beige square background
int textWidth = textSurface->w;
int textHeight = textSurface->h;
int textX = popupX + (popupWidth - textWidth) / 2;
int textY = popupY + (popupHeight - textHeight) / 2;
// Render the text
SDL_Rect textRect = { textX, textY, textWidth, textHeight };
SDL_RenderCopy(renderer, textTexture, NULL, &textRect);
// Cleanup
SDL_FreeSurface(textSurface);
SDL_DestroyTexture(textTexture);
}
		// Draw water particles
        for (int i = 0; i < MAX_WATER_PARTICLES; i++) 
		{
            if (waterParticles[i].active) 
			{
                draw_image(renderer, waterParticles[i].x, waterParticles[i].y, waterParticles[i].x + 5, waterParticles[i].y + 15, spr_water);
            }
        }

		/*
		Overlay Drawing.
		*/
		//Splash intro screen.
		if (splashintro_bool)
		{
			int off=64*gw;
			draw_rectangle_color(renderer,0,0,screen_w,screen_h,0);
			draw_image(renderer,win_game_x-off,win_game_y,win_game_x2+off,win_game_y2,splashintro_img1);
			//Visual effect.
			int imax=16;
			int xo,yo,cc;
			int dgc=draw_get_color();
			int timer=(int)get_timer();
			int ttx,tty,ttc;
			ttx=timer/10%360;
			tty=90+75*dcos(timer/10%360);
			ttc=timer/10%256;
			for (int i=0; i<imax; i++)
			{
				xo=-imax*gw*dcos(ttx)+i*gw*dcos(ttx);
				yo=-imax*gh*dsin(tty)+i*gh*dsin(tty);
				//cc=(int)lerp(0.0,255.0,(double)((double)i/(double)(imax-1)));
				//draw_set_color(renderer,make_color_rgb(cc,cc,cc));
				draw_set_color(renderer,make_color_hsv(ttc,32,(int)lerp(0.0,255.0,(double)i/(double)(imax-1))));
				draw_image(renderer,
					win_game_x-off+xo,win_game_y+yo,
					win_game_x2+off+xo,win_game_y2+yo,
					splashintro_img2);
			}
			//Logo.
			draw_image(renderer,win_game_x-off,win_game_y,win_game_x2+off,win_game_y2,splashintro_img3);
			draw_set_color(renderer,dgc);
			//Press space to continue.
			int xx,yy;
			xx=384;
			yy=32;
			if (timer/60%8>=4)
			{
				draw_text_color(renderer,xx,yy,font_ascii_w*gw,font_ascii_h*gh,font_ascii,splashintro_string,font_ascii_w,font_ascii_h,c_yellow);
			}
			//Copyright.
			xx=64;
			yy=8;
			int yoff;
			char ch[2];
			imax=splashintro_slen2;
			for (int i=0; i<imax; i++)
			{
				yoff=8*gh*dcos((timer/10%360)+lerp(0.0,720.0,(double)i/(double)(imax-1)));
				ch[0]=splashintro_string_copyright[i];
				draw_text_color(renderer,xx+font_ascii_w*gw*i,win_game_y+win_game_h-yy+yoff-font_ascii_h*gh,font_ascii_w*gw,font_ascii_h*gh,font_ascii,ch,font_ascii_w,font_ascii_h,c_white);
			}
			
		}
		
		// Clear the renderer
        SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
		// Render the score at the bottom left
        char scoreText[20];
        snprintf(scoreText, sizeof(scoreText), "Score: %d", score);
        SDL_Surface* surface = TTF_RenderText_Solid(font, scoreText, scoreColour);
        SDL_Texture* texture = SDL_CreateTextureFromSurface(renderer, surface);
        SDL_Rect textRect = { 10, 720, surface->w, surface->h };
        SDL_RenderCopy(renderer, texture, NULL, &textRect);
        SDL_FreeSurface(surface);
        SDL_DestroyTexture(texture);
		
		//Render to screen.
		SDL_RenderPresent(renderer);
		SDL_Delay(16);//60 fps.
		
		//End of main loop.
	}
	printf("...exited main loop.\n");

	//Shut down SDL
	free(waterParticles);
	TTF_CloseFont(font);
	SDL_DestroyTexture(spr_grass);
	SDL_DestroyTexture(spr_sand);
	SDL_DestroyTexture(spr_water);
	SDL_DestroyTexture(spr_lava);
	SDL_DestroyTexture(spr_water_shallow);
	SDL_DestroyTexture(spr_lava_shallow);
	SDL_DestroyTexture(spr_tileset);
	SDL_DestroyTexture(spr_map);
	SDL_DestroyTexture(spr_mapicon_unknown);
	SDL_DestroyTexture(sprstrip_player);
	SDL_DestroyTexture(splashintro_img1);
	SDL_DestroyTexture(splashintro_img2);
	SDL_DestroyTexture(splashintro_img3);
	SDL_DestroyTexture(font_ascii);
	SDL_DestroyTexture(spr_clock_digital);
	SDL_DestroyTexture(spr_thermometer);
	SDL_DestroyTexture(spr_hudshade);
	SDL_DestroyTexture(spr_nutrients);
	SDL_DestroyTexture(spr_enemy1);
	IMG_Quit();
	
	//SDL_FreeWAV(&audio_spec);
	SDL_CloseAudioDevice(deviceid);
    SDL_FreeWAV(wavbuffer);
	
	SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();

    //Wait n milliseconds jic something went wrong (so that printfs can be read)
    SDL_Delay(500);
    
	return 0;
	
    /* Upon an error, print message and quit properly */
error:
    fprintf(stderr, "%s Error returned: %s\n", errmsg, SDL_GetError());
    SDL_Quit();
    exit(EXIT_FAILURE);
}
