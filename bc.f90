!This subroutine checks if during simulation atom
! left the box. If it happens the atom is returned 
! to the box from opposite side i. e. periodic
! Boundary Contion
subroutine bc
  use paramet, only : nAtom, r, region, regionH
  implicit none
  integer(4) n, k
  do n = 1, nAtom
    do k = 1, 3
      if(r(k,n) >= regionH(k)) then
        r(k,n) = r(k,n)-region(k)
      else if(r(k,n) < -regionH(k)) then
        r(k,n) = r(k,n) + region(k)
      end if
    end do
  end do
end subroutine bc

