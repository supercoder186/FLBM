module collision
    use kinds
    implicit none

    type, abstract :: collision_t
    contains
        procedure(collide), deferred :: collide
    end type

    abstract interface
        subroutine collide(self, f, f_eq, rho, u, tau, f_star)
            import collision_t, wp
            class(collision_t), intent(inout) :: self
            real(wp), intent(inout) :: f(:, :, :)
            real(wp), intent(inout) :: f_eq(:, :, :)
            real(wp), intent(inout) :: rho(:, :, :)
            real(wp), intent(inout) :: u(:, :, :)
            real(wp), intent(inout) :: tau
            real(wp), intent(inout) :: f_star(:, :, :)

        end subroutine
    end interface


end module collision