/**
* @file audio.c
* @brief Implements audio.h
*/

#include "everything.h"

Mix_Music *music = NULL;
Mix_Chunk *sfx = NULL;

void audio_init()
{
	//https://www.youtube.com/watch?v=MAeqfcLy64w
	//https://wiki.libsdl.org/SDL2_mixer/CategoryAPI
	Mix_Init(0);
	Mix_OpenAudio(44100,MIX_DEFAULT_FORMAT,2,1024);//2=stereo, 1024=chunksize
}
void audio_free()
{
	Mix_Quit();
}
void audio_music_volume(double vol)
{
	Mix_VolumeMusic((int)lerp((double)0,(double)MIX_MAX_VOLUME,(double)vol));
}
char* audio_music_idtostr(int id)
{
	//TODO: Fix compiler bug that converts const char* to int without error.
	char *ret="";
	//if (strcmp(str,"audio/overworld.wav")==0) {ret=0;}
	switch (id)
	{
		case 0: {ret="audio/mus_overworld.wav";} break;
		case 1: {ret="audio/mus_dungeon1.wav";} break;
		//case : {ret="audio/mus_.wav"} break;
		//case : {ret="audio/mus_.wav"} break;
		//case : {ret="audio/mus_.wav"} break;
		
	}
	return ret;
}
void audio_music_play_string(char *file)
{
	if (music != NULL)
	{
		Mix_FreeMusic(music);
	}
	music = Mix_LoadMUS(file);
	if (!music)
	{
		printf("mixer: music_play_string error:%s\n",Mix_GetError());
	}
	Mix_PlayMusic(music,-1);
}
void audio_music_play_id(int id)
{
	if (music != NULL)
	{
		Mix_FreeMusic(music);
	}
	music = Mix_LoadMUS(audio_music_idtostr(id));
	if (!music)
	{
		printf("mixer: music_play_id error:%s\n",Mix_GetError());
	}
	Mix_PlayMusic(music,-1);
}
void audio_music_level(int lc,int lp)
{
	if ((lc<256) && (lp<256)) {return;}//Still in Overworld.
	if ((lc>=256) && (lp>=256)) {return;}//Still in Underworld.
	
	//Overworld.
	if (lc<256)
	{
		audio_music_play_id(0);
	}
	//Underworld.
	if (lc>=256)
	{
		audio_music_play_id(1);
	}
	
}
char* audio_sfx_idtostr(int id)
{
	char *ret;
	switch (id)
	{
		case 0: {ret="audio/sfx_explode.wav"; break;}
		case 1: {ret="audio/sfx_playerdied.wav"; break;}
		//case : {ret="audio/sfx_.wav"} break;
		//case : {ret="audio/sfx_.wav"} break;
		//case : {ret="audio/sfx_.wav"} break;
	}
	return ret;
}
void audio_sfx_play_id(int id,int chn)
{
	if (!Mix_Playing(chn))
	{
		if (sfx != NULL)
		{
			Mix_FreeChunk(sfx);
		}
		sfx = Mix_LoadWAV(audio_sfx_idtostr(id));
		//Calls Mix_LoadWAV_RW instead since that is what existed when the build-tools were compiled.
		
		if (!sfx)
		{
			printf("mixer: sfx_play_id error:%s\n",Mix_GetError());
		}
		
		Mix_PlayChannel(chn,sfx,0);//last -1 is indef looping, 0 is once.
	}
}