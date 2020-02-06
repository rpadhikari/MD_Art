! This subroutine reads input parameters from file input
subroutine readinput
  use paramet, only : initUcell, density, temperature, deltaT, stepLimit
  implicit none
  integer(2) :: i
  open(20, file='input', status='old', action='read')
  open(30, file='density.dat', status='old', action='read')
  read(20,*) (initUcell(i), i = 1, 3)
  read(30,*) density
  read(20,*) temperature
  read(20,*) deltaT
  read(20,*) stepLimit
  close(20)
  close(30)

end subroutine readinput
