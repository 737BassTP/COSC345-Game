#include "everything.h"

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
	/**/
}
void music_bootup()
{
	
}
void music_free()
{
	
}