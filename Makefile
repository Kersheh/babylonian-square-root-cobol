# Makefile for Babylonian Square Roots 

CC = cobc
CFLAGS = -x -free -O -Wall

build: sqrt.cob
	$(CC) $(CFLAGS) sqrt.cob

clean:
	rm -f sqrt