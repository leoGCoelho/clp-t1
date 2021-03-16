#Just for tests

CC=gcc
F90=gfortran

CFLAGS=-c
FFLAGS=-ffree-form -c
FFLAGSO=-o

all: fortran

#Fortran files .o
toto.o: $(F90) $(FFLAGS) toto.f

#C files .o
toto.o: toto.f
	$(CC) $(CFLAGS) totoc.c

totoc.o: totoc.c
	$(CC) $(CFLAGS) totoc.c

test: toto.o totoc.o
	$(F90) $(FFLAGSO) test toto.o totoc.o 

fortran: test
	./test

clean:
	rm -rf *.o test