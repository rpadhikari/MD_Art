! This subroutine initializes atomic positions according to a uniform distribution inside region
subroutine InitCoords
  use paramet, only : r, region, regionH, initUcell
  implicit none
  integer(4) nX, nY, nZ, n, k
  real(8) c(3), gap(3)

! the unit cell size along x-,y- and z-directions
  do k=1,3
    gap(k)=region(k)/initUcell(k)
  end do

! initializing array of atomic positions
  n = 0 ! atom counter
  do nZ = 1,initUcell(3)
    c(3) = (nZ-0.50d0)*gap(3)-regionH(3)
    do nY = 1,initUcell(2)
      c(2) = (nY-0.50d0)*gap(2)-regionH(2)
      do nX =1, initUcell(1)
        c(1) = (nX-0.50d0)*gap(1)-regionH(1)
        n = n+1
        do k=1,3
          r(k,n)=c(k)
        end do
      end do
    end do
  end do

end subroutine InitCoords

