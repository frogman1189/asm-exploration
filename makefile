CC = gcc
FLAGS = -m32
EXEDIR := bin/exe
SRCDIR := src
SRC := $(addprefix $(SRCDIR)/,main.s print.s)

run : compile
	$(EXEDIR)/main

compile: $(SRC) | $(EXEDIR)
	$(CC) $(FLAGS) -o $(EXEDIR)/main $<

EXEDIR :
	mkdir -p $(EXEDIR)

SRC: | $(SRCDIR)

SRCDIR :
	mkdir -p $(SRCDIR)
