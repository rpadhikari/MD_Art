! main program for md simulation
program main
  use paramet
  implicit none
  call readinput
  call SetParams
  call AllocArrays
  call InitCoords
  call InitVels
  call ComputeForces
  open(3,file='devs',access='append')
  write(3,91) density, uSum
  close(3)
  91 format(f6.3,  f16.6)
  call DeallocArrays
end program main

