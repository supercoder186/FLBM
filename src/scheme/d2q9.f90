D = 2; Q = 9
LATTICE_VELOCITIES = reshape( &
[   0, +1,  0, -1,  0, +1, -1, -1, +1, &
    0,  0, +1,  0, -1, +1, +1, -1, -1], &
shape=[2, 9], order=[2, 1])

LATTICE_WEIGHTS = [ &
    4.0_wp/9, &
    1.0_wp/9, 1.0_wp/9, 1.0_wp/9, 1.0_wp/9, &
    1.0_wp/36, 1.0_wp/36, 1.0_wp/36, 1.0_wp/36 &
]
