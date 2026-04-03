module scheme
    use kinds
    implicit none

    integer :: Q, D
    integer(i4), allocatable :: LATTICE_VELOCITIES(:,:)
    real(wp), allocatable :: LATTICE_WEIGHTS(:)


contains
    subroutine scheme_init(name)
        character(len=*), intent(in) :: name
        
        select case(trim(name))
        case ('D2Q5')
            allocate(LATTICE_VELOCITIES(2,5), LATTICE_WEIGHTS(5))
            include 'd2q5.f90'
        case ('D2Q9')
            allocate(LATTICE_VELOCITIES(2,9), LATTICE_WEIGHTS(9))
            include 'd2q9.f90'
        case ('D3Q15')
            allocate(LATTICE_VELOCITIES(3,15), LATTICE_WEIGHTS(15))
            include 'd3q15.f90'
        case ('D3Q19')
            allocate(LATTICE_VELOCITIES(3,19), LATTICE_WEIGHTS(19))
            include 'd3q19.f90'
        case ('D3Q27')
            allocate(LATTICE_VELOCITIES(3,27), LATTICE_WEIGHTS(27))
            include 'd3q27.f90'
        case default
            error stop "Unknown scheme: " // trim(name)
        end select
    end subroutine
end module scheme