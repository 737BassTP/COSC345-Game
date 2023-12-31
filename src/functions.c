/**
* @file functions.c
* @brief Implements functions.h
*/

//Definitions.
#include "everything.h"

//Constants.
const int c_black    = 0x000000;///< color: black
const int c_dkgray   = 0x404040;///< color: dark gray
const int c_gray     = 0x808080;///< color: gray
const int c_ltgray   = 0xC0C0C0;///< color: light gray
const int c_white    = 0xFFFFFF;///< color: white
const int c_red      = 0x0000FF;///< color: red
const int c_orange   = 0x0080FF;///< color: orange
const int c_yellow   = 0x00FFFF;///< color: yellow
const int c_lime     = 0x00FF80;///< color: lime
const int c_green    = 0x00FF00;///< color: green
const int c_slime    = 0x80FF00;///< color: slime
const int c_aqua     = 0xFFFF00;///< color: turquoise
const int c_sky      = 0xFF8000;///< color: sky
const int c_blue     = 0xFF0000;///< color: blue
const int c_purple   = 0xFF0080;///< color: purple
const int c_fuchsia  = 0xFF00FF;///< color: fuchsia
const int c_rose     = 0x8000FF;///< color: rose
//const int c_ = 0x;///< color: 
//const int c_ = 0x;///< color: 

//Global variables.
int glob_draw_alpha = 255;///< 
int glob_draw_color = c_white;///< 
int glob_alarm_ids[ALARM_ID_MAX];

