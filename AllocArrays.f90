! This subroutine allocates arrays
subroutine AllocArrays
  use paramet, only : r, rv, ra, nAtom
  implicit none
  allocate(r(3,nAtom))
  allocate(rv(3,nAtom))
  allocate(ra(3,nAtom))
end subroutine AllocArrays
