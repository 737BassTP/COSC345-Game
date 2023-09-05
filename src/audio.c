/**
* @file audio.c
* @brief Implements audio.h
*/

#include "everything.h"

Mix_Music *music = NULL;
Mix_Chunk *sfx0 = NULL;

void audio_init()
{
	//https://www.youtube.com/watch?v=MAeqfcLy64w
	//https://wiki.libsdl.org/SDL2_mixer/CategoryAPI
	Mix_Init(0);
	Mix_OpenAudio(44100,MIX_DEFAULT_FORMAT,2,1024);//2=stereo, 1024=chunksize
	
	Mix_Chunk *sfx0 = NULL;//Mix_LoadWAV("music.wav");
	if (!sfx0)
	{
		printf("sfx0 error:%s\n",Mix_GetError());
	}
	

	//Mix_PlayChannel(-1,sound,-1);//last -1 is indef looping.
	
	
}
void audio_free()
{
	Mix_Quit();
}
void audio_music_volume(double vol)
{
	Mix_VolumeMusic((int)lerp((double)0,(double)MIX_MAX_VOLUME,(double)vol));
}
int audio_music_strtoid(char* str)
{
	int ret=-1;
	if (strcmp(str,"music.wav")==0) {ret=0;}
	return ret;
}
void audio_music_play(char *file)
{
	if (music != NULL)
	{
		Mix_FreeMusic(music);
	}
	music = Mix_LoadMUS(file);
	if (!music)
	{
		printf("mixer: music error:%s\n",Mix_GetError());
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
		audio_music_play("audio/overworld.wav");
	}
	//Underworld.
	if (lc>=256)
	{
		audio_music_play("audio/dungeon1.wav");
	}
	
}

	/*
	void audioCallback(void* userdata, Uint8* stream, int len)
{
	//source: ChatGPT.
    AudioData* audiodata = (AudioData*)userdata;
    if (audiodata->position >= audiodata->length)
	{
        audiodata->position = 0;  // Reset position to the beginning of the buffer
    }
    Uint32 remainingBytes = audiodata->length - audiodata->position;
    Uint32 bytesToCopy = len < remainingBytes ? len : remainingBytes;
    SDL_memcpy(stream, audiodata->buffer + audiodata->position, bytesToCopy);
    audiodata->position += bytesToCopy;
}
void play_WAV(const char* wavfile,SDL_AudioSpec spec,Uint8 *wavbuffer,int wavlength)
{
	/*
	if (SDL_LoadWAV(wavfile,&wavspec,&wavbuffer,&wavlength)==0)
	{
		printf("play_WAV failed");
	}
	//
	
}
	const char *wavfile="music.wav";
	SDL_AudioSpec wavspec;
	Uint8 *wavbuffer;
	Uint32 wavlength;
	if (SDL_LoadWAV(wavfile, &wavspec, &wavbuffer, &wavlength) == NULL) 
	{
        printf("Failed to load WAV file: %s\n", SDL_GetError());
        return;
    }
	AudioData audiodata;
    audiodata.buffer = wavbuffer;
    audiodata.length = wavlength;
    audiodata.position = 0;
	wavspec.callback = audioCallback;
    wavspec.userdata = &audiodata;
	
	SDL_AudioDeviceID deviceid;
	deviceid = SDL_OpenAudioDevice(NULL,0,&wavspec,NULL,0);
	if (deviceid == 0)
	{
        printf("Failed to open audio device: %s\n", SDL_GetError());
        SDL_FreeWAV(wavbuffer);
        return;
    }
	SDL_QueueAudio(deviceid,wavbuffer,wavlength);
	SDL_PauseAudioDevice(deviceid,0);//0 is unpause
	//SDL_MixAudioFormat(wavbuffer,wavbuffer,AUDIO_S16,wavlength,32);
	//play_WAV(wavfile,&wavspec,&wavbuffer,&wavlength);
	/**/