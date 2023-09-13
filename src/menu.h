/**
* @file menu.h
* @brief Defines main menu behaviour.
*/

#ifndef menu_h
#define menu_h

#include "everything.h"

byte menucursor_cur;
const byte menucursor_max;

void menu_init();
void menu_free();
void menu_input();
void menu_draw();

#endif