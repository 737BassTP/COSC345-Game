/**
* @file savegame.h
* @brief Defines savegame behaviour.
*/

/*
TODO:
	Quests.

Savegame format:
	$00-$3F: Levels visited (by ID; 512)
	$40-$5F: Chats read (by ID; 256)
	$60-$67: Quizzes won (by ID; 64)
	$68-$6F: Cutscenes viewed (by ID; 64).
	$70-$77: Quests done (by ID; 64)
	$78-$7B: Events visited (by ID; 32)
	$7C-$7F: Photographies unlocked (by ID; 32)
	$80-$8F: Player variables.
		$80    : x
		$81    : y
		$82-$83: level
			b0-b8: level 0-511
				b8: 0=overworld, 1=underworld
			b9-bF: ? (7-bit)
		$84    : lives (?)
		$85    : health
		$86-$87: collectables (16x).
		$88-$8B: nutrient stats
			$88: Carbohydrates
			$89: Fat
			$8A: Protein
			$8B: Alcohol
		$8C-$8D: Milestones completed.
		$8E-$8F: ?
	$90-$9F: Statistics.
		$90-$91: Enemies killed (total).
		$92-$9B: ?
		$9C-$9D: Seconds in-game; story (stop counter after defeating final boss).
		$9E-$9F: Seconds in-game; 100% (stop counter after unlocking everything).
	$A0-$AF: Player name (16 characters)
	$B0-$BF: Quest progress.
		$B0-$B1: Quest 1/8
			$B0: Quest ID.
			$B1: Tasks done.
		$B2-$BF: etc...
	$C0-$CF: Inventory, standard (16x items; max 255 since 0 is valid)
	$D0-$DF: Inventory, dungeon keys.
	$E0-$EF: Music timers (max 65536 seconds and 8 musics).
		$E0-$E1: "overworld.wav"
		$E2-$EF: etc...
	$F0-$FE: Variables (15 bytes)
		$F0    : Dungeon gates are open/closed (8 bools).
		$F1    : Flags
			b0   : Cannot teleport.
			b1   : Cannot flip gate.
			b2-b7: ?
		$F2-$FE: ?
	$FF    : Checksum (basic)
*/

#ifndef savegame_h
#define savegame_h

#include "everything.h"

byte savegame_data[256];

int savegame_exists(char *fpath);
void savegame_new();
void savegame_load();
void savegame_save();
void savegame_quiz_write(int quizid);
int savegame_quiz_read(int quizid);
void savegame_username_write(char *name);
char* savegame_username_read(char *name);
void savegame_checksum_write();
int savegame_checksum_read();
void savegame_set_pos(byte x,byte y);
void savegame_set_lvl(word lvl);
int savegame_get_key(int id);
void savegame_add_key(int id,int am);
int savegame_get_gate(int id);
void savegame_set_gate(int id,int v);
void savegame_flip_gate(int id);
int savegame_get_flag_tele();
void savegame_set_flag_tele(int v);
int savegame_get_flag_gate();
void savegame_set_flag_gate(int v);
int savegame_get_cutscene(int id);
void savegame_set_cutscene(int id);
int savegame_get_collectable(int id);
void savegame_set_collectable(int id);
//int savegame_get_(int id);
//void savegame_set_(int id);

#endif