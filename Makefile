# Makefile for Babylonian Square Roots 

CC = cobc
CFLAGS = -free -O -Wall

build: sqrt sub-sqrt

sqrt: sqrt.cob
	$(CC) -x $(CFLAGS) sqrt.cob

sub-sqrt: sub-sqrt.cob
	$(CC) -m $(CFLAGS) sub-sqrt.cob

clean:
	rm -f sqrt *.dylib *.so