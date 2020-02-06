! This subroutine calculates forces and potential energy for the whole system
subroutine ComputeForces
  use paramet, only : nAtom, r, rCut, rv, ra, region, regionH, uSum
  implicit none
  integer(4) j1, j2, k, n
  real(8) dr(3), f, fcVal, rrCut, rr, rri, rri3
  rrCut = rCut*rCut
! zero out all the array elements
  ra   = 0.0d0
  uSum = 0.0d0
    do j1 = 1, nAtom-1   ! these two loops go over all different atomic pairs
    do j2 = j1+1, nAtom
      rr = 0.0d0    
      do k = 1, 3 
        ! loop over x,y,z components
        dr(k) = r(k,j1)-r(k,j2) ! vector connecting particle i and j
        if (dabs(dr(k)) > regionH(k)) dr(k)=dr(k)-sign(region(k),dr(k)) !takes care of wraparound effect
        rr = rr + dr(k)*dr(k)   ! rij^2
      end do
      if (rr < rrCut) then ! check if the particles are within cutoff
        rri  = 1.0d0/rr       ! 1/rij^2
        rri3 = rri*rri*rri    ! 1/rij^6
          fcVal = 48.0d0*rri3*(rri3-0.50d0)*rri
          do k=1,3 ! loop over x,y,z components
            f = fcVal*dr(k)
            ra(k,j1) = ra(k,j1) + f  ! use fij=-fji (third Newton's law)
            ra(k,j2) = ra(k,j2) - f
         end do
         uSum = uSum+4.0d0*rri3*(rri3-1.0d0) ! potential energy
       end if
     end do
  end do
  end subroutine ComputeForces

