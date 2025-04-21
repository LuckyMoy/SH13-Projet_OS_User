#!/bin/bash

# Mac Intel — Homebrew dans /usr/local
INCLUDE_FLAGS="-I/usr/local/opt/sdl2/include/SDL2 \
               -I/usr/local/opt/sdl2_image/include/SDL2 \
               -I/usr/local/opt/sdl2_ttf/include/SDL2"

LIB_FLAGS="-L/usr/local/opt/sdl2/lib \
           -L/usr/local/opt/sdl2_image/lib \
           -L/usr/local/opt/sdl2_ttf/lib"

gcc -o sh13 -Wall -Werror src/sh13.c $INCLUDE_FLAGS $LIB_FLAGS -lSDL2 -lSDL2_image -lSDL2_ttf -lpthread
gcc -o server -Wall -Werror src/server.c
