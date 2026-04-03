module d3q19
    use kinds
    implicit none

    integer(i4), parameter :: Q = 19
    integer(i4), dimension(3, 19) :: LATTICE_VELOCITIES = reshape( &
    [   0, +1, -1,  0,  0,  0,  0, +1, -1, +1, -1,  0,  0, +1, -1, +1, -1,  0,  0, &
        0,  0,  0, +1, -1,  0,  0, +1, -1,  0,  0, +1, -1, -1, +1,  0,  0, +1, -1, &
        0,  0,  0,  0,  0, +1, -1,  0,  0, +1, -1, +1, -1,  0,  0, -1, +1, -1, +1], &
    shape=[3, 19], order=[2, 1])

    real(wp), dimension(19) :: LATTICE_WEIGHTS = [ &
        1.0_wp/3, &
        1.0_wp/18,  1.0_wp/18,  1.0_wp/18,  1.0_wp/18,  1.0_wp/18,  1.0_wp/18, &
        1.0_wp/36, 1.0_wp/36, 1.0_wp/36, 1.0_wp/36, 1.0_wp/36, 1.0_wp/36, 1.0_wp/36, 1.0_wp/36, 1.0_wp/36, 1.0_wp/36, 1.0_wp/36, 1.0_wp/36 &
    ]

end module d3q19
