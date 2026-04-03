module d2q9
    use kinds
    implicit none

    integer(i4), parameter :: Q = 9
    integer(i4), dimension(2, 9) :: LATTICE_VELOCITIES = reshape( &
    [   0, +1,  0, -1,  0, +1, -1, -1, +1, &
        0,  0, +1,  0, -1, +1, +1, -1, -1], &
    shape=[2, 9], order=[2, 1])

    real(wp), dimension(9) :: LATTICE_WEIGHTS = [ &
        4.0_wp/9, &
        1.0_wp/9, 1.0_wp/9, 1.0_wp/9, 1.0_wp/9, &
        1.0_wp/36, 1.0_wp/36, 1.0_wp/36, 1.0_wp/36 &
    ]

end module d2q9
