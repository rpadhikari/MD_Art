! This subroutine takes care of parameters
subroutine SetParams
  use paramet, only : pi, rCut, region, regionH, initUcell, nAtom, density, vMag, temperature
  implicit none
  integer(4) k, n
  pi=4.0d0*atan(1.0d0)        
  rCut=2.0d0**(1.0d0/6.0d0)
  do k=1,3
     region(k)  = initUcell(k)/(density**(1.0d0/3.0d0))
     regionH(k) = 0.50d0*region(k)  
  end do
  nAtom = initUcell(1)*initUcell(2)*initUcell(3)
! renormalizing factor for velocity
  vMag  = sqrt(3.0d0*(1.0d0-(1.0d0/nAtom))*temperature)
end subroutine SetParams

