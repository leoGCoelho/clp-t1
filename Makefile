#Just for tests

CC=gcc
F90=gfortran

CFLAGS=-c
FFLAGS=-ffree-form -c
FFLAGSO=-o

all: fortran

#Fortran files .o
fmodule.o: fmodule.f90
	$(F90) $(CFLAGS) fmodule.f90

#C files .o
#cmod.o: fmodule.f90
#	$(CC) $(CFLAGS) cmodule.c

cmodule.o: cmodule.c
	$(CC) $(CFLAGS) cmodule.c

test: fmodule.o cmodule.o
	$(F90) $(FFLAGSO) test cmodule.o fmodule.o 

run: test
	./test

clean:
	rm -rf *.o test