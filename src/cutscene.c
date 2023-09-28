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
		if ((cutscene_cur >= (5*cutscene_spd)) && keyboard_check_anykey())
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
	if (level_cur == 0x00) {cutscene_start(1);}//Andrew introduction.
	
	if (level_cur == 0x100) {cutscene_start(0);}//Find the albatross egg.
	//if ((level_cur == 0x0C3) && (savegame_get_collectable(0))) {cutscene_start(1);}//Andrew introduction.
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
		
		//Local.
		int xx,yy,ww,hh;
		int bc=0xC0FFFF;
		int tc=c_black;
		switch (cutscene_id)
		{
			case 0://find the albatross egg.
			{
				bc=0xFFC0C0;
				tc=c_black;
				switch ((int)(fp*100.0))
				{
					
					case 10: {cutscene_set_text("This cellar surely is dark!");} break;
					case 25: {cutscene_set_text("");} break;
					case 30: {cutscene_set_text("There should be an albatross egg here.");} break;
					case 45: {cutscene_set_text("");} break;
					case 50: {cutscene_set_text("I should safely return it to its home on the Otago peninsula.");} break;
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
				switch ((int)(fp*100.0))
				{
					
					case 10: {cutscene_set_text("I am Andrew, and that albatross egg is mine!");} break;
					case 25: {cutscene_set_text("");} break;
					case 30: {cutscene_set_text("I have made all the food in Dunedin come to life!");} break;
					case 45: {cutscene_set_text("");} break;
					case 50: {cutscene_set_text("I hereby declare this city for Duneatin'.");} break;
					case 65: {cutscene_set_text("");} break;
					case 70: {cutscene_set_text("If you do come, you will get a piece of chocolate!");} break;
					case 85: {cutscene_set_text("");} break;
					case 90: {cutscene_set_text("There is nothing you can do to stop me, haha!");} break;
					//case : {cutscene_set_text("");} break;
					
				}
				draw_rectangle_color(renderer,0,0,screen_w,screen_h,bc);
				xx=683;
				yy=128;
				ww=2*gw*32;
				hh=2*gh*32;
				draw_image(renderer,xx,yy,xx+ww,yy+hh,spr_boss_a);
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