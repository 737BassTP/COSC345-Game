WORKDIR = $(subst /cygdrive/c,C:,$(CURDIR))
SDL2 = $(WORKDIR)\SDL2
SDL2b = C:\Users\Thomas Pedersen\Documents\UiT\UTV-0001\University of Otago\COSC345 - Game\SDL2

CC = gcc
CFLAGS = -Wall -Wextra -lmingw32 -lSDL2main -lSDL2 -lSDL2_image -g `sdl2-config --cflags --libs`
PROGRAM = main

HEADERS = main.h
SOURCES = main.c

all:
	@echo $(WORKDIR)
	$(CC) -std=c17 $(PROGRAM).c -I "$(SDL2)\include" -L "$(SDL2)\lib" $(CFLAGS) -o $(PROGRAM)
	$(MAKE) asm
	@echo Build succeeded!
asm:
	gcc $(PROGRAM).c -O0 -S -o $(PROGRAM).s $<
	
clean:
	rm -rf *.exe *.s

obsolete_1:
	gcc -std=c17 main.c -I "C:\Users\Thomas Pedersen\Documents\UiT\UTV-0001\University of Otago\COSC345 - Game\SDL2\include" -L "C:\Users\Thomas Pedersen\Documents\UiT\UTV-0001\University of Otago\COSC345 - Game\SDL2\lib" -Wall -Wextra -lmingw32 -lSDL2main -lSDL2 -o main
obsolete_2:
	@echo $(WORKDIR)
	gcc -std=c17 $(PROGRAM).c -I "$(SDL2)\include" -L "$(SDL2)\lib" -Wall -Wextra -lmingw32 -lSDL2main -lSDL2 -lSDL2_image -g `sdl2-config --cflags --libs` -o $(PROGRAM)

