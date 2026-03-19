! src/core/kinds.f90
module kinds
    use iso_fortran_env
    implicit none

    integer, parameter :: sp = real32
    integer, parameter :: dp = real64
    integer, parameter :: qp = real128

    integer, parameter :: wp = dp

    integer, parameter :: i4 = int32
    integer, parameter :: i8 = int64

end module kinds