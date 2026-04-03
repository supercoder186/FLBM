module d2q5
    use kinds
    implicit none

    integer(i4), parameter :: Q = 5
    integer(i4), dimension(2, 5) :: LATTICE_VELOCITIES = reshape( &
    [   0, +1,  0, -1,  0, &
        0,  0, +1,  0, -1], &
    shape=[2, 5], order=[2, 1])

end module d2q5
