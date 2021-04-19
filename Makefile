CC=gcc
F90=gfortran

CFLAGS=-c -w
FFLAGS=-ffree-form -c
FFLAGSO=-o

all: fortran

#Fortran files .o
fmodule.o: fmodule.f90
	$(F90) $(CFLAGS) fmodule.f90

#C files .o
cmodule.o: cmodule.c
	$(CC) $(CFLAGS) cmodule.c

#Compile output files
test: fmodule.o cmodule.o
	$(F90) $(FFLAGSO) test cmodule.o fmodule.o 

#Run test
run: test
	./test

#Remove temp files
clean:
	rm -rf *.o test