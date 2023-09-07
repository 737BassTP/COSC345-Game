/**
* @file audio.h
* @brief Defines behaviour for sound, audio, and music.
*/

#ifndef audio_h
#define audio_h

#include "everything.h"

Mix_Music *music;
Mix_Chunk *sfx0;

void audio_init();
void audio_free();
void audio_music_volume(double vol);
int audio_music_idtostr(int id);
void audio_music_play_string(char *file);
void audio_music_play_id(int id);
void audio_music_level(int lc,int lp);
char* audio_sfx_idtostr(int id);
//void audio_sfx_play_string(char *file,int chn);
void audio_sfx_play_id(int id,int chn);

#endif
