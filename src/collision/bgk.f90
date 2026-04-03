module bgk
    use collision
    use kinds
    implicit none

    type, extends(collision_t) :: bgk_t
    contains
        procedure :: collide => bgk_collide
    end type

contains

    subroutine bgk_collide(self, f, f_eq, rho, u, tau, f_star)
        class(bgk_t), intent(inout) :: self
        real(wp), intent(inout) :: f(:, :, :)
        real(wp), intent(inout) :: f_eq(:, :, :)
        real(wp), intent(inout) :: rho(:, :, :)
        real(wp), intent(inout) :: u(:, :, :)
        real(wp), intent(inout) :: tau
        real(wp), intent(inout) :: f_star(:, :, :)

        f_star = f - (f - f_eq) / tau

    end subroutine

end module bgk