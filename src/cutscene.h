/**
* @file cutscene.h
* @brief Defines cutscenes..
*/

#ifndef cutscene_h
#define cutscene_h

#include "everything.h"

byte cutscene_txt[1024];
int cutscene_bool;
int cutscene_id;
/*
int cutscene_ispaused;
int cutscene_cur;
*/
//int cutscene_;

void cutscene_set_text(const char *tmp);
void cutscene_start(int id);
void cutscene_stop();
void cutscene_pause();
void cutscene_unpause();
void cutscene_update();
void cutscene_trigger();
void cutscene_populate();
void cutscene_draw();

#endif