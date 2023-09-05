/**
* @file savegame.h
* @brief Defines savegame behaviour.
*/

/*
TODO:
	Quests.

Savegame format:
	$00-$3F: Levels visited (by ID; 512)
	$40-$5F: Quizzes won (by ID; 256)
	$60-$6F: Chats read (by ID; 128)
	$70-$7F: Quests done (by ID; 128)
	$80-$8F: Player variables.
		$80    : x
		$81    : y
		$82-$83: level
			b0-b8: level 0-511
				b8: 0=overworld, 1=underworld
			b9-bF: ? (7-bit)
		$84    : lives (?)
		$85    : health
		$86-$8F: ?
	$90-$9F: Statistics.
		$90-$91: Enemies killed.
		$92-$9F: ?
	$A0-$AF: Player name (16 characters)
	$B0-$BF: Inventory (16x items; max 255 since 0 is valid)
	$C0-$CF: ?
	$D0-$DF: ?
	$E0-$EF: Music timers (max 65536 seconds and 8 musics).
		$E0-$E1: "overworld.wav"
	$F0-$FE: ? (15 bytes)
	$FF    : Checksum (basic)
*/

#ifndef savegame_h
#define savegame_h

#include "everything.h"

void savegame_new();
void savegame_quiz_write(int quizid);
int savegame_quiz_read(int quizid);
void savegame_username_write(char *name);
char* savegame_username_read(char *name);
void savegame_checksum_write();
int savegame_checksum_read();

#endif