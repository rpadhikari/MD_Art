! Subroutine to integrate equation of motion
! using Leap Frog Method
subroutine lfs
  use paramet, only : nAtom, r, rv, ra, deltaT
  implicit none
  integer(2) k, n
  do n = 1, nAtom
     do k = 1, 3
        rv(k,n) = rv(k,n) + deltaT * ra(k,n)! Velocity 
        r(k,n) = r(k,n) + deltaT * rv(k,n) ! Position
     end do
  end do
end subroutine lfs

