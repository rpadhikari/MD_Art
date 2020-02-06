! This subroutine deallocates arrays
subroutine DeallocArrays
  use paramet, only : r, rv, ra
  implicit none
  deallocate(r)
  deallocate(rv)
  deallocate(ra)
end subroutine DeallocArrays
