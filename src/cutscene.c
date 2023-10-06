/**
* @file cutscene.c
* @brief Implements cutscene.h
*/

#include "everything.h"

int cutscene_bool=0;
int cutscene_ispaused=0;
int cutscene_id=0;
int cutscene_cur=0;
int cutscene_spd=1;
int cutscene_max=255;

void cutscene_set_text(const char *tmp)
{
	//char *tmp="I am Andrew, and that albatross egg is mine!";
	for (int i=0; i<1024; i++)
	{
		cutscene_txt[i]=NULL;
	}
	int tl=strlen(tmp);
	for (int i=0; i<tl; i++)
	{
		cutscene_txt[i]=tmp[i];
	}
}
void cutscene_start(int id)
{
	if (id != 63)
	{
		if (savegame_get_cutscene(id))
		{
			//printf("cutscene already seen!\n(id=%i)\n",id);
			return;
		}
		savegame_set_cutscene(id);
	}
	
	cutscene_bool=1;
	cutscene_ispaused=0;
	cutscene_id=id;
	cutscene_cur=0;
	FILE *cf=fopen("cutscene.dat","rb");
	fseek(cf,(long int)id,SEEK_SET);
	cutscene_max=60*fgetc(cf);
	fclose(cf);
	cutscene_set_text("");
}
void cutscene_stop()
{
	cutscene_bool=0;
}
void cutscene_pause()
{
	cutscene_ispaused=1;
}
void cutscene_unpause()
{
	cutscene_ispaused=0;
}
void cutscene_update()
{
	cutscene_trigger();
	
	if (cutscene_bool)
	{
		if (cutscene_cur >= cutscene_max)
		{
			cutscene_bool=0;
		}
		if (!cutscene_ispaused)
		{
			cutscene_cur += cutscene_spd;
		}
		//skip cutscene
		//if ((cutscene_cur >= (120*cutscene_spd)) && keyboard_check_anykey())
		if (keyboard_check_pressed(glob_vk_space)||keyboard_check_pressed(glob_vk_enter))
		{
			cutscene_start(63);
		}
	}
	else
	{
		cutscene_ispaused=0;
		cutscene_cur=0;
	}
}
void cutscene_trigger()
{
	if ((level_cur == 0x112) && (!savegame_get_collectable(0))) {cutscene_start(0);}//Find the albatross egg.
	if ((level_cur == 0x0C2) && (savegame_get_collectable(0))) {cutscene_start(1);}//Andrew introduction.
	if ((level_cur == 0x1F1) && (!savegame_get_cutscene(2))) {cutscene_start(2);}//enter dungeon c
	if ((level_cur == 0x1F4) && (!savegame_get_cutscene(3))) {cutscene_start(3);}//enter dungeon m
	if ((level_cur == 0x1F9) && (!savegame_get_cutscene(4))) {cutscene_start(4);}//enter dungeon s
	if ((level_cur == 0x1FD) && (!savegame_get_cutscene(5))) {cutscene_start(5);}//enter dungeon t
	if ((level_cur == 0x187) && (!savegame_get_cutscene(6))) {cutscene_start(6);}//enter dungeon a
	//moved into main
	/*
	if ((level_cur == 0x193) && (savegame_get_collectable(4))) {cutscene_start(7);}//won dungeon c
	if ((level_cur == 0x197) && (savegame_get_collectable(5))) {cutscene_start(8);}//won dungeon m
	if ((level_cur == 0x198) && (savegame_get_collectable(6))) {cutscene_start(9);}//won dungeon s
	if ((level_cur == 0x19F) && (savegame_get_collectable(7))) {cutscene_start(10);}//won dungeon t
	if ((level_cur == 0x167) && (savegame_get_collectable(8))) {cutscene_start(11);}//won dungeon a
	/**/
	
	//if () {cutscene_start();}//
	//if () {cutscene_start();}//
	
}
void cutscene_populate()
{
	switch (cutscene_id)
	{
		case -1: {} break;
	}
}
void cutscene_draw()
{
	if (cutscene_bool)
	{
		double prog=(double)cutscene_cur/(double)cutscene_max;
		float fp=(float)prog;
		//printf("prog=%lf\n",prog);
		
		//TODO: Move text into a file, to avoid the need for recompiling for small textual changes.
		
		//Local.
		int xx,yy,ww,hh;
		int bc=0xC0FFFF;
		int tc=c_black;
		switch (cutscene_id)
		{
			case 0://find the albatross egg.
			{
				bc=0x800000;
				tc=c_white;
				switch ((int)(fp*100.0))
				{
					case 10: {cutscene_set_text("This cellar surely is quite dark!");} break;
					case 25: {cutscene_set_text("");} break;
					case 30: {cutscene_set_text("There should be an albatross egg here.");} break;
					case 45: {cutscene_set_text("");} break;
					case 50: {cutscene_set_text("I must safely return it to its home on the peninsula.");} break;
					case 65: {cutscene_set_text("");} break;
					case 70: {cutscene_set_text("Don't tell anyone, but this egg has magical powers!");} break;
					case 85: {cutscene_set_text("");} break;
					case 90: {cutscene_set_text("It could be fatal if held in the hands of evilness.");} break;
					//case : {cutscene_set_text("");} break;
					
				}
				draw_rectangle_color(renderer,0,0,screen_w,screen_h,bc);
				xx=683;
				yy=128;
				ww=2*gw*32;
				hh=2*gh*32;
				//draw_image(renderer,xx,yy,xx+ww,yy+hh,spr_boss_a);
			} break;
			case 1://andrew introduction.
			{
				switch ((int)(fp*300.0))
				{
					case 0: {cutscene_set_text("Stop right there; I am Andrew, and you have my egg!!!");} break;
					case 25: {cutscene_set_text("");} break;
					case 30: {cutscene_set_text("I have been looking for this egg for ages and a half!");} break;
					case 55: {cutscene_set_text("");} break;
					case 60: {cutscene_set_text("I have made all the food in Dunedin come to life...");} break;
					case 85: {cutscene_set_text("");} break;
					case 90: {cutscene_set_text("...and with this egg; do you know what? ...");} break;
					case 115: {cutscene_set_text("");} break;
					case 120: {cutscene_set_text("ALL THE FOOD IN THE WORLD CAN COME ALIVE!!!");} break;
					case 145: {cutscene_set_text("");} break;
					case 150: {cutscene_set_text("There is nothing you can do to stop me!");} break;
					case 175: {cutscene_set_text("");} break;
					case 180: {cutscene_set_text("If you are nearby, why not come for a visit...");} break;
					case 205: {cutscene_set_text("");} break;
					case 210: {cutscene_set_text("...to witness the albatross egg devoured for its power!");} break;
					case 235: {cutscene_set_text("");} break;
					case 240: {cutscene_set_text("Oh, and if you do come, I have some chocolate for you!");} break;
					case 265: {cutscene_set_text("");} break;
					case 270: {cutscene_set_text("Now fuck off would you; I have important things to do!!!");} break;
					case 295: {cutscene_set_text("");} break;
					//case : {cutscene_set_text("");} break;
					
				}
				draw_rectangle_color(renderer,0,0,screen_w,screen_h,bc);
				xx=683;
				yy=128;
				ww=2*gw*32;
				hh=2*gh*32;
				draw_image(renderer,xx,yy,xx+ww,yy+hh,spr_boss_a);
			} break;
			case 2://enter dungeon: campbell
			{
				switch ((int)(fp*60.0))
				{
					case 0: {cutscene_set_text("I am Campbell and this is the Alcohol Dungeon.");} break;
					case 25: {cutscene_set_text("");} break;
					case 30: {cutscene_set_text("You are intoxicated and will move in strange ways.");} break;
					case 55: {cutscene_set_text("");} break;
					
				}
				draw_rectangle_color(renderer,0,0,screen_w,screen_h,bc);
				xx=683;
				yy=128;
				ww=2*gw*32;
				hh=2*gh*32;
				draw_image(renderer,xx,yy,xx+ww,yy+hh,spr_boss_c);
			} break;
			case 3://enter dungeon: matthew
			{
				switch ((int)(fp*60.0))
				{
					case 0: {cutscene_set_text("I am Matthew and this is the Sugar Dungeon.");} break;
					case 25: {cutscene_set_text("");} break;
					case 30: {cutscene_set_text("Have you become obese yet?");} break;
					case 55: {cutscene_set_text("");} break;
				}
				draw_rectangle_color(renderer,0,0,screen_w,screen_h,bc);
				xx=683;
				yy=128;
				ww=2*gw*32;
				hh=2*gh*32;
				draw_image(renderer,xx,yy,xx+ww,yy+hh,spr_boss_m);
			} break;
			case 4://enter dungeon: sean
			{
				switch ((int)(fp*60.0))
				{
					case 0: {cutscene_set_text("I am Sean and this is the Protein Dungeon.");} break;
					case 25: {cutscene_set_text("");} break;
					case 30: {cutscene_set_text("Have you had a kidney failure yet?");} break;
					case 55: {cutscene_set_text("");} break;
				}
				draw_rectangle_color(renderer,0,0,screen_w,screen_h,bc);
				xx=683;
				yy=128;
				ww=2*gw*32;
				hh=2*gh*32;
				draw_image(renderer,xx,yy,xx+ww,yy+hh,spr_boss_s);
			} break;
			case 5://enter dungeon: thomas
			{
				switch ((int)(fp*60.0))
				{
					case 0: {cutscene_set_text("I am Thomas and this is the Fat Dungeon.");} break;
					case 25: {cutscene_set_text("");} break;
					case 30: {cutscene_set_text("Have you had a heart attack yet?");} break;
					case 55: {cutscene_set_text("");} break;
				}
				draw_rectangle_color(renderer,0,0,screen_w,screen_h,bc);
				xx=683;
				yy=128;
				ww=2*gw*32;
				hh=2*gh*32;
				draw_image(renderer,xx,yy,xx+ww,yy+hh,spr_boss_t);
			} break;
			case 6://enter dungeon: andrew
			{
				switch ((int)(fp*90.0))
				{
					case 0: {cutscene_set_text("I am Andrew and this is the Chocolate Dungeon.");} break;
					case 25: {cutscene_set_text("");} break;
					case 30: {cutscene_set_text("Did you come here to scoff chocolate?");} break;
					case 55: {cutscene_set_text("");} break;
					case 60: {cutscene_set_text("You cannot thwart my plans for the world! Hahaha!");} break;
					case 85: {cutscene_set_text("");} break;
				}
				draw_rectangle_color(renderer,0,0,screen_w,screen_h,bc);
				xx=683;
				yy=128;
				ww=2*gw*32;
				hh=2*gh*32;
				draw_image(renderer,xx,yy,xx+ww,yy+hh,spr_boss_a);
			} break;
			case 7://won dungeon: campbell
			{
				switch ((int)(fp*50.0))
				{
					case 0: {cutscene_set_text("Oh no! My imperial stout is gone...");} break;
					//case : {cutscene_set_text("");} break;
				}
				draw_rectangle_color(renderer,0,0,screen_w,screen_h,bc);
				xx=683;
				yy=128;
				ww=2*gw*32;
				hh=2*gh*32;
				draw_image(renderer,xx,yy,xx+ww,yy+hh,spr_boss_c);
			} break;
			case 8://won dungeon: matthew
			{
				switch ((int)(fp*50.0))
				{
					case 0: {cutscene_set_text("Oh no! My strawberry cake is gone..");} break;
					//case : {cutscene_set_text("");} break;
				}
				draw_rectangle_color(renderer,0,0,screen_w,screen_h,bc);
				xx=683;
				yy=128;
				ww=2*gw*32;
				hh=2*gh*32;
				draw_image(renderer,xx,yy,xx+ww,yy+hh,spr_boss_m);
			} break;
			case 9://won dungeon: sean
			{
				switch ((int)(fp*50.0))
				{
					case 0: {cutscene_set_text("Oh no! My lamb rump is gone...");} break;
					//case 49: {level_load_any(level_data,Objects,0xB3,256);} break;
				}
				draw_rectangle_color(renderer,0,0,screen_w,screen_h,bc);
				xx=683;
				yy=128;
				ww=2*gw*32;
				hh=2*gh*32;
				draw_image(renderer,xx,yy,xx+ww,yy+hh,spr_boss_s);
			} break;
			case 10://won dungeon: thomas
			{
				switch ((int)(fp*50.0))
				{
					case 0: {cutscene_set_text("Oh no! My olive oil is gone...");} break;
					//case 49: {level_load_any(level_data,Objects,0xB3,256);} break;
				}
				draw_rectangle_color(renderer,0,0,screen_w,screen_h,bc);
				xx=683;
				yy=128;
				ww=2*gw*32;
				hh=2*gh*32;
				draw_image(renderer,xx,yy,xx+ww,yy+hh,spr_boss_t);
			} break;
			case 11://won dungeon: andrew
			{
				switch ((int)(fp*90.0))
				{
					case 0: {cutscene_set_text("Oh no! My chocolate is gone...");} break;
					case 25: {cutscene_set_text("");} break;
					case 30: {cutscene_set_text("Unbelieavble! I am dethroned!");} break;
					case 55: {cutscene_set_text("");} break;
					case 60: {cutscene_set_text("See you in a parallell universe.");} break;
					case 85: {cutscene_set_text("");} break;
				}
				draw_rectangle_color(renderer,0,0,screen_w,screen_h,bc);
				xx=683;
				yy=128;
				ww=2*gw*32;
				hh=2*gh*32;
				draw_image(renderer,xx,yy,xx+ww,yy+hh,spr_boss_a);
			} break;
			
			case 12:// ?
			{
				switch ((int)(fp*300.0))
				{
					case 0: {cutscene_set_text("empty");} break;
					//case : {cutscene_set_text("");} break;
				}
				draw_rectangle_color(renderer,0,0,screen_w,screen_h,bc);
				xx=683;
				yy=128;
				ww=2*gw*32;
				hh=2*gh*32;
				//draw_image(renderer,xx,yy,xx+ww,yy+hh,spr_boss_c);
			} break;
			
			case 63://skip cutscene cutscene
			{
				bc=c_black;
				tc=c_white;
				switch ((int)(fp*100.0))
				{
					case 0: {cutscene_set_text("Skipping cutscene...");} break;
				}
				draw_rectangle_color(renderer,0,0,screen_w,screen_h,bc);
			} break;
			default:
			{
				printf("cutscene id %i has no draw calls.\n",cutscene_id);
				cutscene_bool=0;
			}
		}
		xx = gw*1;
		yy = screen_h-font_ascii_h*gh*2;
		draw_text_color(renderer,xx,yy,font_ascii_w*gw,font_ascii_h*gh,font_ascii,cutscene_txt,font_ascii_w,font_ascii_h,tc);

		//Global.
		int www=screen_w;
		int hhh=2*gh;
		int LL=(int)lerp((double)0,(double)www,prog);
		draw_rectangle_color(renderer,0,0,www,hhh,c_red);
		draw_rectangle_color(renderer,0,0,LL,hhh,c_lime);
	}
}