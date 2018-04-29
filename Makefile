all:
	gfortran -std=f2008 -O3 -Wall -pedantic -fimplicit-none -c matrix_operations.f90
	gfortran -std=f2008 -O3 -Wall -pedantic -fimplicit-none -c program.f90
	gfortran -std=f2008 -O3 -Wall -pedantic -fimplicit-none matrix_operations.o program.o -o program
	make clean
clean:
	rm -f *.o
	rm -f *.mod
	rm -f *.mod0
