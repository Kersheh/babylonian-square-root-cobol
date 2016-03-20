# Makefile for Babylonian Square Roots 

CC = cobc
CFLAGS = -x -free -O -Wall

build:
	$(CC) $(CFLAGS) sqrt.cob -o sqrt

clean:
	rm -f sqrt