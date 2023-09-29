/**
* @file savegame.c
* @brief Implements savegame.h
*/

#include "everything.h"

int SAVEGAME_SIZE=0x100;
char* SAVEGAME_NAME="savegame.dat";

//Offsets.
int off_mapvisit   = 0x00;
int off_chats      = 0x40;
int off_quizzes    = 0x60;
int off_cutscenes  = 0x68;
int off_quests     = 0x70;
int off_events     = 0x78;
int off_photos     = 0x7C;
int off_player     = 0x80;
int off_collectable= 0x86;
int off_statistics = 0x90;
int off_username   = 0xA0;
int off_questprog  = 0xB0;
int off_inventory  = 0xC0;
int off_dungeonkeys= 0xD0;
int off_E0         = 0xE0;
int off_variables  = 0xF0;
int off_flags      = 0xF1;
int off_flag_tele  = 0;
int off_flag_gate  = 1;


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
	int vv=0x00;
	for (int i=0; i<SAVEGAME_SIZE; i++)
	{
		vv=(i==0x82)?(0xC2):(0x00);//player start level.
		fputc(vv,fil);
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
	level_prev = level_cur;
	savegame_set_mapvisit(level_cur);
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
void savegame_set_lvl(word lvl) {savegame_data[off_player+2] = lvl;}
int savegame_get_key(int id) {return savegame_data[off_dungeonkeys+(id%16)];}
void savegame_add_key(int id,int am)
{
	id%=16;
	int tmp=savegame_get_key(id)+am;
	tmp=(tmp>=16)?(15):(tmp);
	tmp=(tmp<0)?(0):(tmp);
	savegame_data[off_dungeonkeys+id]=tmp;
}
int savegame_get_gate(int id) {return BG(savegame_data[off_variables+0],id&7);}
void savegame_set_gate(int id,int v) {savegame_data[off_variables+0]=BS(savegame_data[off_variables+0],id,v);}
void savegame_flip_gate(int id) {savegame_data[off_variables+0]=BT(savegame_data[off_variables+0],id);}
int savegame_get_flag_tele() {return BG(savegame_data[off_flags],off_flag_tele);}
void savegame_set_flag_tele(int v) {savegame_data[off_flags]=BS(savegame_data[off_flags],off_flag_tele,v);}
int savegame_get_flag_gate() {return BG(savegame_data[off_flags],off_flag_gate);}
void savegame_set_flag_gate(int v) {savegame_data[off_flags]=BS(savegame_data[off_flags],off_flag_gate,v);}
int savegame_get_cutscene(int id)
{
	return savegame_data[off_cutscenes+id/8]>>id%8&1;
}
void savegame_set_cutscene(int id)
{
	int mid=64;
	id=(id>mid)?(mid-1):((id<0)?(0):(id));
	byte tmp=savegame_data[off_cutscenes+id/8];
	savegame_data[off_cutscenes+id/8]=tmp|1<<id%8;
}
int savegame_get_collectable(int id)
{
	id%=16;
	return savegame_data[off_collectable+id/8]>>id%8&1;
}
void savegame_set_collectable(int id)
{
	id%=16;
	byte tmp=savegame_data[off_collectable+id/8];
	savegame_data[off_collectable+id/8]=tmp|1<<id%8;
}
int savegame_get_mapvisit(int id)
{
	id%=512;
	return (savegame_data[off_mapvisit+id/8]>>(id%8))&1;
}
void savegame_set_mapvisit(int id)
{
	id%=512;
	byte tmp=savegame_data[off_mapvisit+id/8];
	savegame_data[off_mapvisit+id/8]=tmp|(1<<(id%8));
}
int savegame_get_photo(int id)
{
	id%=32;
	return (savegame_data[off_photos+id/8]>>(id%8))&1;
}
int savegame_count_photo()
{
	int ret=0;
	for (int i=0; i<32; i++) {ret += savegame_get_photo(i);}
	return ret;
}
void savegame_set_photo(int id)
{
	id%=32;
	byte tmp=savegame_data[off_photos+id/8];
	savegame_data[off_photos+id/8]=tmp|(1<<(id%8));
}