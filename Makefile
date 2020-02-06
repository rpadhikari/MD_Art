FC=gfortran -c # fortran compiler
LD=gfortran
SRC=paramet.f90 main.f90 read.f90 SetParams.f90 AllocArrays.f90 InitCoords.f90 InitVels.f90 ComputeForces.f90 DeallocArrays.f90
OBJ=paramet.o main.o read.o SetParams.o AllocArrays.o InitCoords.o InitVels.o ComputeForces.o DeallocArrays.o
md:
	$(FC) $(SRC)
	$(LD) $(OBJ) -o md.x
	rm -rf $(OBJ)
clean:
	rm -rf $(OBJ) *.mod md.x
