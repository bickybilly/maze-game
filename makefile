#please use 'make clean' to clean the directory of intermediate build files and the executable
#simply typing 'make' will compile all source code files to object files .o, and then link all
#object files into an executable
#we are using a lot of makefile macros

#changing platform dependant stuff, do not change this
# Linux (default)
LDFLAGS = -lGL -lGLU -lglut
CFLAGS=-g -Wall -std=c++11
CC=g++
EXEEXT=
RM=rm

# Windows (cygwin)
ifeq "$(OS)" "Windows_NT"
	EXEEXT=.exe #on windows applications must have .exe extension
	RM=del #rm command for windows powershell
    LDFLAGS = -lfreeglut -lglu32 -lopengl32
else
	# OS X
	OS := $(shell uname)
	ifeq ($(OS), Darwin)
	        LDFLAGS = -framework Carbon -framework OpenGL -framework GLUT
	endif
endif

all: maze

maze: maze.o
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)

snowman: snowman.o
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)

character: character.o
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)

camera3: camera3.o
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)

clean:
	$(RM) *.o maze$(EXEEXT)
	$(RM) *.o snowman$(EXEEXT)
	$(RM) *.o character$(EXEEXT)
	$(RM) *.o camera3$(EXEEXT)