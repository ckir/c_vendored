# Simple Makefile for ANSIFilter
# This file will compile the ansifilter binary.
# See INSTALL for instructions.

# afl-g++ for preparing fuzzing tests

CXX ?= g++
#CC ?= clang++

# Added -std=c++11 because of auto_ptr to unique_ptr transition
CXXFLAGS := -Wall -O2 -DNDEBUG -std=c++11 -fPIC -D_FILE_OFFSET_BITS=64 $(CXXFLAGS)

SOURCES=arg_parser.o stringtools.o cmdlineoptions.o main.o platform_fs.o\
codegenerator.o htmlgenerator.o pangogenerator.o texgenerator.o latexgenerator.o rtfgenerator.o svggenerator.o\
plaintextgenerator.o bbcodegenerator.o elementstyle.o stylecolour.o

OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=ansifilter

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(LDFLAGS) $(EXTRA_LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $(EXTRA_CXXFLAGS) $< -o $@

clean:
	@rm -f *.o
	@rm -f ./ansifilter
	@rm -f ./qt-gui/*.o
	@rm -f ./qt-gui/.qmake.stash
	@rm -f ./qt-gui/ansifilter-gui
	@rm -f ./.deps/*
