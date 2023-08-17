WORKDIR = $(subst /cygdrive/c,C:,$(CURDIR))
SDL2 = $(WORKDIR)\SDL2
SDL2b = C:\Users\Thomas Pedersen\Documents\UiT\UTV-0001\University of Otago\COSC345 - Game\SDL2

CC = gcc
CFLAGS = -Wall -Wextra -lmingw32 -lSDL2main -lSDL2 -lSDL2_image -lSDL2_ttf -g $(shell sdl2-config --cflags --libs)

SRCDIR = ./src/

HEADERSa = 
HEADERSb = $(SRCDIR)everything.h $(SRCDIR)functions.h $(SRCDIR)game.h $(SRCDIR)main.h $(SRCDIR)audio.h $(SRCDIR)player.h $(SRCDIR)enemy.h $(SRCDIR)menu.h $(SRCDIR)quiz.h $(SRCDIR)ui.h
SOURCES =                        $(SRCDIR)functions.c $(SRCDIR)game.c $(SRCDIR)main.c $(SRCDIR)audio.c $(SRCDIR)player.c $(SRCDIR)enemy.c $(SRCDIR)menu.c $(SRCDIR)quiz.c $(SRCDIR)ui.c
HEADERS = $(HEADERSb)

all:
	@echo $(WORKDIR)
	$(CC) -std=c17 $(HEADERS) $(SOURCES) -I "$(SDL2)\include" -L "$(SDL2)\lib" $(CFLAGS) -o main
	@echo Build succeeded!
asm:
	gcc $(SOURCES) -O0 -S -o main.s -masm=intel $<
	
clean:
	rm -rf *.exe *.s
	
check:
	@echo TODO: Self-tests.
	
distcheck:
	@echo TODO: todo.
	
run:
	./main.exe

obsolete_1:
	gcc -std=c17 main.c -I "C:\Users\Thomas Pedersen\Documents\UiT\UTV-0001\University of Otago\COSC345 - Game\SDL2\include" -L "C:\Users\Thomas Pedersen\Documents\UiT\UTV-0001\University of Otago\COSC345 - Game\SDL2\lib" -Wall -Wextra -lmingw32 -lSDL2main -lSDL2 -o main
obsolete_2:
	@echo $(WORKDIR)
	gcc -std=c17 $(PROGRAM).c -I "$(SDL2)\include" -L "$(SDL2)\lib" -Wall -Wextra -lmingw32 -lSDL2main -lSDL2 -lSDL2_image -g `sdl2-config --cflags --libs` -o $(PROGRAM)

