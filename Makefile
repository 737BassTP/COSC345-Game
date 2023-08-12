WORKDIR = $(subst /cygdrive/c,C:,$(CURDIR))
SDL2 = $(WORKDIR)\SDL2
SDL2b = C:\Users\Thomas Pedersen\Documents\UiT\UTV-0001\University of Otago\COSC345 - Game\SDL2

CC = gcc
CFLAGS = -Wall -Wextra -lmingw32 -lSDL2main -lSDL2 -lSDL2_image -lSDL2_ttf -g $(shell sdl2-config --cflags --libs)
PROGRAM = main

SRCDIR = ./src/

HEADERS = $(PROGRAM).h
SOURCES = $(SRCDIR)$(PROGRAM).c $(SRCDIR)enemy.c $(SRCDIR)menu.c $(SRCDIR)quiz.c $(SRCDIR)ui.c

all:
	@echo $(WORKDIR)
	$(CC) -std=c17 $(SOURCES) -I "$(SDL2)\include" -L "$(SDL2)\lib" $(CFLAGS) -o $(PROGRAM)
	@echo Build succeeded!
asm:
	gcc $(SOURCES) -O0 -S -o $(PROGRAM).s -masm=intel $<
	
clean:
	rm -rf *.exe *.s
	
run:
	./$(PROGRAM).exe

obsolete_1:
	gcc -std=c17 main.c -I "C:\Users\Thomas Pedersen\Documents\UiT\UTV-0001\University of Otago\COSC345 - Game\SDL2\include" -L "C:\Users\Thomas Pedersen\Documents\UiT\UTV-0001\University of Otago\COSC345 - Game\SDL2\lib" -Wall -Wextra -lmingw32 -lSDL2main -lSDL2 -o main
obsolete_2:
	@echo $(WORKDIR)
	gcc -std=c17 $(PROGRAM).c -I "$(SDL2)\include" -L "$(SDL2)\lib" -Wall -Wextra -lmingw32 -lSDL2main -lSDL2 -lSDL2_image -g `sdl2-config --cflags --libs` -o $(PROGRAM)

