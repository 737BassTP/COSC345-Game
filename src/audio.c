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
		case 0: {ret="audio/mus_overworld.wav"; break;}
		case 1: {ret="audio/mus_dungeon_final.wav"; break;}
		case 2: {ret="audio/mus_dungeon_alcohol.wav"; break;}
		case 3: {ret="audio/mus_dungeon_carbohydrate.wav"; break;}
		case 4: {ret="audio/mus_dungeon_protein.wav"; break;}
		case 5: {ret="audio/mus_dungeon_fat.wav"; break;}
		//case : {ret="audio/mus_.wav"; break;}
		//case : {ret="audio/mus_.wav"; break;}
		
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
	//NOTE: Music changes only when travelling between Over- and Underworld.
	
	//Overworld.
	int id=0;
	if (lc<256)
	{
		id=0;
	}
	//Underworld.
	if (lc>=256)
	{
		//Houses.
		//Caves.
		id=1;
		
		//Dungeons.
		if (lc>=352)
		{
			if (lc>=400)
			{
				id=2+((lc-400)/4)%4;
			}
			else
			{
				id=1;
			}
		}
	}
	audio_music_play_id(id);
}
char* audio_sfx_idtostr(int id)
{
	char *ret;
	switch (id)
	{
		case 0: {ret="audio/sfx_explode.wav"; break;}
		case 1: {ret="audio/sfx_playerdied.wav"; break;}
		case 2: {ret="audio/sfx_pickup.wav"; break;}
		case 3: {ret="audio/sfx_button.wav"; break;}
		case 4: {ret="audio/sfx_gate.wav"; break;}
		case 5: {ret="audio/sfx_keyhole.wav"; break;}
		case 6: {ret="audio/sfx_teleport.wav"; break;}
		case 7: {ret="audio/sfx_block.wav"; break;}
		//case : {ret="audio/sfx_.wav"; break;}
		
	}
	return ret;
}
void audio_sfx_play_id(int id,int chn)
{
	if (Mix_Playing(chn))
	{
		Mix_HaltChannel(chn);
	}
	//if (!Mix_Playing(chn))
	if (1)
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
		Mix_Volume(chn,(int)(lerp(0.0,(double)MIX_MAX_VOLUME,(double)0.25)));
	}
}