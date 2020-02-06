! This subrouting initializes the velocities of atoms
subroutine InitVels
use paramet
implicit none
  integer(4) i, iseed
  real(8) vSum(3)
  real(8) x, y, z, rvx, rvy, rvz
  iseed = 12837361
  vSum = 0.0d0
  do i = 1, nAtom
    call randVel(x,y,z)
! write(*,*)dsqrt(x*x+y*y+z*z)
! renormalizing velocities to achieve desired temperatures
    rv(1,i) = vMag*x
    rv(2,i) = vMag*y
    rv(3,i) = vMag*z
! total momentum along x, y and z-directions
    vSum(1) = vSum(1)+rv(1,i)
    vSum(2) = vSum(2)+rv(2,i)
    vSum(3) = vSum(3)+rv(3,i)
  end do
!write(*,*) vSum(1)+vSum(2)+vSum(3)
  vSum = vSum/nAtom ! momentum per atom
! ensure that that the center of mass is stationary
  rvx=0.0d0
  rvy=0.0d0
  rvz=0.0d0
  do i=1,nAtom
    rv(1,i) = rv(1,i)-vSum(1)
    rv(2,i) = rv(2,i)-vSum(2)
    rv(3,i) = rv(3,i)-vSum(3)
    rvx=rvx+rv(1,i)
    rvy=rvy+rv(2,i)
    rvz=rvz+rv(3,i)
  end do
contains
! subroutine that generates random vector (x,y,z) with magnitude 1.0
  subroutine randVel(x,y,z)
  implicit none
  real(8) x0,y0,z0,x,y,z
  do
    x0 = ran(iseed)
    y0 = ran(iseed)
    x0 = 1.0d0-2.0d0*x0
    y0 = 1.0d0-2.0d0*y0
    z0 = x0*x0+y0*y0
    if(z0 < 1.0d0) then
      x = 2.0d0*x0*dsqrt(1.0d0-z0)
      y = 2.0d0*y0*dsqrt(1.0d0-z0)
      z = 1.0d0-2.0d0*z0
      exit
    else
    cycle
      end if
  end do
end subroutine randVel
end subroutine InitVels
