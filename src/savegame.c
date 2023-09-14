/**
* @file savegame.c
* @brief Implements savegame.h
*/

#include "everything.h"

int SAVEGAME_SIZE=0x100;
char* SAVEGAME_NAME="savegame.dat";

//Offsets.
int off_mapvisit   = 0x00;
int off_quizzes    = 0x40;
int off_60         = 0x60;
int off_player     = 0x80;
int off_statistics = 0x90;
int off_username   = 0xA0;
int off_inventory  = 0xB0;
int off_C0         = 0xC0;

//Savegame array.
byte savegame_data[256];

//Functions.
int savegame_exists(char *fpath)
{
	int ret=0;
	FILE *fil = fopen(fpath,"rb");
	if (fil)
	{
		ret=1;
	}
	fclose(fil);
	return ret;
}
void savegame_new()
{
	FILE* fil = fopen(SAVEGAME_NAME,"wb");
	for (int i=0; i<SAVEGAME_SIZE; i++)
	{
		fputc(0x00,fil);
	}
	fclose(fil);
}
void savegame_load()
{
	if (!savegame_exists(SAVEGAME_NAME))
	{
		savegame_new();
	}
	FILE* fil = fopen(SAVEGAME_NAME,"rb");
	for (int i=0; i<SAVEGAME_SIZE; i++)
	{
		savegame_data[i] = fgetc(fil);
	}
	fclose(fil);
	//TODO: Update variables with loaded data, e.g player position and level.
	level_cur = (int)savegame_data[off_player+2];
}
void savegame_save()
{
	FILE* fil = fopen(SAVEGAME_NAME,"wb");
	for (int i=0; i<SAVEGAME_SIZE; i++)
	{
		fputc(savegame_data[i],fil);
	}
	fclose(fil);
}
/*
TODO: Rewrite functions below from FILE to byte array (remove laziness).
*/
void savegame_quiz_write(int quizid)
{
	quizid &= 0xFF;
	FILE* fil = fopen(SAVEGAME_NAME,"wb");
	fseek(fil,(long int)(off_quizzes+quizid/8),SEEK_SET);
	int val=fgetc(fil);
	fseek(fil,(long int)-1,SEEK_CUR);
	val |= quizid%8;
	fputc(val,fil);
	fclose(fil);
	savegame_load();//lazy
}
int savegame_quiz_read(int quizid)
{
	int ret=0;
	quizid &= 0xFF;
	FILE* fil = fopen(SAVEGAME_NAME,"rb");
	fseek(fil,(long int)(off_quizzes+quizid/8),SEEK_SET);
	ret = (fgetc(fil)>>(quizid%8))&1;
	fclose(fil);
	savegame_load();//lazy
	return ret;
}
void savegame_username_write(char *name)
{
	FILE* fil = fopen(SAVEGAME_NAME,"wb");
	fseek(fil,(long int)off_username,SEEK_SET);
	int len = min_int(2,16,strlen(name));
	for (int i=0; i<len; i++)
	{
		fputc(name[i],fil);
	}
	fclose(fil);
	savegame_load();//lazy
}
char* savegame_username_read(char *name)
{
	char ret[16];
	FILE* fil = fopen(SAVEGAME_NAME,"rb");
	fseek(fil,(long int)off_username,SEEK_SET);
	for (int i=0; i<16; i++)
	{
		ret[i]=fgetc(fil);
	}
	fclose(fil);
	savegame_load();//lazy
	return *ret;
}
void savegame_checksum_write()
{
	FILE* fil = fopen(SAVEGAME_NAME,"wb");
	int tmp=0;
	for (int i=0; i<SAVEGAME_SIZE-1; i++)
	{
		tmp += fgetc(fil);
	}
	fputc(tmp&0xFF,fil);
	fclose(fil);
	savegame_load();//lazy
}
int savegame_checksum_read()
{
	//Returns 1 if checksum succeeds; 0 if not.
	FILE* fil = fopen(SAVEGAME_NAME,"rb");
	int tmp=0;
	for (int i=0; i<SAVEGAME_SIZE-1; i++)
	{
		tmp += fgetc(fil);
	}
	tmp&=0xFF;
	int cs = fgetc(fil);
	fclose(fil);
	savegame_load();//lazy
	return (int)(tmp==cs);
}
void savegame_set_pos(byte x,byte y)
{
	savegame_data[off_player+0] = x;
	savegame_data[off_player+1] = y;
}
void savegame_set_lvl(word lvl)
{
	savegame_data[off_player+2] = lvl;
}