double lerp(double from,double to,double percentage)
{
	/**
	* @brief Performs linear interpolation between two points.
	* @param from Start point.
	* @param to End point.
	* @param percentage Percentage between start- and end point.
	* @return A value that is a given percentage between start and end.
	* @example lerp
	*/
	
	return from+(to-from)*percentage;
}
int make_color_rgb(int r,int g,int b)
{
	/**
	* @brief Generates a color using R,G,B.
	* @param r Red
	* @param g Green
	* @param b Blue
	* @return A 24-bit color.
	* @example make_color_rgb
	*/
	
	return (r&0xFF)|((g&0xFF)<<8)|((b&0xFF)<<16);
}
int make_color_hsv(int h,int s,int v)
{
	/**
	* @brief Generates a color using H,S,V
	* @note Source: https://stackoverflow.com/questions/3018313/algorithm-to-convert-rgb-to-hsv-and-hsv-to-rgb-in-range-0-255-for-both/14733008#14733008
	* @param h Hue
	* @param s Saturation
	* @param v Value
	* @return A 24-bit color.
	* @example make_color_hsv
	*/
	
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
	/**
	* @brief Returns the current Alpha value used in drawing.
	* @return Alpha
	* @example draw_get_alpha
	*/
	
	return glob_draw_alpha;
}
int draw_get_color()
{
	/**
	* @brief Returns the current Color value used in drawing.
	* @return Color
	* @example draw_get_color
	*/
	
	return glob_draw_color;
}
void draw_set_color(SDL_Renderer* renderer,int bgr)
{
	/**
	* @brief Set a drawing color.
	* @param renderer Which SDL renderer to set the drawing color.
	* @param bgr Color.
	* @return void
	* @example draw_set_color
	*/
	
	glob_draw_color = bgr&0xFFFFFF;
	SDL_SetRenderDrawColor(renderer,bgr&0xFF,(bgr>>8)&0xFF,(bgr>>16)&0xFF,draw_get_alpha());
}
void draw_set_alpha(SDL_Renderer* renderer,int alpha)
{
	/**
	* @brief set alpha
	* @param renderer sdl
	* @param alpha value
	* @return void
	* @example draw_set_alpha
	*/
	
	glob_draw_alpha = alpha&0xFF;
	int bgr = draw_get_color();
	SDL_SetRenderDrawColor(renderer,bgr&0xFF,(bgr>>8)&0xFF,(bgr>>16)&0xFF,alpha);
}
void draw_clear(SDL_Renderer* renderer,int bgr)
{
	/**
	* @brief Fill a renderer with a color.
	* @param renderer sdl
	* @param bgr color
	* @return void
	* @example draw_clear
	*/
	
	draw_set_color(renderer,bgr);
	SDL_RenderClear(renderer);//fills whole with draw-color.	
}
void draw_clear_alpha(SDL_Renderer* renderer,int bgr,int alpha)
{
	/**
	* @brief Fill a renderer with a color and an alpha.
	* @param renderer sdl
	* @param bgr Color
	* @param alpha Alpha
	* @return void
	* @example draw_clear_alpha
	*/
	
	draw_set_alpha(renderer,alpha);
	draw_clear(renderer,bgr);//invokes above function to avoid duplicate functionality.
}
void draw_rectangle(SDL_Renderer *renderer,int x1,int y1,int x2,int y2)
{
	/**
	* @brief Draws a rectangle.
	* @param renderer sdl
	* @param x1 left
	* @param y1 top
	* @param x2 right
	* @param y2 bottom
	* @return void
	* @example draw_rectangle
	*/
	
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
	/**
	* @brief Draws a rectangle with color.
	* @param renderer sdl
	* @param x1 left
	* @param y1 top
	* @param x2 right
	* @param y2 bottom
	* @param bgr Color
	* @return void
	* @example draw_rectangle_color
	*/
	
	int tmp=draw_get_color();
	draw_set_color(renderer,bgr);
	draw_rectangle(renderer,x1,y1,x2,y2);
	draw_set_color(renderer,tmp);
}
void draw_image(SDL_Renderer *renderer,int x1,int y1,int x2,int y2,SDL_Texture *texture)
{
	/**
	* @brief Draws an image.
	* @param renderer sdl
	* @param x1 left
	* @param y1 top
	* @param x2 right
	* @param y2 bottom
	* @param texture Texture
	* @return void 
	* @example draw_image
	*/
	
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
	/**
	* @brief Draws an image.
	* @param renderer sdl
	* @param x1 left
	* @param y1 top
	* @param x2 right
	* @param y2 bottom
	* @param texture Texture
	* @param left leftside in image
	* @param top topside in image
	* @param width width from leftside
	* @param height height from topside
	* @return void 
	* @example draw_image
	*/
	
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
	/**
	* @brief Draw text using a sprite font.
	* @param renderer sdl
	* @param x x
	* @param y y
	* @param w width
	* @param h height
	* @param font sprite font
	* @param str string
	* @param fontw width of image
	* @param fonth height of image
	* @return void
	* @example draw_text
	*/
	
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
				//i += 1;
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
	/**
	* @brief Draw colorized text using a sprite font.
	* @param renderer sdl
	* @param x x
	* @param y y
	* @param w width
	* @param h height
	* @param font sprite font
	* @param str string
	* @param fontw width of image
	* @param fonth height of image
	* @param color Color
	* @return void
	* @example draw_text_color
	*/
	
	int dgc=draw_get_color();
	draw_set_color(renderer,color);
	draw_text(renderer,x,y,w,h,font,str,fontw,fonth);
	draw_set_color(renderer,dgc);
}
long int file_get_size(FILE* fil)
{
	/**
	* @brief Find out how big a file is in bytes.
	* @param fil File
	* @return long int
	* @example file_get_size
	*/
	long int tellcur=ftell(fil);
	long int ret;
	fseek(fil,0,SEEK_END);
	ret=ftell(fil);
	fseek(fil,tellcur,SEEK_SET);
	return ret;
}
int mux_int(int nth,...)
{
	/**
	* @brief Multiplexer for integers.
	* @param nth Which argument to return.
	* @param ... The arguments to choose from.
	* @return int
	* @example mux_int
	*/
	
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
	/**
	* @brief Multiplexer for char pointers.
	* @param nth Which argument to return.
	* @param ... The arguments to choose from.
	* @return int
	* @example mux_str
	*/
	
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
	/**
	* @brief Multiplexer for SDL textures.
	* @param nth Which argument to return.
	* @param ... The arguments to choose from.
	* @return int
	* @example mux_sdltex
	*/
	
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
	/**
	* @brief Positional demultiplexer for integers.
	* @param num How many arguments this functions gets.
	* @param val The value to match.
	* @param ... The arguments to choose from.
	* @return int
	* @example pos_int
	*/
	
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
	/**
	* @brief return the nth bit of value
	* @param val Value
	* @param nth nth bit
	* @return int 
	* @example BG
	*/
	
	return (val>>nth)&1;
}
int BGG(int val,int size,int nth)
{
	/**
	* @brief return the nth group of bits of a value.
	* @param val Value
	* @param size Group size
	* @param nth nth bit
	* @return int 
	* @example BGG
	*/
	
	return (val>>(nth*size))&((1<<size)-1);
}
int BS(int val,int nth,int new)
{
	return (val&(~(1<<nth)))|(new<<nth);
}
int BT(int val,int nth)
{
	return val^=(1<<nth);
}
int sqr(int v)
{
	/**
	* @brief Square (multiply by itself)
	* @param v Value
	* @return int 
	* @example sqr
	*/
	
	return v*v;
}
int mean_int(int num,...)
{
	/**
	* @brief Calculate the average/mean value of "num" integers.
	* @param num How many integers this function receives.
	* @param ... The integers the function shall use.
	* @return The average/mean value of all integers passed to this function.
	* @example int value = mean_int(2,6,8); //returns (6+8)/2 = 7
	*/
	va_list args;
	va_start(args,num);
	int ret = 0;
	for (int i=0; i<num; i++)
	{
		ret += va_arg(args,int);
	}
	va_end(args);
	ret /= num;
	return ret;
}
int min_int(int num,...)
{
	va_list args;
	va_start(args,num);
	int ret = va_arg(args,int);
	int tmp;
	for (int i=1; i<num; i++)
	{
		tmp = va_arg(args,int);
		ret = (ret>tmp)?(tmp):(ret);
	}
	va_end(args);
	return ret;
}
int max_int(int num,...)
{
	va_list args;
	va_start(args,num);
	int ret = va_arg(args,int);
	int tmp;
	for (int i=1; i<num; i++)
	{
		tmp = va_arg(args,int);
		ret = (ret<tmp)?(tmp):(ret);
	}
	va_end(args);
	return ret;
}
double degtorad(double deg)
{
	/**
	* @brief Degrees to radians.
	* @param deg Degrees
	* @return double
	* @example degtorad
	*/
	
	return (deg/180)*PI;
}
double radtodeg(double rad)
{
	/**
	* @brief Radians to degrees.
	* @param rad Radians
	* @return double
	* @example radtodeg
	*/
	
	return (rad/PI)*180;
}
double dcos(double deg)
{
	/**
	* @brief cosine of a value in degrees
	* @param deg Degrees
	* @return double
	* @example dcos
	*/
	
	return cos(degtorad(deg));
}
double dsin(double deg)
{
	/**
	* @brief sine of a value in degrees
	* @param deg Degrees
	* @return double
	* @example dcos
	*/
	
	return sin(degtorad(deg));
}
Uint64 get_timer()
{
	/**
	* @brief How long since program started?
	* @return Uint64
	* @example get_timer
	*/
	
	return SDL_GetTicks64();
}
void alarm_set(int aid,int val)
{
	aid %= ALARM_ID_MAX;
	glob_alarm_ids[aid]=val;
}
int alarm_get(int aid)
{
	aid %= ALARM_ID_MAX;
	return glob_alarm_ids[aid];
}
void alarm_update()
{
	for (int i=0; i<ALARM_ID_MAX; i++)
	{
		if (glob_alarm_ids[i] > -1)
		{
			glob_alarm_ids[i]--;
		}
	}
}
int alarm_trigger(int aid)
{
	aid %= ALARM_ID_MAX;
	return (alarm_get(aid) == 0);
}
int point_in_rectangle(int px,int py,int rx1,int ry1,int rx2,int ry2)
{
	/**
	* @brief Test if a point is inside a rectangle.
	* @param px x of point
	* @param py y of point 
	* @param rx1 leftside of rect
	* @param ry1 topside of rect
	* @param rx2 rightside of rect
	* @param ry2 bottomside of rect
	* @return int 
	* @example point_in_rectangle
	*/
	
	return ((px>=rx1 && px<rx2) && (py>=ry1 && py<ry2));
}
int rectangle_in_rectangle(int sx1,int sy1,int sx2,int sy2,int dx1,int dy1,int dx2,int dy2)
{
	/**
	* @brief Test if a rectangle is intersecting a rectangle.
	* @param sx1 leftside of source rect
	* @param sy1 topside of source rect
	* @param sx2 rightside of source rect
	* @param sy2 bottomside of source rect
	* @param dx1 leftside of destination rect
	* @param dy1 topside of destination rect
	* @param dx2 rightside of destination rect
	* @param dy2 bottomside of destination rect
	* @return int 
	* @example rectangle_in_rectangle
	*/
	
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
	/**
	* @brief Return the position of a substring in another string.
	* @param substr Substring
	* @param str String
	* @return int 
	* @example string_pos
	*/
	
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
	/**
	* @brief arctan2 in degrees.
	* @param y y
	* @param x x
	* @return double
	* @example darctan2
	*/
	
	return radtodeg(atan2(y,x));
}
double cartodir(int x,int y)
{
	/**
	* @brief Convert a cartesian vector to a polar direction.
	* @param x x
	* @param y y
	* @return double
	* @example cartodir
	*/
	
	//return (darctan2(y,x)+360.0)%360.0;
	double ret = darctan2(y,x)+360.0;
	if (ret >= 360.0) {ret -= 360.0;}
	return ret;
}
void game_level_load(int lvl,int lvlmax)
{
	/**
	* @brief unfinished
	* @param lvl
	* @param lvlmax
	* @return void
	* @example game_level_load
	*/
	
	//done below.
}
void level_load_any(byte arr[],struct gameobject Objects[],int level,int siz)
{
	//printf("(this,cur,prev) = %i,%i,%i\n",level,level_cur,level_prev);
	level_cur = level;
	if (level_cur >= 256)
	{
		deactivateAllWaterParticles();
		deactivateAllSnowParticles();
	}
	else
	{
		activateAllWaterParticles();
		activateAllSnowParticles();
	}
	savegame_set_mapvisit(level_cur);
	level_load_objects(arr,Objects,level_cur,siz);
	audio_music_level(level_cur,level_prev);
	level_get_name(level_cur,mapstr_location);
	discordant_cur = ((int)rand())%discordant_max;//alcohol movement randomizer.
	//printf("discordant=%i\n",discordant_cur);
	if (((level_cur<256)&&(level_prev>=256))||((level_cur>=256)&&(level_prev<256)))//if (level_cur < 256)
	{
		//clear all dungeon gates while in Overworld.
		for (int i=0; i<8; i++) {savegame_set_gate(i,0);}
	}
	level_prev = level_cur;//finished handling level loading.
}
void level_load_objects(byte arr[],struct gameobject Objects[],int level,int siz)
{
	/**
	* @brief Load objects.
	* @param arr level.dat
	* @param Objects array of structs
	* @param level current level
	* @param siz 256
	* @return void
	* @example level_load_objects
	*/
	
	int offtil,offobj;
	offtil=level*siz;
	offobj=lvl_off_obj+level*siz;
	offobj=0x20000+offtil;
	//printf("offobj = %i\n",offobj);
	
	int objid,implicit;
	for (int i=0; i<siz; i++)
	{
		//Explicit objects.
		objid = 0x100+(int)arr[offobj+i];
		
		//Implicit objects.
		implicit = (int)arr[offtil+i];
		if ((implicit>=0x60) && (implicit<=0x6F)) {objid=0x13F;}//invisible wall.
		if ((implicit>=0x74) && (implicit<=0x7F)) {objid=0x13F;}//invisible wall.
		if ((implicit>=0x80) && (implicit<=0x83)) {objid=0x13F;}//invisible wall.
		if ((implicit==0x61) || (implicit==0x81) || (implicit==0xA1)) {objid=0x116;}//door object (overwrite invisible wall).
		
		//Requires memory allocation.
		if ((objid>=0x134) && (objid<=0x135))
		{
			//Directional enemies.
			printf("directional enemy is unfinished.\n");
		}
		
		//Skippable.
		int doskip=0;
		for (int j=0; j<16; j++) {doskip |= ((objid == 0x180+j) && savegame_get_collectable(j));}//collectables have been picked up.
		
		//Apply.
		if (!doskip)
		{
			Objects[i].tileid = objid;
		}
	}
	//
	
}
void level_load_file(byte arr[],int siz,int count,int layers)
{
	/**
	* @brief level_load
	* @param arr arr
	* @param siz siz
	* @param count count
	* @param layers layers
	* @return void
	* @example level_load
	*/
	
	FILE *fil = fopen("level.dat","rb");
	for (int i=0; i<siz*count*layers; i++)
	{
		arr[i] = 0;
	}
	fread(arr,siz*count*layers,1,fil);
	fclose(fil);
	//level_load_objects(arr,gameobject,level_cur,siz);
}
int level_load_door(int level,int pos)
{
	/**
	* @brief Level load when hitting a door.
	* @param pos Position
	* @param level Level
	* @return int (9-bit lvl and 8-bit pos)
	* @example level_load_door
	*/
	
	//For best results, the forward match is from overworld to underworld, and backward match is from underworld to overworld.
	//This only matters when editing link.dat.
	
	FILE *fil = fopen("link.dat","rb");
	int fillen = (int)file_get_size(fil);//note: downcast from long int to int.
	int fpos,flev;
	int error=1;
	int ret=0;
	for (int i=0; i<fillen; i+=4)
	{
		//Forward match.
		flev = (int)fgetc(fil);
		fpos = (int)fgetc(fil);
		if ((pos == fpos) && (level == flev))
		{
			flev = (int)fgetc(fil)+0x100;
			fpos = (int)fgetc(fil);
			ret = (flev&0x1FF)|((fpos&0xFF)<<9);
			error=0; break;
		}
		else
		{
			//Backward match.
			flev = (int)fgetc(fil)+0x100;
			fpos = (int)fgetc(fil);
			if ((pos == fpos) && (level == flev))
			{
				fseek(fil,(long int)(-4),SEEK_CUR);
				flev = (int)fgetc(fil);
				fpos = (int)fgetc(fil);
				ret=(flev&0x1FF)|((fpos&0xFF)<<9);
				error=0; break;
			}
		}
	}
	fclose(fil);
	if (!error) {return ret;}
	return 0x1FFFF;
}
char* level_get_name(int lvl,char* ret)
{
	/**
	* @brief level_get_name
	* @param lvl
	* @param ret
	* @return char pointer
	* @example level_get_name
	*/
	
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
int brl(int v,int a,int b)
{
	return (int)(((v<<a)&((1<<b)-1))|(v>>(b-a)));
}

//distance to player
float distance(float x1, float y1, float x2, float y2)
{
	/**
	* @brief distance between two points.
	* @param x1 x1
	* @param y1 y1
	* @param x2 x2
	* @param y2 y2
	* @return float
	* @example distance
	*/
	
    float dx = x2 - x1;
    float dy = y2 - y1;
    return sqrt(dx * dx + dy * dy);
}
// Function to check for collision between two rectangles; returns true (non-zero) if the rectangles collide, false (0) otherwise
int checkCollision(SDL_Rect rect1, SDL_Rect rect2)
{
	/**
	* @brief checkCollision
	* @param rect1 rect1
	* @param rect2 rect2 
	* @return int 
	* @example checkCollision
	*/
	
    return (rect1.x < rect2.x + rect2.w &&
            rect1.x + rect1.w > rect2.x &&
            rect1.y < rect2.y + rect2.h &&
            rect1.y + rect1.h > rect2.y) ||
           (rect2.x < rect1.x + rect1.w &&
            rect2.x + rect2.w > rect1.x &&
            rect2.y < rect1.y + rect1.h &&
            rect2.y + rect2.h > rect1.y);
}






