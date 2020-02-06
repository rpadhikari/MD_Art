module paramet
  implicit none
  integer(4) nAtom        ! total number of atoms 
  integer(4) stepCount    ! MD step counter
  integer(4) stepLimit    ! maximum MD step
  integer(4) initUcell(3) ! array that stores number of unit cell along x,y,z

  real(8) deltaT       ! MD step
  real(8) temperature  ! temperature
  real(8) density      ! atom density in simulation box
  real(8) kinEnergy    ! kinetic energy
  real(8) potEnergy    ! potential energy
  real(8) totEnergy    ! Total energy (Kinetic + Potential)
  real(8) rCut         ! cutoff radius in L-J Potential
  real(8) pi           ! pi = 3.14159... 
  real(8) vMag         ! renormalizing factor for velocity
  real(8) uSum         ! potential energy for the whole system
  
  real(8) region(3)    ! the length of the simulation box along x-, y- and z-
  real(8) regionH(3)   ! half of the simulation box lengths along x-, y- and z-
  
  real(8),allocatable:: r(:,:) ! 2D array that stores coordinates of atoms 
  real(8),allocatable:: rv(:,:)! 2D array that stores velocities of atoms 
  real(8),allocatable:: ra(:,:)! 2D array that stores accelerations of atoms 
end module paramet

