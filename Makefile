##############################################################
#  Makefile for ansi2png 0.9.11 -- by Vince Weaver           #
#                                                            #
#  To modify for your configuration, add or remove the #     #
#                                                            #
##############################################################

#Your compiler.  If gcc doesn't work, try CC
CC = gcc

#You need the "gd" gif library, available from 
# http://www.boutell.com/gd/
#
# Either install it, or else point the options below to point to the location
# of the library and include files.
#GD_L_OPTS = -L/usr/lib 
#GD_C_OPTS = -I/usr/include

#Standard compiler and library options

C_OPTS = $(GD_C_OPTS) -O2 -Wall
 
L_OPTS = $(GD_L_OPTS) -lgd -lm


# DO NOT EDIT BELOW THIS LINE

all:	ansi2png

clean:
	rm -f *.o
	rm -f ansi2png
	rm -f *~

install:	ansi2png
	cp ansi2png /usr/local/bin
	
ansi2png:	ansi2png.o whirlgif.o gifdecod.o gifencod.o gifdecod.o
	$(CC) -o ansi2png ansi2png.o whirlgif.o gifencod.o gifdecod.o $(L_OPTS)
	@strip ansi2png

whirlgif.o:	whirlgif.c
	$(CC) $(C_OPTS) -c whirlgif.c
	
gifdecod.o:	gifdecod.c
	$(CC) $(C_OPTS) -c gifdecod.c

gifencod.o:	gifencod.c
	$(CC) $(C_OPTS) -c gifencod.c

ansi2png.o:	ansi2png.c
	$(CC) $(C_OPTS) -c ansi2png.c 
