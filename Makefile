CC=gcc
LD=ld
CFLAGS=-I.
DEPS = libbamboo.h
LDIR =./lib

LIBS = -lbamboo_core

default: swig
	$(CC) -c libbamboo_wrap.c $(shell pkg-config --cflags --libs python2) -fPIC
	$(LD) -shared -L ./lib libbamboo_wrap.o -l bamboo_core -o _libbamboo.so

swig:
	swig -python libbamboo.i

clean: 
	rm *.so *.o
