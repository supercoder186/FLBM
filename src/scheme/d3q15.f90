module d3q15
    use kinds
    implicit none

    integer(i4), parameter :: Q = 15
    integer(i4), dimension(3, 15) :: LATTICE_VELOCITIES = reshape( &
    [   0, +1, -1,  0,  0,  0,  0, +1, -1, +1, -1, +1, -1, -1, +1, &
        0,  0,  0, +1, -1,  0,  0, +1, -1, +1, -1, -1, +1, +1, -1, &
        0,  0,  0,  0,  0, +1, -1, +1, -1, -1, +1, +1, -1, +1, -1], &
    shape=[3, 15], order=[2, 1])

end module d3q15
