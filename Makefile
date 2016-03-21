# Makefile for Babylonian Square Roots 

CC = cobc
CFLAGS = -x -free -O -Wall
DIRS = nums
FILES = $(wildcard $(DIRS:=/*.txt))

build: sqrt.cob
	$(CC) $(CFLAGS) sqrt.cob

test: nums
	@for file in $(FILES) ; do \
		echo File: $$file ; \
		cp $$file sqrt.dat ; \
		./sqrt ; \
	done

clean:
	rm -f sqrt *.dat