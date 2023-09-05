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
int audio_music_strtoid(char* str);
void audio_music_play(char *file);
void audio_music_level(int lc,int lp);

#endif

/*
//Audio.
typedef struct
{
    Uint8* buffer;
    Uint32 length;
    Uint32 position;
} AudioData;//must be typedef'ed like this to fix compile bugs.

void audioCallback(void* userdata, Uint8* stream, int len);
void play_WAV(const char* wavfile,SDL_AudioSpec spec,Uint8 *wavbuffer,int wavlength);

SDL_AudioDeviceID deviceid;
Uint8 *wavbuffer;

*/