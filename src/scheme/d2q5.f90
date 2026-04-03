D = 2; Q = 5

LATTICE_VELOCITIES = reshape( &
[   0, +1,  0, -1,  0, &
    0,  0, +1,  0, -1], &
shape=[2, 5], order=[2, 1])

LATTICE_WEIGHTS = [ &
    1.0_wp/3, &
    1.0_wp/6, 1.0_wp/6, 1.0_wp/6, 1.0_wp/6 &
]
