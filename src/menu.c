/**
* @file menu.c
* @brief Implements menu.h
*/

#include "everything.h"

byte menucursor_cur = 0;
const byte menucursor_max = 4;

void menu_init()
{
	
}
void menu_free()
{
	
}
void menu_input()
{
	if (splashintro_bool)
	{
		int ud = keyboard_check_pressed(glob_vk_right)-keyboard_check_pressed(glob_vk_left);
		menucursor_cur = (menucursor_cur+ud)%menucursor_max;
		if (keyboard_check_pressed(glob_vk_space)|keyboard_check_pressed(glob_vk_enter))
		{
			int mc = (int)(menucursor_cur);
			switch (mc)
			{
				case 0: case 1:
				{
					splashintro_bool=0;
					if (mc == 1) {savegame_new();}
					savegame_load();
					break;
				} 
				case 2: {printf("Settings (unfinished)\n");} break;
				case 3: {running=0;} break;
				//case 3: {} break;
			}
		}
	}
}
void menu_draw()
{
	
}